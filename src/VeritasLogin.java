
/**
 *
 * @author Zhen Ni
 */
import java.security.spec.*;
import javax.crypto.*;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.sql.*;
import java.io.*;
import java.util.*;
import java.text.SimpleDateFormat;

public class VeritasLogin {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {           
        try{
        	//When a user creates an account it should create an RSA signing key pair for that user /****Done****/
			File log=new File("log.txt");
            java.util.Date date = new java.util.Date();
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy h:mm:ss a");
			PrintWriter out =new PrintWriter(new BufferedWriter(new FileWriter(log, true)));
            Scanner sc = new Scanner(System.in);
            String databaseUsername = "";
            String databasePassword = "";
            
            System.out.println("Enter Username: ");         //Input Username
            String name = sc.next();
            System.out.println("Enter Password: ");         //Input Password
            String password = sc.next();
            String url="jdbc:mysql://localhost:3306/elections";
    		String user="root";
    		String pw="";
            Connection conn = DriverManager.getConnection(url, user, pw);          /*  Steven, please help me fill in this line  */
            Statement stmt = conn.createStatement();
            PreparedStatement pstmt=null;
            String query = "SELECT * from users WHERE username='"+name+"'";
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){                           //Read username & password from database
                databaseUsername = rs.getString("username");
                databasePassword = rs.getString("password");
            }
            
            /*KeyPairGenerator genRSA1=KeyPairGenerator.getInstance("RSA");
			genRSA1.initialize(3072);
			KeyPair keypair1=genRSA1.genKeyPair();
			RSAPrivateKey skAdmin1=(RSAPrivateKey)keypair1.getPrivate();
			RSAPublicKey pkAdmin1=(RSAPublicKey)keypair1.getPublic();
			byte[] skAdminBytes1=skAdmin1.getEncoded();
			byte[] pkAdminBytes1=pkAdmin1.getEncoded();
			pstmt=pstmt=conn.prepareStatement("INSERT INTO voterkeys (username, pk, sk) values (?,?,?);");
			pstmt.setString(1, name);
			pstmt.setBytes(2, pkAdminBytes1);
			pstmt.setBytes(3, skAdminBytes1);
			pstmt.execute();*/

			
			if (name.equals(databaseUsername) && password.equals(databasePassword)) {           //check username & password
                System.out.println("Successful Login!\n----");
                out.println("Time: "+sdf.format(date)+"; Event Type: Login; UserID: "+name+"; Password: "+password+"; Description: Successful Login\n");
            } else {
                System.out.println("Incorrect Username or Password!\n----");
                out.println("Time: "+sdf.format(date)+"; Event Type: Login; UserID: "+name+"; Password: "+password+"; Description: Failed Login\n");
                out.close();
                System.exit(0);
            }
            rs=stmt.executeQuery("SELECT usertype FROM elections WHERE usernames='"+name+"'");
            while(rs.next()){
            	if(rs.getString("usertype").equals("1")){
            		//use voter code
            		rs=stmt.executeQuery("SELECT * FROM elections WHERE usernames='"+name+"'");
        			System.out.println("You are eligible for the following elections:");
        			int numelections=0;
        			while(rs.next()){
        				ResultSetMetaData metadata = rs.getMetaData();
        				int columnCount = metadata.getColumnCount();
        				for(int i=3;i<=columnCount;i++){
        					if(rs.getString(i).equals("1")){
        						System.out.print((i-2)+"."+metadata.getColumnName(i)+" ");
        						numelections++;
        					}
        				}
        			}
        			if(numelections==0)
        				System.out.println("You are not currently eligible for any elections.");
        			else{
        				System.out.println("\nPlease type the election name you would like to vote in:");
        				String election=sc.next();
        				rs=stmt.executeQuery("SELECT candidateSet FROM candidates WHERE election='"+election+"'");
        				if(rs.next()){
        					System.out.println("Here are the candidates:");
        					String candidates=rs.getString(1);
        					System.out.println(candidates);
        				}
        				System.out.println("Please enter the candidate of your choice:");
        				String choice=sc.next();
        				out.println("Time: "+sdf.format(date)+"; Event Type: Vote; UserID: "+name+"; Password: "+password+"; Description: Vote cast for "+choice+"\n");
        				Vote voter=new Vote();
        				voter.vote(choice, name, election);
        			}
            	}
            	else{
            		//Ruinian's supervisor code should go here (in some form)
        			Connection con2=DriverManager.getConnection(url, user, pw);
        			Statement st2=con2.createStatement();
        			
        			String authorize;
        			String userName;
        			
        			//	String create=scan.next();
            		//if (create.equals("yes")){
            			System.out.println("Please give a name for this election:");
            			String elec=sc.next();
            			System.out.println("Please enter the names of the candidates in form c1,c2,...,cN:");
            			//If candidates are input in a form other than c1,c2,c3 (for example, as c1, c2, c3) it breaks the code --
            			//either specify the input form and let it break if it doesn't match, or modify how we get candidates
            			String cand=sc.next();
            			stmt.execute("INSERT into candidates (election, candidateSet) VALUES ('" + elec +"','" + cand+"')");
            			stmt.execute("ALTER TABLE elections ADD "+elec+" varchar(1)");
            			out.println("Time: "+sdf.format(date)+"; Event Type: Election Creation; UserID: "+name+"; Description: Election "+elec +"with candidates "+cand+"created.\n");
            			KeyPairGenerator genRSA=KeyPairGenerator.getInstance("RSA");
            			genRSA.initialize(3072);
            			KeyPair keypair=genRSA.genKeyPair();
            			RSAPrivateKey skAdmin=(RSAPrivateKey)keypair.getPrivate();
            			RSAPublicKey pkAdmin=(RSAPublicKey)keypair.getPublic();
            			byte[] skAdminBytes=skAdmin.getEncoded();
            			byte[] pkAdminBytes=pkAdmin.getEncoded();
            			//testing stuff
            			/*Signature sign=Signature.getInstance("SHA256WITHRSA");
            			sign.initSign(skAdmin);
            			byte[] tester= {(byte)0, (byte)1, (byte)2};
            			sign.update(tester);
            			byte[] signed=sign.sign();*/
            			pstmt=con2.prepareStatement("INSERT INTO adminkeys (election, pk, sk) values (?,?,?);");
            			pstmt.setString(1, elec);
            			pstmt.setBytes(2, pkAdminBytes);
            			pstmt.setBytes(3, skAdminBytes);
            			pstmt.execute();
            			//This was some stuff to test key storage worked correctly
            			/*Signature ver=Signature.getInstance("SHA256WITHRSA");
            			rs=stmt.executeQuery("SELECT pk FROM adminkeys WHERE election='"+elec+"'");
            			if(rs.next()){
            				byte[] testkey=rs.getBytes("pk");
            				PublicKey pubkey=KeyFactory.getInstance("RSA").generatePublic(new X509EncodedKeySpec(testkey));
            				ver.initVerify(pubkey);
            				ver.update(tester);
            				boolean good=ver.verify(signed);
            				if(good)
            					System.out.println("key test succeeded");
            			}
            					
            			//pstmt.execute("INSERT INTO adminkeys (election, pk, sk) values ('"+elec+"',"+pkAdminBytes+","+skAdminBytes+");");
            			
            			
            			//add admin key to table
            			*/
            		//}  
            		
            		rs = stmt.executeQuery("SELECT usernames FROM elections WHERE usertype ='1'");

            		int numVoters=0;
        			while(rs.next()) { 
        				userName = rs.getString("usernames");
        				System.out.println("Please authorize voters, 1 for yes, and 0 for no:");
        				System.out.println(userName+":");
        				authorize = sc.next();
        				if(authorize.equals("1")){
        					numVoters++;
        					out.println("Time: "+sdf.format(date)+"; Event Type: Login; UserID: "+name+"; Description: User "+userName+"authorized for election"+elec+".\n");
        					st2.execute("UPDATE candidates SET numVoters='"+numVoters+"'");
        				}
        				st2.executeUpdate("UPDATE elections SET "+elec+" = " + authorize + " WHERE usernames = '" + userName + "'");
        			} 
            	}
            	out.close();
            }
            
        }catch (Exception e){
            System.out.println(e+"  Authentication failed");
        }
    }       //end main
}       //end class
