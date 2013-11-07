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
			
							// get the value of encVote, signedVote and electionname 
							byte[] encVote=bufArray.get(0);
							byte[] signedVote=bufArray.get(1);
							String electionname = new String(bufArray.get(2), "UTF-8");
							logwrite.println("Time: "+sdf.format(date)+"; Event Type: Counter Receive Info; Electionname: "+electionname+"; Description: Counter received signed vote from "+electionname+"\n");
				
			                System.out.println("testing2");
							//Check signature
							rs=st.executeQuery("SELECT pk FROM adminkeys WHERE election='"+electionname+"'");
							rs.next();
							RSAKeyParameters adminpk=(RSAKeyParameters)deserialize(rs.getBytes("pk"));
							
							//BouncyCastle verification stuff
							PSSSigner signer=new PSSSigner(new RSAEngine(), new SHA1Digest(), 20);
							signer.init(false, adminpk);
							signer.update(encVote, 0,encVote.length);
							boolean goodSign=signer.verifySignature(signedVote); 
							
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
							
							/****When all votes collected, send list of all (nonce, encVote, signedVote) to all Vote clients***/
				
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
