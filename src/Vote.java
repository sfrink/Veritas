import java.math.BigInteger;
import java.net.*;

import javax.crypto.*;

import java.security.*;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.sql.*;
import java.io.*;
import java.security.spec.*;
import java.text.SimpleDateFormat;
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
			File log=new File("log.txt");
            java.util.Date date = new java.util.Date();
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy h:mm:ss a");
			PrintWriter logwrite =new PrintWriter(new BufferedWriter(new FileWriter(log, true)));
			con=DriverManager.getConnection(url, user, pw);
			st=con.createStatement();
		
			//BufferedReader in=new BufferedReader(new InputStreamReader(client.getInputStream()));
			RSAPublicKey pkAdmin;
			
			
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
			
			//Send username, signedBlind and blindBytes, ******AND ELECTIONNAME****** to Administrator to be signed
			byte[] usernameBytes=username.getBytes();
			Socket socket=new Socket("localhost",33333);
			System.out.println("Connected to server");
			InputStream in=socket.getInputStream();
			OutputStream out=socket.getOutputStream();
			out.write(usernameBytes);
			Thread.sleep(100);
			out.write(blindBytes);
			Thread.sleep(100);
			out.write(signedBlind);
			Thread.sleep(100);
			logwrite.println("Time: "+sdf.format(date)+"; Event Type: Voter Send Info; Username: "+username+"; Description: Voter sent blind and signed blind to Admin\n");
			
			// receive the signedVote from the admin
			int recvMsgSize;
			byte [] receiveBuf=new byte[128];
			ArrayList<byte[]> bufArray = new ArrayList<byte[]>();
			recvMsgSize=in.read(receiveBuf);
			byte[] tmp = new byte[recvMsgSize];
			System.arraycopy(receiveBuf, 0, tmp, 0, recvMsgSize);
			bufArray.add(tmp);
			//System.out.println( bufArray.get(0));
			byte[] blindedSignedVote=bufArray.get(0); //need to unblind
			socket.close();
			logwrite.println("Time: "+sdf.format(date)+"; Event Type: Admin Receive Info; Username: "+username+"; Description: Voter received  signed blind from Admin\n");
			
			
			//Need to unblind the returned signature
			BigInteger blindsignature=new BigInteger(blindedSignedVote);
			BigInteger s=r.modInverse(n).multiply(blindsignature).mod(n);
			//s will be the signature of c, the encrypted vote with no blind.  Convert it to bytes.
			byte[] signedVote=s.toByteArray();
			//Check that signedVote is a valid signature of c
			Signature ver=Signature.getInstance("SHA256WITHRSA");
			ver.initVerify(pkAdmin);
			ver.update(c);
			boolean good=ver.verify(signedVote);
			if(good){
				/*Send signedVote along with c to Counting Principal.*/
				
				/*Once Counter publishes list, voter must:
				 * check the number of votes corresponds to list provided by admin
				 * check that his ballot is on the list
				 * send AES key k that was used to encrypt vote (again, on anonymous channel) with the corresponding nonce.
				 */
			}
			else{
				//if not valid then need to raise some alarms, but don't need that implemented yet
			}
			logwrite.close();
		}
		catch(Exception e){
			System.out.println(e);
		}
	}
}
