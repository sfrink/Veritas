import java.math.BigInteger;
import java.net.*;


import java.security.*;
import java.security.interfaces.RSAPrivateKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.io.*;

public class Admin {
	
	public static void main(String[] args){
	
		String url="jdbc:mysql://localhost:3306/elections";
		String user="root";
		String pw="";
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(Exception e){
			System.out.println(e);
		}
		try{
		    final Connection con=DriverManager.getConnection(url, user, pw);
			final Statement st=con.createStatement();
			System.out.println("start");
			int servPort=33333;
			ServerSocket servSock=new ServerSocket(servPort);	
		
			while(true){
				final Socket clntSock=servSock.accept();
				SocketAddress clientAddress=clntSock.getRemoteSocketAddress();
				System.out.println("receiving requests from client at "+clientAddress);
				new Thread(new Runnable() {
					ResultSet rs=null;
					int recvMsgSize;
					byte [] receiveBuf=new byte[1280];
					ArrayList<byte[]> bufArray = new ArrayList<byte[]>();
				  	InputStream in=clntSock.getInputStream();
					OutputStream out=clntSock.getOutputStream();
					File log=new File("log.txt");
					
					
					
		            java.util.Date date = new java.util.Date();
		            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy h:mm:ss a");
					PrintWriter logwrite =new PrintWriter(new BufferedWriter(new FileWriter(log, true)));  
						public void run(){
							try{
								for(int j=0;j<=3;j++){	
									recvMsgSize=in.read(receiveBuf);
									byte[] tmp = new byte[recvMsgSize];
									System.arraycopy(receiveBuf, 0, tmp, 0, recvMsgSize);
									bufArray.add(tmp);
					
								}
			
		
			
							// get the value of username, blindBytes and signedBlind --- also need to get election name
								String username = new String(bufArray.get(0), "UTF-8");
								byte[] blindBytes=bufArray.get(1);
								byte[] signedBlind=bufArray.get(2);
								String electionname=new String(bufArray.get(3), "UTF-8");
								logwrite.println("Time: "+sdf.format(date)+"; Event Type: Admin Receive Info; Election Name: "+electionname+"; Description: Admin received blind and signed blind from "+username+"\n");
								//RSAPrivateKey skAdmin;
								//System.out.println("testing2");
		
								
								//KeyPairGenerator genRSA=KeyPairGenerator.getInstance("RSA");
								//genRSA.initialize(3072);
								//KeyPair keypair=genRSA.genKeyPair();
				
								//This needs to be be BC keys
								rs=st.executeQuery("SELECT sk FROM adminkeys WHERE election='"+electionname+"';");
								rs.next();
								//want something like RSAKeyParameters adminsk=deserialize(rs.getBytes("sk"));
								
								
								//OLD STUFF
								//byte[] adminsk=rs.getBytes("sk");
								//skAdmin=(RSAPrivateKey)(KeyFactory.getInstance("RSA").generatePrivate(new PKCS8EncodedKeySpec(adminsk)));
								//System.out.println("testing3");
								//
				
								//get blinded message m, signature s of m, and username
								//check that the user is eligible for this election -- database query
								//check that user has not already asked for signature -- some storage???
								//Check signature of the blinded message
								//get voter pk from a database
								//RSAPublicKey voterPK=whatever in database for that user
								
								//This needs to be sent from client
								rs=st.executeQuery("SELECT pk FROM voterkeys WHERE username='"+username+"'");
								rs.next();
								
								//again something like RSAKeyParams voterpk=deserialize(rs.getBytes("pk"));
								//byte[] voterpk=rs.getBytes("pk");
								
								/***Needs to be RSAKeyParameters voterpk=deserialize(stuff from network) if not already in database***/
								PublicKey pk=KeyFactory.getInstance("RSA").generatePublic(new X509EncodedKeySpec(voterpk));
								Signature ver=Signature.getInstance("SHA256WITHRSA");
								ver.initVerify(pk);
								ver.update(blindBytes);
								boolean goodSig=ver.verify(signedBlind);
								boolean eligible=false;
								rs=st.executeQuery("SELECT "+electionname+" FROM elections WHERE usernames='"+username+"';");
								rs.next();
								//System.out.println("testing4");
								if(rs.getString(electionname).equals("1"))
									eligible=true;
								//Still need to check election eligibility
								if(eligible && goodSig){
												System.out.println("good sig");
								BigInteger n=skAdmin.getModulus();
								BigInteger d=skAdmin.getPrivateExponent();
								BigInteger blinded=new BigInteger(blindBytes);
								BigInteger s=blinded.modPow(d,n);
								byte[] signed=s.toByteArray();
								/*Signature sign=Signature.getInstance("RSA");
								sign.initSign(skAdmin);
								sign.update(blindBytes);
								byte[] signed=sign.sign();*/
								out.write(signed);
								logwrite.println("Time: "+sdf.format(date)+"; Event Type: Admin Send Info; Election: "+electionname+"; Description: Admin sent signed blind to "+username+"\n");
								}
								//Keep track of how many voters have requested signatures
								//rs=st.executeQuery("SELECT numVoters FROM candidates WHERE election='"+electionname+"'");
								/*int numVoters=Integer.parseInt(rs.getString("numVoters"));
								count++;
								if(numVoters==count){
									//When everyone has voted, publish list of usernames, encrypted votes, 
									//and signatures of encrypted votes (all data sent from voters)
									
								}*/
								
					            PreparedStatement pstmt=null;
					            pstmt=con.prepareStatement("INSERT INTO "+electionname+" (username, encVote, signedVote) values (?,?,?);");
					            pstmt.setString(1, username);
					            pstmt.setBytes(2, blindBytes);
					            pstmt.setBytes(3, signedBlind);
					            pstmt.execute();
								
					            //clntSock.close();
					
								logwrite.close();
							}
							catch (Exception e){}
						}
				
				}).start();
			}
			
		}
		catch(Exception e){
			System.out.println(e);
		}
	}
	
}
