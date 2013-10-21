import java.math.BigInteger;
import java.net.*;

import javax.crypto.*;

import java.security.*;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.sql.*;
import java.io.*;
import java.security.spec.*;
import java.util.ArrayList;

public class Vote {

	
	public static void vote(String b, String username, String electionname){
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
		
			//BufferedReader in=new BufferedReader(new InputStreamReader(client.getInputStream()));
			RSAPublicKey pkAdmin;
			RSAPrivateKey skVoter;
			
			
			//Encrypting vote
			KeyGenerator gen=KeyGenerator.getInstance("AES256");
			gen.init(256);
			SecretKey k=gen.generateKey();
			Cipher enc=Cipher.getInstance("AES/CBC/PKCS5PADDING");
			enc.init(Cipher.ENCRYPT_MODE, k);
			byte[] iv=enc.getIV();
			byte[] vote=b.getBytes();
			//Encrypt vote (essentially the commit from FOO92)
			byte[] c=enc.doFinal(vote);
			//Blinding key setup
			
			/*****We actually need to get the public key from the Administrator*****/
			rs=st.executeQuery("SELECT pk FROM adminkeys WHERE election='"+electionname+"'");
			byte[] adminpk=rs.getBytes("pk");
			PublicKey pubkey=KeyFactory.getInstance("RSA").generatePublic(new X509EncodedKeySpec(adminpk));
			pkAdmin=(RSAPublicKey)pubkey;
			BigInteger n=pkAdmin.getModulus();
			BigInteger e=pkAdmin.getPublicExponent();
			BigInteger ct=new BigInteger(c);
			SecureRandom rand=new SecureRandom();
			byte[] random=new byte[10];
			BigInteger r=null;
			BigInteger gcd=null;
			BigInteger one=new BigInteger("1");
			do{
				rand.nextBytes(random);
				r=new BigInteger(1,random);
				gcd=r.gcd(n);
			}
			while(!gcd.equals(one) || r.compareTo(n)>=0 || r.compareTo(one)<=0);
			//Blinding
			BigInteger blind=((r.modPow(e,n)).multiply(ct)).mod(n);
			byte[] blindBytes=blind.toByteArray();
			//Sign blind
			
			//These keys should be stored in the database in same way as admin keys
			
			rs=st.executeQuery("SELECT sk FROM voterkeys WHERE username='"+username+"'");
			byte[] votersk=rs.getBytes("sk");
			PrivateKey sk=KeyFactory.getInstance("RSA").generatePrivate(new X509EncodedKeySpec(votersk));
			
			
			
			Signature sign=Signature.getInstance("SHA256WITHRSA");
			sign.initSign(sk);
			sign.update(blindBytes);
			byte[] signedBlind=sign.sign();
			
			//Send username, signedBlind and blindBytes to Administrator to be signed
			byte[] usernameBytes=username.getBytes();
			Socket socket=new Socket("127.0.0.1",33333);
			System.out.println("Connected to server");
			InputStream in=socket.getInputStream();
			OutputStream out=socket.getOutputStream();
			out.write(usernameBytes);
			Thread.sleep(100);
			out.write(blindBytes);
			Thread.sleep(100);
			out.write(signedBlind);
			Thread.sleep(100);
			
			// receive the signedVote from the admin
			int recvMsgSize;
			byte [] receiveBuf=new byte[128];
			ArrayList<byte[]> bufArray = new ArrayList<byte[]>();
			recvMsgSize=in.read(receiveBuf);
			byte[] tmp = new byte[recvMsgSize];
			System.arraycopy(receiveBuf, 0, tmp, 0, recvMsgSize);
			bufArray.add(tmp);
			//System.out.println( bufArray.get(0));
			byte[] signedVote=bufArray.get(0);
			socket.close();
			

			
			//username may need to be signed, not sure.
			//Receive blind signature for c
			//Need to unblind the returned signature
			/*
			 * BigInteger s=r.modInverse(n).multiply(blindsignature).mod(n);
			 * s will be the signature of c, the encrypted vote with no blind.  Convert it to bytes.
			 * byte[] signedVote=s.toByteArray();
			 * Check that signedVote is a valid signature of c
			 * Will need to get adminPK from a database
			 * Signature ver=Signature.getInstance("SHA256WITHRSA");
			 * ver.initVerify(adminPK);
			 * ver.update(c);
			 * boolean good=ver.verify(signedVote);
			 * if(good)
			 * 		Continue
			 * if not valid then need to raise some alarms, but don't need that implemented yet
			 */
						
			/*Send signedVote along with c to Counting Principal along with public key (on the anonymous channel).  
			 * OR: We could create a table in the database of public and private signing keys.
			 * Whenever a user creates an account, we add a key pair.  This is probably necessary:
			 * if we just send the public key along with the signature, what's to stop someone from just
			 * replacing it with their own signed vote and public key?
			 */
			
			/*Once Counter publishes list, voter must:
			 * check the number of votes corresponds to list provided by admin
			 * check that his ballot is on the list
			 * send AES key k that was used to encrypt vote (again, on anonymous channel) with the corresponding nonce.
			 */
			
		}
		catch(Exception e){
			System.out.println(e);
		}
	}
}
