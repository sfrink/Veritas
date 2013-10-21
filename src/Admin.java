import java.math.BigInteger;
import java.net.*;

import javax.crypto.*;

import java.security.*;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.X509EncodedKeySpec;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.io.*;

public class Admin {
	
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
			con=DriverManager.getConnection(url, user, pw);
			st=con.createStatement();
		
		
			System.out.println("start");
			int servPort=33333;
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
			
				//for(int i = 0; i < bufArray.size(); i++){
					//System.out.println("bufArray[" + i + "] = " + bufArray.get(i));
			//	}
			
				// get the value of username, blindBytes and signedBlind --- also need to get election name
				String username = new String(bufArray.get(0), "UTF-8");
				byte[] blindBytes=bufArray.get(1);
				byte[] signedBlind=bufArray.get(2);

				RSAPrivateKey skAdmin;
				
		
				
				//KeyPairGenerator genRSA=KeyPairGenerator.getInstance("RSA");
				//genRSA.initialize(3072);
				//KeyPair keypair=genRSA.genKeyPair();
				
				
				//skAdmin=get from database			
				rs=st.executeQuery("SELECT sk FROM adminkeys WHERE election='"+electionName+"'");
				byte[] adminsk=rs.getBytes("sk");
				skAdmin=(RSAPrivateKey)(KeyFactory.getInstance("RSA").generatePrivate(new X509EncodedKeySpec(adminsk)));
				
				
				//get blinded message m, signature s of m, and username
				//check that the user is eligible for this election -- database query
				//check that user has not already asked for signature -- some storage???
				//Check signature of the blinded message
				//get voter pk from a database
				//RSAPublicKey voterPK=whatever in database for that user
				rs=st.executeQuery("SELECT pk FROM voterkeys WHERE username='"+username+"'");
				byte[] voterpk=rs.getBytes("pk");
				PublicKey pk=KeyFactory.getInstance("RSA").generatePublic(new X509EncodedKeySpec(voterpk));
				Signature ver=Signature.getInstance("SHA256WITHRSA");
				ver.initVerify(pk);
				ver.update(blindBytes);
				boolean goodSig=ver.verify(signedBlind);
				
				//Still need to check election eligibility
				if(goodSig){
					Signature sign=Signature.getInstance("SHA256WITHRSA");
					sign.initSign(skAdmin);
					sign.update(blindBytes);
					byte[] signed=sign.sign();
					out.write(signed);
				}
				
				//Keep track of how many voters have requested signatures
				//When everyone has voted, publish list of usernames, encrypted votes, 
				//and signatures of encrypted votes (all data sent from voters)
				clntSock.close();
	
			
			}
			
		}
		catch(Exception e){
			System.out.println(e);
		}
	}
	
}
