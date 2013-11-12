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
import java.security.MessageDigest;


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
			    	String pw="lrn7777rui";
		    		Connection conn = DriverManager.getConnection(url, user, pw);
		            Statement stmt = conn.createStatement();
		            PreparedStatement pstmt=null;
		            byte[] ack=new byte[4096];
		            byte[] ack2=new byte[4096];
		            byte[] ack_supervisor=serialize(1);
		            byte[] ack_voter=serialize(0);
		            byte[] votes= new byte[4096];
		            byte[] request = new byte[4096];
					byte[] receiveBuf = new byte[4096];
					byte[] receiveBuf2 = new byte[4096];
					byte[] receiveBuf3 = new byte[4096];
					byte[] receiveBuf4 = new byte[4096];
					byte[] receiveBuf5 = new byte[4096];
					byte[] receiveBuf6 = new byte[4096];
					InputStream in = clntSock.getInputStream();
					OutputStream out=clntSock.getOutputStream();
					// get the username and candidate
					ArrayList<byte[]> bufArray = new ArrayList<byte[]>();
					ArrayList<byte[]> bufArray2 = new ArrayList<byte[]>();
					ArrayList<byte[]> bufArray3 = new ArrayList<byte[]>();
					ArrayList<byte[]> bufArray4 = new ArrayList<byte[]>();
					in.read(request);
					int requestInt=(Integer)deserialize(request);
					if(requestInt==0){
						
						out.write(serialize(7));
						in.read(receiveBuf5);	
						
						ByteArrayInputStream byteArray5 = new ByteArrayInputStream(receiveBuf5);
						for (int j = 0; j <=1; j++) {
							int tmp = byteArray5.read();
							byte[] tmpArray = new byte[tmp];
							byteArray5.read(tmpArray, 0, tmp);
							bufArray4.add(tmpArray);
						}
						
						/**Need to get usertype**/
						String username= new String(bufArray4.get(0));
					
						String pwd= new String(bufArray4.get(1));	
						/***update the database ***/
						MessageDigest sha=MessageDigest.getInstance("SHA-256");
						SecureRandom rand=new SecureRandom();
						byte[] salt=new byte[4];
						rand.nextBytes(salt);

						byte[] password=pwd.getBytes();
						byte[] toHash=new byte[password.length+4];
						toHash[0]=salt[0];
						toHash[1]=salt[1];
						toHash[2]=salt[2];
						toHash[3]=salt[3];
						for(int i=0;i<password.length;i++){
							toHash[i+4]=password[i];
						}
						byte[] hash=sha.digest(toHash);
						pstmt=conn.prepareStatement("INSERT INTO users (username, password, salt) values (?,?,?)");
						pstmt.setString(1, username);
						pstmt.setBytes(2, hash);
						pstmt.setBytes(3, salt);
						pstmt.execute();
						
						//pstmt=conn.prepareStatement("INSERT INTO elections (usernames, usertype) values (?,?)");
						//pstmt.setString(1,username);
						//pstmt.setString(2, usertype);
						//pstmt.execute();
						out.write(serialize(1));
					}
					else{
						out.write(serialize(1));
						
					}
					
					/*** check if this user should be authenticated      ***/
						/***  function for supervisor       ***/
						in.read(receiveBuf4);
						ByteArrayInputStream byteArray4 = new ByteArrayInputStream(receiveBuf4);
						for (int j = 0; j <=1; j++) {
							int tmp = byteArray4.read();
							byte[] tmpArray = new byte[tmp];
							byteArray4.read(tmpArray, 0, tmp);
							bufArray3.add(tmpArray);
						}
						
						String username= new String(bufArray3.get(0));
						String pwd= new String(bufArray3.get(1));
					//	System.out.println(username);
						String query = "SELECT * FROM users WHERE username='"+username+"'";
					
						ResultSet rs = stmt.executeQuery(query);
						String databaseUsername = "";
						byte[] databasePassword=null;
						byte[] databaseSalt=new byte[4];
			            while(rs.next()){  
			            	
			            	databaseUsername = rs.getString("username");
			            	databasePassword = rs.getBytes("password");
			            	databaseSalt = rs.getBytes("salt");		//Get salt from database to hash the input password
			            }
			            
			            byte[] input_password=pwd.getBytes();		//Hash the input password & compare with the hash value in database
						byte[] input=new byte[input_password.length+4];
						input[0]=databaseSalt[0];
						input[1]=databaseSalt[1];
						input[2]=databaseSalt[2];
						input[3]=databaseSalt[3];
						for(int i=0;i<input_password.length;i++){
							input[i+4]=input_password[i];
						}						
						MessageDigest sha=MessageDigest.getInstance("SHA-256");
						byte[] input_hash=sha.digest(input);
						String hashed_input= new String(input_hash);
						String databasePasswordString=new String(databasePassword);
					
			            if (username.equals(databaseUsername) && hashed_input.equals(databasePasswordString)) { //check username & password
			            	
			            	out.write(serialize(1));
			            	in.read(ack2);
			            	/*** check if this user is a supervisor or a voter  or go to different functions  ***/
			            	query = "SELECT * from elections WHERE usernames='"+username+"'";
							 rs = stmt.executeQuery(query);
			            	 while(rs.next()){
			                 	if(rs.getString("usertype").equals("1")){
										out.write(ack_supervisor);
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
						        		 ResultSet rs2 = stmt.executeQuery("SELECT usernames FROM elections WHERE usertype ='1'");
						        		 int count=0;
						        		 while (rs2.next()){
						        			 count++;
						        		 }
						        		 out.write(serialize(count));
						        		
						        	
						    			 while(rs2.next()) { 
						    				 String userName = rs.getString("usernames");
						    				 byte[] userNamebyte=userName.getBytes();
						    				 byteArray2.write(userNamebyte.length);
						    				 byteArray2.write(userNamebyte);
						  				  
						    			 }
						    			 	
											in.read(ack);
											int Ack= (Integer)deserialize(ack);	 
											if (Ack==1){
												out.write(byteArray2.toByteArray());
											}
						  				 
						  				 // get the authorized users from the client:
						  				 
						  				in.read(receiveBuf2);
						  				int voteNumbers=(Integer)deserialize(receiveBuf2);
						  				int ack3=1;
						  				out.write(serialize(ack3));
										in.read(receiveBuf3);
										ByteArrayInputStream byteArray3 = new ByteArrayInputStream(receiveBuf3);
										for (int j = 0; j <voteNumbers; j++) {
											int tmp = byteArray.read();
											byte[] tmpArray = new byte[tmp];
											byteArray3.read(tmpArray, 0, tmp);
											bufArray2.add(tmpArray);
										}
										
						 				 // update the database using the authorized list:  
										for(int i=0;i<voteNumbers;i++){
											String authuser=new String (bufArray2.get(i));
											stmt.execute("INSERT INTO elections ("+electionname+") VALUES '1' WHERE usernames='"+authuser+"'");
											
										}
									}
									
									
			            	 }
			                 	/***  function for voter       ***/
			            	if(rs.getString("usertype").equals("0")){
			            		out.write(ack_voter);
			            		in.read(receiveBuf);
			            		int numelections=0;
			            		ByteArrayOutputStream byteArray5 = new ByteArrayOutputStream();
			            		rs=stmt.executeQuery("SELECT * FROM elections WHERE usernames='"+username+"'");
			            		while(rs.next()){
			        				ResultSetMetaData metadata = rs.getMetaData();
			        				int columnCount = metadata.getColumnCount();
			        				for(int i=3;i<=columnCount;i++){
			        					if(rs.getString(i).equals("1")){
			        						System.out.print((i-2)+"."+metadata.getColumnName(i)+" ");
			        							numelections++;
			        							byteArray5.write(serialize(metadata.getColumnName(i)).length);
			        							byteArray5.write(serialize(metadata.getColumnName(i)));
			        					}
			        				}
			        			}
			            		if(numelections==0)
			        				out.write(serialize(0));
			        			else{
			        				out.write(serialize(1));
			        				in.read( receiveBuf6 );
			        				out.write(serialize(numelections));
			        				in.read(receiveBuf6);
			        				String electionname=new String(receiveBuf6);
			        				out.write(byteArray5.toByteArray());
			        				in.read(receiveBuf6);
			        				rs=stmt.executeQuery("SELECT candidateSet FROM candidates WHERE election='"+electionname+"'");

			        				String candidates=null;
			        				if(rs.next()){
			      	
			        				candidates=rs.getString(1);
			        		
			        				}
			        				out.write(serialize(candidates));
			        				in.read(votes);
			        				String choice=new String(votes);
			        				Vote voter=new Vote();
			        				voter.vote(choice, username, electionname);
			            	}
			            	
			            	
			            } else {
			            	out.write(serialize(0));
			            	
			            }
						
						
						
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
