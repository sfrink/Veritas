import java.math.BigInteger;
import java.net.*;
import java.security.*;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.X509EncodedKeySpec;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.io.*;

import org.bouncycastle.crypto.digests.SHA1Digest;
import org.bouncycastle.crypto.engines.RSAEngine;
import org.bouncycastle.crypto.signers.PSSSigner;



public class Counter {

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
			File log=new File("log.txt");
            final java.util.Date date = new java.util.Date();
            final SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy h:mm:ss a");
			final PrintWriter logwrite =new PrintWriter(new BufferedWriter(new FileWriter(log, true)));
	
			System.out.println("start");
			int servPort=8000;
			ServerSocket servSock=new ServerSocket(servPort);	
			
			while(true){
				final Socket clntSock=servSock.accept();
				SocketAddress clientAddress=clntSock.getRemoteSocketAddress();
				System.out.println("receiving requests from client at "+clientAddress);
				new Thread(new Runnable() {
					PreparedStatement pstmt=null;
					ResultSet rs=null;
					InputStream in=clntSock.getInputStream();
					int recvMsgSize;
					byte [] receiveBuf=new byte[1280];
					ArrayList<byte[]> bufArray = new ArrayList<byte[]>();
			
				
					public void run(){
						try{
							for(int j=0;j<=2;j++){	
								recvMsgSize=in.read(receiveBuf);
								byte[] tmp = new byte[recvMsgSize];
								System.arraycopy(receiveBuf, 0, tmp, 0, recvMsgSize);
								bufArray.add(tmp);
					
							}
			
							// get the value of enVote, signedVote and electionname 
							byte[] encVote=bufArray.get(0);
							byte[] signedVote=bufArray.get(1);
							String electionname = new String(bufArray.get(2), "UTF-8");
							logwrite.println("Time: "+sdf.format(date)+"; Event Type: Counter Receive Info; Electionname: "+electionname+"; Description: Counter received signed vote from "+electionname+"\n");
				
			                System.out.println("testing2");
							//Network stuff to get encVote, signedVote and username from voter
							//Check signature
							//Signature ver=Signature.getInstance("SHA256WITHRSA");
							//We need to get the pk from a database table
							rs=st.executeQuery("SELECT pk FROM adminkeys WHERE election='"+electionname+"'");
							rs.next();
							//RSAKeyParameters adminpk=deserialize(rs.getBytes("pk"));
							byte[] adminpk=rs.getBytes("pk");
							RSAPublicKey pk=(RSAPublicKey)(KeyFactory.getInstance("RSA").generatePublic(new X509EncodedKeySpec(adminpk)));
							//ver.initVerify(pk);
							//ver.update(encVote);
							//boolean goodSign=ver.verify(signedVote);
							
							/*
							 * BouncyCastle verification stuff
							 *PSSSigner signer=new PSSSigner(new RSAEngine(), new SHA1Digest(), 20);
							 *signer.init(false, adminpk);
							 *signer.update(encVote, 0,encVote.length);
							 *boolean goodSign=signer.verifySignature(signedVote);  
							 */
							
							BigInteger e=pk.getPublicExponent();
							BigInteger n=pk.getModulus();
							BigInteger sign=new BigInteger(signedVote);
							BigInteger enc=new BigInteger(encVote);
							BigInteger s=sign.modPow(e,n);
							boolean goodSign=false;
							if(s.equals(enc))
								goodSign=true;
							System.out.println("testing3");
							if(goodSign){
								System.out.println("good signature");
								SecureRandom rand=new SecureRandom();
								byte[] nonce=new byte[20];
								rand.nextBytes(nonce);
								pstmt=con.prepareStatement("INSERT INTO "+electionname+"votes (nonce, encVote , signedVote) values (?,?,?);");
			        			pstmt.setBytes(1,nonce);
			        			pstmt.setBytes(2, encVote);
			        			pstmt.setBytes(3, signedVote);
			        			pstmt.execute();
								
							}
							else
								System.out.println("bad signature");
							//Do some waiting for all votes
				//when all votes are collected, publish (nonce, encVote, signedVote) somewhere (maybe a publicly readable table)
				
				//Once all votes are decrypted, count them up
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
