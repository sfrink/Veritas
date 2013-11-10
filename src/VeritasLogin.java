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

import org.bouncycastle.crypto.generators.RSAKeyPairGenerator;
import org.bouncycastle.crypto.AsymmetricCipherKeyPair;
import org.bouncycastle.crypto.params.RSAKeyGenerationParameters;
import org.bouncycastle.crypto.params.RSAKeyParameters;
import org.bouncycastle.crypto.params.AsymmetricKeyParameter;

import java.math.BigInteger;
import java.net.Socket;
import java.security.SecureRandom;

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
            Connection conn = DriverManager.getConnection(url, user, pw);
            Statement stmt = conn.createStatement();
            PreparedStatement pstmt=null;
            String query = "SELECT * from users WHERE username='"+name+"'";
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){                           //Read username & password from database
                databaseUsername = rs.getString("username");
                databasePassword = rs.getString("password");
            }

			
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
            			
            			
            			
            			
            			Socket socket=new Socket("localhost",8001);
            			InputStream in=socket.getInputStream();
        				OutputStream out2=socket.getOutputStream();
            	
            			byte[] elecByte=elec.getBytes();
            			byte[] candByte=cand.getBytes();
            			System.out.println("Connected to server of settup");
        				ByteArrayOutputStream byteArray = new ByteArrayOutputStream();
        				byteArray.write(elecByte.length);
        				byteArray.write(elecByte);
        				byteArray.write(candByte.length);
        				byteArray.write(candByte);
        				out2.write(byteArray.toByteArray());
            			

            			out.println("Time: "+sdf.format(date)+"; Event Type: Election Creation; UserID: "+name+"; Description: Election "+elec +"with candidates "+cand+"created.\n");
            			//KeyPairGenerator genRSA=KeyPairGenerator.getInstance("RSA");
            			//genRSA.initialize(3072);
            			//KeyPair keypair=genRSA.genKeyPair();
            			//RSAPrivateKey skAdmin=(RSAPrivateKey)keypair.getPrivate();
            			//RSAPublicKey pkAdmin=(RSAPublicKey)keypair.getPublic();
            			//byte[] skAdminBytes=skAdmin.getEncoded();
            			//byte[] pkAdminBytes=pkAdmin.getEncoded();
            			
            			
            			
            	
        		
            			            			
            			//testing stuff
            			/*Signature sign=Signature.getInstance("SHA256WITHRSA");
            			sign.initSign(skAdmin);
            			byte[] tester= {(byte)0, (byte)1, (byte)2};
            			sign.update(tester);
            			//byte[] signed=sign.sign();*/
            			
            			
            			//stmt.execute("create table "+elec+" (username varchar(50), encVote varbinary(3072), signedVote varbinary(3072));");
            			//stmt.execute("create table "+elec+"votes (nonce varbinary(100), encVote varbinary(3072), signedVote varbinary(3072));");
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
            			
            			*/ 
            		
        				/**Get Usernames from server****/
        				byte[] receiveBuf = new byte[4096];
        				ArrayList<byte[]> bufArray = new ArrayList<byte[]>();
        				in.read(receiveBuf);
        				ByteArrayInputStream byteArray2 = new ByteArrayInputStream(receiveBuf);
        				for (int j = 0; j <= 100; j++) {
        					int tmp = byteArray2.read();
        					byte[] tmpArray = new byte[tmp];
        					byteArray2.read(tmpArray, 0, tmp);
        					bufArray.add(tmpArray);
        				}
        				// get the credential and send to the server
        				System.out.println("Please authorize voters, 1 for yes, and 0 for no:");
        				int numVoters=0;
        				byte[] m=bufArray.get(0);	
    					int count= (Integer)deserialize(m);
        				ByteArrayOutputStream byteArray3 = new ByteArrayOutputStream();
        				for(int i=1; i<=count;i++){
        					System.out.println(bufArray.get(i));
        					authorize = sc.next();
            				if(authorize.equals("1")){
            					numVoters++;
            					//out.println("Time: "+sdf.format(date)+"; Event Type: Login; UserID: "+name+"; Description: User "+userName+"authorized for election"+elec+".\n");
            					
            				}
            					  byte[] authorizeByte=authorize.getBytes();
            	  				  byteArray3.write(authorizeByte.length);
            	  				  byteArray3.write(authorizeByte);
            					
        				}
        				
        				out2.write(byteArray3.toByteArray());;
        
        				//stmt.execute("create table "+elec+"results (vote varchar(50));");
        				//rs = stmt.executeQuery("SELECT usernames FROM elections WHERE usertype ='1'");
        	
        				
        		/*		
            		int numVoters=0;
        			while(rs.next()) { 
        				userName = rs.getString("usernames");
        				System.out.println("Please authorize voters, 1 for yes, and 0 for no:");
        				System.out.println(userName+":");
        				authorize = sc.next();
        				if(authorize.equals("1")){
        					numVoters++;
        					out.println("Time: "+sdf.format(date)+"; Event Type: Login; UserID: "+name+"; Description: User "+userName+"authorized for election"+elec+".\n");
        				} 
        				st2.executeUpdate("UPDATE elections SET "+elec+" = " + authorize + " WHERE usernames = '" + userName + "'");
        			}*/
					st2.execute("UPDATE candidates SET numVoters='"+numVoters+"'");
            	}
            	out.close();
            }
            
        }catch (Exception e){
            System.out.println(e+"  Authentication failed");
        }
    }       //end main

	private static Object deserialize(byte[] encVote) throws IOException, ClassNotFoundException {
		ByteArrayInputStream b = new ByteArrayInputStream(encVote);
        ObjectInputStream o = new ObjectInputStream(b);
        return o.readObject();
	}
}       //end class
