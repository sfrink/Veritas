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
			ServerSocket server=new ServerSocket(6545);
			Socket client=server.accept();
			OutputStream out=client.getOutputStream();
			InputStream in=client.getInputStream();
			byte[] u=new byte[1000];
			int usernumbytes=in.read(u);
			String username=new String(u);
			byte[] blindBytes=new byte[1000];
			int numblindbytes=in.read(blindBytes);
			byte[] signedBlind=new byte[1000];
			int numSignBytes=in.read(signedBlind);
			RSAPrivateKey skAdmin;
			
			//KeyPairGenerator genRSA=KeyPairGenerator.getInstance("RSA");
			//genRSA.initialize(3072);
			//KeyPair keypair=genRSA.genKeyPair();
			
			
			//skAdmin=get from database			
			
			
			
			//Get pk to voters
			//The key generation actually needs to take place before here, and the keys should be stored somewhere
			//This is because keys for the admin need to be the same for all voters in an election.
			//get blinded message m, signature s of m, and username
			//check that the user is eligible for this election -- database query
			//check that user has not already asked for signature -- some storage???
			//Check signature of the blinded message
			//get user pk upk from a database
			/*RSAPublicKey voterPK=whatever in database for that user
			rs=st.executeQuery("SELECT pk FROM voterkeys WHERE username='"+username+"'");
			byte[] voterpk=rs.getBytes("pk");
			PublicKey pk=KeyFactory.getInstance("RSA").generatePublic(new X509EncodedKeySpec(voterpk));
			*Signature ver=Signature.getInstance("SHA256WITHRSA");
			*ver.initVerify(pk);
			*ver.update(blindBytes);
			*boolean goodSig=ver.verify(signedBlind);
			*if(goodSig)
			*	Continue
			*/
			
			/*
			 * This is just for signing the blinded vote.  Checking signatures and eligibility needs to be added.
			rs=st.executeQuery("SELECT sk FROM adminkeys WHERE election='"+electionname+"'");
			byte[] adminsk=rs.getBytes("sk");
			PrivateKey skAdmin=KeyFactory.getInstance("RSA").generatePrivate(new X509EncodedKeySpec(adminsk));
			 * Signature sign=Signature.getInstance("SHA256WITHRSA");
			 * sign.init(skAdmin);
			 * sign.update(m);
			 * byte[] signed=sign.sign();
			 * send signed to voter;
			 */
			
			//Keep track of how many voters have requested signatures
			//When everyone has voted, publish list of usernames, encrypted votes, 
			//and signatures of encrypted votes (all data sent from voters)
		}
		catch(Exception e){
			System.out.println(e);
		}
	}
	
}
