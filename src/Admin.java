import java.math.BigInteger;
import java.net.*;
import java.security.*;
import java.security.spec.X509EncodedKeySpec;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.io.*;

import org.bouncycastle.crypto.engines.RSAEngine;
import org.bouncycastle.crypto.params.RSAKeyParameters;

public class Admin {
	
	public static void main(String[] args){
	
		String url="jdbc:mysql://localhost:3306/Server";
		String user="root";
		String pw="";
		/*try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(Exception e){
			System.out.println(e);
		}*/
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
					byte [] receiveBuf=new byte[12800];
					byte [] receiveBuf2=new byte[12800];
					ArrayList<byte[]> bufArray = new ArrayList<byte[]>();
				  	InputStream in=clntSock.getInputStream();
					OutputStream out=clntSock.getOutputStream();
					File log=new File("log.txt");
				
					
					ByteArrayOutputStream byteArray2 = new ByteArrayOutputStream();
					
		            java.util.Date date = new java.util.Date();
		            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy h:mm:ss a");
					PrintWriter logwrite =new PrintWriter(new BufferedWriter(new FileWriter(log, true)));  
						public void run(){
							try{
								// send adminkey
								System.out.println("testing1");
								in.read(receiveBuf);
								System.out.println("testing2");

								String electionname=new String(receiveBuf, "UTF-8");
								electionname=electionname.trim();
								rs=st.executeQuery("SELECT pk FROM adminkeys WHERE election='"+electionname+"';");
								System.out.println("testing");
								byte[] adminpk=null;
								if(rs.next()){
									System.out.println("testing");
									adminpk=rs.getBytes("pk");
								}
								System.out.println("testing3");

								rs=st.executeQuery("SELECT modulus FROM adminkeys WHERE election='"+electionname+"';");
								byte[] mod=null;
								if(rs.next()){
									mod=rs.getBytes("modulus");
									System.out.println("testing4");							
								}
								byteArray2.write(adminpk.length);
								byteArray2.write(adminpk);
								byteArray2.write(mod.length);
								byteArray2.write(mod);
								byte[] stuff=new byte[1];
								stuff[0]=(byte)1;
								byteArray2.write(stuff.length);
								byteArray2.write(stuff);
						        //Scanner sc = new Scanner(System.in);
					
								out.write(byteArray2.toByteArray());
								System.out.println("Sent key");
								
								/*in.read(receiveBuf2);
								System.out.println("Sent key2");
								ByteArrayInputStream byteArray = new ByteArrayInputStream(receiveBuf2);
							//receive username, blindbytes, signedBlind and electionname	
								for (int j = 0; j <= 4; j++) {
									int tmp = byteArray.read();
									byte[] tmpArray = new byte[tmp];
									for(int i=0;i<tmp;i++){
										tmpArray[i]=(byte)byteArray.read();
									}
									//byteArray.read(tmpArray, 0, tmp);
									bufArray.add(tmpArray);
								}
								
		*/						in.read(receiveBuf2);
								ByteArrayInputStream byteArrayin= new  ByteArrayInputStream(receiveBuf2);
								DataInputStream inputData=new DataInputStream(byteArrayin);
								
								for (int j = 0; j <= 3; j++) {
									int tmp = inputData.readInt();
									byte[] tmpArray = new byte[tmp];
									///for(int i=0;i<tmp;i++){
										//tmpArray[i]=(byte)byteArray.read();
									inputData.read(tmpArray,0,tmp);
									bufArray.add(tmpArray);
								}
								//byteArray.read(tmpArray, 0, tmp);
							
							
								
								
								
								
								System.out.println("stuff");
							    //get the value of username, blindBytes and signedBlind --- also need to get election name
								String username = new String(bufArray.get(0), "UTF-8");
								byte[] blindBytes=bufArray.get(1);
								byte[] signedBlind=bufArray.get(2);
								byte[] voterpk=bufArray.get(3);
								System.out.println("Blind: "+blindBytes.length);
								System.out.println("sign: "+signedBlind.length);
								System.out.println("pk:"+voterpk.length);
								System.out.println("got info from voter");
								logwrite.println("Time: "+sdf.format(date)+"; Event Type: Admin Receive Info; Election Name: "+electionname+"; Description: Admin received blind and signed blind from "+username+"\n");
								//RSAPrivateKey skAdmin;
								//System.out.println("testing2");
				
								//This needs to be be BC keys
								rs=st.executeQuery("SELECT sk FROM adminkeys WHERE election='"+electionname+"';");
								rs.next();
								byte[] adminsk=rs.getBytes("sk");
								System.out.println("retrieved admin key");
								
								
								boolean goodSig=verify(voterpk, blindBytes, signedBlind);
								System.out.println("after verify");
								
								boolean eligible=false;
								username=username.trim();
								rs=st.executeQuery("SELECT "+electionname+" FROM elections WHERE usernames='"+username+"'");
								System.out.println("after query");
								if(rs.next()){
									System.out.println("testingstuff");
									if(rs.getString(electionname).equals("1"))
									eligible=true;
								}
								
								if(eligible && goodSig){
									System.out.println("good sig");
									byte[] signed=sign(adminsk, mod, blindBytes);
									System.out.println(signed.length);
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
								/***When all voters have received signatures from admin, send list of (username, blindBytes, signedBlind) to all voters***/

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
	
	private static byte[] sign(byte[] sk,byte[] mod, byte[] message) throws IOException, ClassNotFoundException{
		BigInteger m=new BigInteger(mod);
		BigInteger s=new BigInteger(sk);
		RSAKeyParameters adminsk=new RSAKeyParameters(true, m, s);
		RSAEngine sign=new RSAEngine();
		sign.init(true, adminsk);
		return sign.processBlock(message, 0, message.length);
		//BigInteger mess=new BigInteger(message);
		//BigInteger sig=mess.modPow(s, m);
		//return sig.toByteArray();

	}
	
	private static boolean verify(byte[] pk, byte[] message, byte[] sig){
		try{
			System.out.println("in verify");
			PublicKey PK=KeyFactory.getInstance("RSA").generatePublic(new X509EncodedKeySpec(pk));
			Signature ver=Signature.getInstance("SHA256WITHRSA");
			ver.initVerify(PK);
			ver.update(message);
			return ver.verify(sig);
		}
		catch(Exception e){
			System.out.println(e);
			return false;
		}
	}
	
}
