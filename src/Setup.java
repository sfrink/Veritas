import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketAddress;
import java.util.ArrayList;
import java.sql.*;
import org.bouncycastle.crypto.generators.RSAKeyPairGenerator;
import org.bouncycastle.crypto.AsymmetricCipherKeyPair;
import org.bouncycastle.crypto.params.RSAKeyGenerationParameters;
import org.bouncycastle.crypto.params.RSAKeyParameters;
import org.bouncycastle.crypto.params.AsymmetricKeyParameter;
import java.security.SecureRandom;
import java.math.BigInteger;


public class Setup {

	public static void main(String[] args) throws IOException, SQLException, UnsupportedEncodingException{

		try{ 
			int servPort = 8001;
			/* Need to make this an if stmt like in veritas login -- should do one thing if its a voter,
			 * Something else if its a supervisor
			 */
			final ServerSocket servSock = new ServerSocket(servPort);
			System.out.print("start");
			while (true) {
				final Socket clntSock = servSock.accept();
				SocketAddress clientAddress = clntSock.getRemoteSocketAddress();
				System.out.println("receiving requests from client at "+clientAddress);
				new Thread(new Runnable() {
				public void run(){
				try{
					String url="jdbc:mysql://localhost:3306/Server";
			    	String user="root";
			    	String pw="";
		    		Connection conn = DriverManager.getConnection(url, user, pw);
		            Statement stmt = conn.createStatement();
		            PreparedStatement pstmt=null;
					byte[] receiveBuf = new byte[4096];
					byte[] receiveBuf2 = new byte[4096];
					InputStream in = clntSock.getInputStream();
					OutputStream out=clntSock.getOutputStream();
					// get the username and candidate
					ArrayList<byte[]> bufArray = new ArrayList<byte[]>();
					ArrayList<byte[]> bufArray2 = new ArrayList<byte[]>();
				
					in.read(receiveBuf);
					ByteArrayInputStream byteArray = new ByteArrayInputStream(receiveBuf);
					for (int j = 0; j <= 1; j++) {
						int tmp = byteArray.read();
						byte[] tmpArray = new byte[tmp];
						byteArray.read(tmpArray, 0, tmp);
						bufArray.add(tmpArray);
					}
						
					String electionname=new String(bufArray.get(0), "UTF-8");
					String cand=new String(bufArray.get(1), "UTF-8");
					//add electionname and cand to database
					stmt.execute("ALTER TABLE elections ADD "+electionname+" varchar(1)");
					stmt.execute("create table "+electionname+" (username varchar(50), encVote varbinary(3072), signedVote varbinary(3072));");
	    			stmt.execute("create table "+electionname+"votes (nonce varbinary(100), encVote varbinary(3072), signedVote varbinary(3072));");
	        		stmt.execute("create table "+electionname+"results (vote varchar(50));");
	        		RSAKeyPairGenerator r=new RSAKeyPairGenerator();
	    			r.init(new RSAKeyGenerationParameters(new BigInteger("10001",16),new SecureRandom(),3072,80));
	    			AsymmetricCipherKeyPair keys=r.generateKeyPair();
	    			AsymmetricKeyParameter pkAdmin=keys.getPublic();
	    			AsymmetricKeyParameter skAdmin=keys.getPrivate();
	    			byte[] pk=serialize(pkAdmin);
	    			byte[] sk=serialize(skAdmin);
	    			pstmt=conn.prepareStatement("INSERT INTO adminkeys (election, pk, sk) values (?,?,?);");
	    			pstmt.setString(1, electionname);
	    			pstmt.setBytes(2, pk);
	    			pstmt.setBytes(3, sk);
	    			pstmt.execute();
	    			stmt.execute("INSERT INTO candidates (election, candidateSet, numVoters) VALUES ('"+electionname+"', '"+cand+"', '0');");
	    			
	    			
					//send usernames to the client
					 ByteArrayOutputStream byteArray2 = new ByteArrayOutputStream();
	        		 ResultSet rs = stmt.executeQuery("SELECT usernames FROM elections WHERE usertype ='1'");
	        		 int count=0;
	        		 while (rs.next()){
	        			 count++;
	        		 }
	        		 byteArray2.write(serialize(count).length);
	 				 byteArray2.write(serialize(count)); 
	    			 while(rs.next()) { 
	    				 String userName = rs.getString("usernames");
	    				 byte[] userNamebyte=userName.getBytes();
	    				 byteArray2.write(userNamebyte.length);
	    				 byteArray2.write(userNamebyte);
	  				  
	    			 }
	  				 out.write(byteArray2.toByteArray());
					
	  				 
	  				 // get the authorized users from the client:
	  				in.read(receiveBuf2);
					ByteArrayInputStream byteArray3 = new ByteArrayInputStream(receiveBuf2);
					for (int j = 0; j <count; j++) {
						int tmp = byteArray.read();
						byte[] tmpArray = new byte[tmp];
						byteArray3.read(tmpArray, 0, tmp);
						bufArray2.add(tmpArray);
					}
					
	 				 // update the database using the authorized list:  
					for(int i=0;i<count;i++){
						String authuser=new String (bufArray2.get(i));
						stmt.execute("INSERT INTO elections ("+electionname+") VALUES '1' WHERE username='"+authuser+"'");
						
					}
				
				}
				catch(Exception e){
					System.out.println(e);
				}
				}
				}).start();
				
				
	  
			}
 		
		}
		catch(Exception e){
			System.out.println(e);
		}
	}
	
	
	private static byte[] serialize(Object n) throws IOException {
		ByteArrayOutputStream b = new ByteArrayOutputStream();
        ObjectOutputStream o = null;
		try {
			o = new ObjectOutputStream(b);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
        try {
			o.writeObject(n);
		} catch (IOException e) {
			e.printStackTrace();
		}
        return b.toByteArray();
	}
	
	
	
	private static Object deserialize(byte[] encVote) throws IOException, ClassNotFoundException {
		ByteArrayInputStream b = new ByteArrayInputStream(encVote);
        ObjectInputStream o = new ObjectInputStream(b);
        return o.readObject();
	}
}
