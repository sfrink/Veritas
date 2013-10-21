import java.net.*;

import javax.crypto.*;

import java.security.*;
import java.security.interfaces.RSAPrivateKey;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.io.*;

import javax.crypto.spec.IvParameterSpec;


public class Counter {

	public static void main(String[] args){
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
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
			File log=new File("log.txt");
            java.util.Date date = new java.util.Date();
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy h:mm:ss a");
			PrintWriter logwrite =new PrintWriter(new BufferedWriter(new FileWriter(log, true)));
			con=DriverManager.getConnection(url, user, pw);
			st=con.createStatement();
			
			
			
			
			
			System.out.println("start");
			int servPort=8000;
			ServerSocket servSock=new ServerSocket(servPort);	
			int recvMsgSize;
			byte [] receiveBuf=new byte[128];
			ArrayList<byte[]> bufArray = new ArrayList<byte[]>();
			while(true){
				Socket clntSock=servSock.accept();
				SocketAddress clientAddress=clntSock.getRemoteSocketAddress();
				System.out.println("receiving requests from client at "+clientAddress);
				InputStream in=clntSock.getInputStream();
				OutputStream out=clntSock.getOutputStream();

				for(int j=0;j<=2;j++){	
					recvMsgSize=in.read(receiveBuf);
					byte[] tmp = new byte[recvMsgSize];
					System.arraycopy(receiveBuf, 0, tmp, 0, recvMsgSize);
					bufArray.add(tmp);
					
				}
		
			
				// get the value of enVote, signedVote and username 
				byte[] encVote=bufArray.get(0);
				byte[] signedVote=bufArray.get(1);
				String username = new String(bufArray.get(2), "UTF-8");
                logwrite.println("Time: "+sdf.format(date)+"; Event Type: Counter Receive Info; Username: "+username+"; Description: Counter received signed vote from "+username+"\n");
				
			
			//Network stuff to get encVote, signedVote and username from voter
			//byte[] encVote; //=initialized to whatever is sent from voter;
		//	byte[] signedVote; //=whatever is sent from voter
			//Check signature
			Signature ver=Signature.getInstance("SHA256WITHRSA");
			//We need to get the pk from a database table
			//rs=st.executeQuery("SELECT pk FROM voterkeys WHERE username='"+username+"'");
			//byte[] voterpk=rs.getBytes("pk");
			//PublicKey pk=KeyFactory.getInstance("RSA").generatePublic(new X509EncodedKeySpec(voterpk));
			//ver.initVerify(pk);
			//ver.update(encVote);
			//boolean goodSign=ver.verify(signedVote);
			//if(goodSign){
				SecureRandom rand=new SecureRandom();
				byte[] nonce=new byte[20];
				rand.nextBytes(nonce);
				//Store nonce along with encVote somewhere
				//Add one to totalVotesCollected
			//}
			//Do some waiting for all votes
			//when all votes are collected, publish (nonce, encVote, signedVote) somewhere (maybe a publicly readable table)
			
			
			//Wait for voters to check the published list
			//If all goes well they'll send their AES keys and the IV they used
			//get sk from voter
			SecretKey sk;// =whatever sk the voter sends
			byte[] iv;// = whatever iv the voter sends
			Cipher dec=Cipher.getInstance("AES/CBC/PKCS5PADDING");
			dec.init(Cipher.DECRYPT_MODE,sk,new IvParameterSpec(iv));
			byte[] byteVote=dec.doFinal(encVote);
			String decVote=new String(byteVote);
			//Store the vote somewhere
			
			//Once all votes are decrypted, count them up
			
			}
			logwrite.close();
		}
		catch(Exception e){
			System.out.println(e);
		}
	}
}
