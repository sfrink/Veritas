import java.net.*;
import java.security.*;
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
import org.bouncycastle.crypto.params.RSAKeyParameters;
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
					OutputStream out=clntSock.getOutputStream();
					byte [] receiveBuf=new byte[1280];
					ArrayList<byte[]> bufArray = new ArrayList<byte[]>();
			
				
					public void run(){
						try{
							
							in.read(receiveBuf);
							ByteArrayInputStream byteArray = new ByteArrayInputStream(receiveBuf);
							ByteArrayOutputStream byteArray2 = new ByteArrayOutputStream();
							for (int j = 0; j <= 2; j++) {
								int tmp = byteArray.read();
								byte[] tmpArray = new byte[tmp];
								byteArray.read(tmpArray, 0, tmp);
								bufArray.add(tmpArray);
							}
							
			
							// get the value of encVote, signedVote and electionname 
							//This should eventually be over TOR
							byte[] encVote=bufArray.get(0);
							byte[] signedVote=bufArray.get(1);
							String electionname = new String(bufArray.get(2), "UTF-8");
							logwrite.println("Time: "+sdf.format(date)+"; Event Type: Counter Receive Info; Electionname: "+electionname+"; Description: Counter received signed vote from "+electionname+"\n");
				
			                System.out.println("testing2");
							//Check signature
							rs=st.executeQuery("SELECT pk FROM adminkeys WHERE election='"+electionname+"'");
							rs.next();
							byte[] adminpk=rs.getBytes("pk");
							
							//verify
							boolean goodSign=verify(adminpk, encVote, signedVote);
							
							
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
			        			byteArray2.write(nonce.length);
		        				byteArray2.write(nonce);
		        				byteArray2.write(encVote.length);
		        				byteArray2.write(encVote);
		        				byteArray2.write(signedVote);
		        				byteArray2.write(signedVote);
			        			
			        			
							}
							else
								System.out.println("bad signature");
							
							
							//Do some waiting for all votes
							//when all votes are collected, publish (nonce, encVote, signedVote) somewhere
							//Do we need to send whole list back, or just their nonce, encVote, signedVote?
							/****When all votes collected, send list of all (nonce, encVote, signedVote) to all Vote clients***/
							
							
	        				out.write(byteArray2.toByteArray());
			      
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
	
	

	
	
	
	private static boolean verify(byte[] pk, byte[] message, byte[] sig) throws IOException, ClassNotFoundException{
		RSAKeyParameters adminpk=(RSAKeyParameters)deserialize(pk);
		PSSSigner signer=new PSSSigner(new RSAEngine(), new SHA1Digest(), 20);
		signer.init(false, adminpk);
		signer.update(message, 0,message.length);
		return signer.verifySignature(sig); 

	}
	
	
	
	private static Object deserialize(byte[] encVote) throws IOException, ClassNotFoundException {
		ByteArrayInputStream b = new ByteArrayInputStream(encVote);
        ObjectInputStream o = new ObjectInputStream(b);
        return o.readObject();
	}
	
}
