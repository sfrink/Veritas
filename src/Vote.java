import java.math.BigInteger;
import java.net.*;

import javax.crypto.*;

import org.bouncycastle.crypto.CryptoException;
import org.bouncycastle.crypto.DataLengthException;
import org.bouncycastle.crypto.digests.SHA1Digest;
import org.bouncycastle.crypto.engines.RSABlindingEngine;
import org.bouncycastle.crypto.engines.RSAEngine;
import org.bouncycastle.crypto.generators.RSABlindingFactorGenerator;
import org.bouncycastle.crypto.params.RSABlindingParameters;
import org.bouncycastle.crypto.params.RSAKeyParameters;
import org.bouncycastle.crypto.signers.PSSSigner;

import java.security.*;
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
		PreparedStatement pst=null;
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
		
			//System.out.println("testing0");

			//Encrypting vote
			KeyGenerator gen=KeyGenerator.getInstance("AES");
			gen.init(256);
			SecretKey k=gen.generateKey();
			Cipher enc=Cipher.getInstance("AES/CBC/PKCS5PADDING");
			enc.init(Cipher.ENCRYPT_MODE, k);
			byte[] iv=enc.getIV();
			byte[] vote=b.getBytes();
			//Encrypt vote (essentially the commit from FOO92)
			byte[] c=enc.doFinal(vote);
			//Blinding key setup
			
			//System.out.println("testing1");			
			
			//Some network stuff to get pk:
			Socket socket=new Socket("localhost",33333);
			System.out.println("Connected to server");
			InputStream in=socket.getInputStream();
			OutputStream out=socket.getOutputStream();
			byte[] electionnameByte=electionname.getBytes();
			out.write(electionnameByte);
		
			byte[] receiveBuf = new byte[4096];
			in.read(receiveBuf);
			byte[] adminkey=receiveBuf;
			
			BigInteger blindFactor=getBlindingFactor(adminkey);
			
			//Blind encrypted vote:
			byte[] blindBytes=blind(c, adminkey, blindFactor);
			
			
			//Sign blind
			rs=st.executeQuery("SELECT sk FROM voterkeys WHERE username='"+username+"'");
			rs.next();
			byte[] votersk=rs.getBytes("sk");
			byte[] signedBlind=signBlind(blindBytes, votersk);

			
			//Send username, signedBlind and blindBytes, and electionname to Administrator to be signed
			byte[] usernameBytes=username.getBytes();
			byte[] electionnameBytes=electionname.getBytes();
		
			

		
			ByteArrayOutputStream byteArray2 = new ByteArrayOutputStream();
			byteArray2.write(usernameBytes.length);
			byteArray2.write(usernameBytes);
			byteArray2.write(blindBytes.length);
			byteArray2.write(blindBytes);
			byteArray2.write(signedBlind.length);
			byteArray2.write(signedBlind);
			out.write(byteArray2.toByteArray());
			
			logwrite.println("Time: "+sdf.format(date)+"; Event Type: Voter Send Info; Username: "+username+"; Description: Voter sent blind and signed blind to Admin\n");
			//System.out.println("testing3");
			
			// receive the signedVote from the admin
			
			byte [] receiveBuf2=new byte[128000];
			in.read(receiveBuf2);
			byte[] blindedSignedVote= receiveBuf2;
			ArrayList<byte[]> bufArray = new ArrayList<byte[]>();
			/*int recvMsgSize;
			byte [] receiveBuf=new byte[128000];
			ArrayList<byte[]> bufArray = new ArrayList<byte[]>();
			recvMsgSize=in.read(receiveBuf);
			byte[] tmp = new byte[recvMsgSize];			
			System.arraycopy(receiveBuf, 0, tmp, 0, recvMsgSize);
			bufArray.add(tmp);
			byte[] blindedSignedVote=bufArray.get(0); */     //need to unblind
			socket.close();
			logwrite.println("Time: "+sdf.format(date)+"; Event Type: Admin Receive Info; Username: "+username+"; Description: Voter received signed blind from Admin\n");
			
			//unblind
			byte[] signedVote=unblind(blindedSignedVote, blindFactor, adminkey);
			
			//verify
			boolean good=verify(adminkey, c, signedVote);
			
			if(good){
				
				Socket socket2=new Socket("localhost",8000);
				System.out.println("Connected to server of the counter");
				ByteArrayOutputStream byteArray3 = new ByteArrayOutputStream();
				byteArray3.write(c.length);
				byteArray3.write(c);
				byteArray3.write(signedVote.length);
				byteArray3.write(signedVote);
				
				byteArray3.write(electionnameBytes.length);
				byteArray3.write(electionnameBytes);
				out.write(byteArray3.toByteArray());
				socket2.close();

				logwrite.println("Time: "+sdf.format(date)+"; Event Type: Voter Send Info; Electionname: "+electionname+"; Description: Voter sent signed vote to the counter\n");
				//System.out.println("testing5 sig verified");
				/*Send signedVote along with c to Counting Principal.*/
				
				/*Once Counter publishes list, voter must:
				 * check the number of votes corresponds to list provided by admin
				 * check that his ballot is on the list
				 * send AES key k that was used to encrypt vote (again, on anonymous channel) with the corresponding nonce.
				 */
			}
			else{
				System.out.println("did not verify");
				//if not valid then need to raise some alarms, but don't need that implemented yet
			}
			/***List of (nonce,encVote,signedVote) needs to be sent from Counter to Vote***/
			
			in.read(receiveBuf);
			ByteArrayInputStream byteArray4 = new ByteArrayInputStream(receiveBuf);
			for (int j = 0; j <= 2; j++) {
				int tmp = byteArray4.read();
				byte[] tmpArray = new byte[tmp];
				byteArray4.read(tmpArray, 0, tmp);
				bufArray.add(tmpArray);
			}
			byte[] nonce= bufArray.get(0);
			byte[] encVote= bufArray.get(1);	
			byte[] signedVote2= bufArray.get(2);	
			/*
			 * Needs to be redone with list sent from Counter--find your nonce, send over with key
			 * pst=con.prepareStatement("SELECT nonce FROM "+electionname+"votes WHERE encVote= (?)");
			pst.setBytes(1,c);
			rs=pst.executeQuery();
			rs.next();*/
			//byte[] nonce=rs.getBytes("nonce");
			//System.out.println("testing6");
			byte[] key=k.getEncoded();
			
			Socket socket3=new Socket("localhost",7000);
			System.out.println("Connected to server of the counter2");
			OutputStream out3=socket3.getOutputStream();
			ByteArrayOutputStream byteArray3 = new ByteArrayOutputStream();
			byteArray3.write(nonce.length);
			byteArray3.write(nonce);
			byteArray3.write(key.length);
			byteArray3.write(key);
			byteArray3.write(iv.length);
			byteArray3.write(iv);
			out3.write(byteArray3.toByteArray());
			byte[] recevBuff;
			in.read(recevBuff);
			String results=new String(recevBuff);
			System.out.println("results");
			socket3.close();
			logwrite.println("Time: "+sdf.format(date)+"; Event Type: Voter Send Info; Electionname: "+electionname+"; Description: Voter sent signed vote to the counter\n");
			//System.out.println("testing7");
			
			/*rs=st.executeQuery("SELECT numVoters FROM candidates WHERE election='"+electionname+"';");
			rs.next();
			int numVoters=Integer.parseInt(rs.getString("numVoters"));
			System.out.println("testing8");
			rs=st.executeQuery("SELECT candidateSet FROM candidates WHERE election='"+electionname+"';");
			rs.next();
			System.out.println("testing9");
			String cand=rs.getString("candidateSet");
			String[] candidates=cand.split(",");
			int[] tally=new int[candidates.length];
			logwrite.close();*/

			/***Counter needs to send tally results to ALL clients - not sure of implementation yet exactly***/
			/*
			 * This whole while loop needs to be replaced.  Tally should be done on server side.
			while(true){
				rs=st.executeQuery("SELECT * FROM "+electionname+"results;");
				int count=0;
				while(rs.next()){
					count++;
				}
				if(count==numVoters){
					rs=st.executeQuery("SELECT * FROM "+electionname+"results;");
					while(rs.next()){
						for(int i=0;i<candidates.length;i++){
							if(rs.getString("vote").equals(candidates[i]))
								tally[i]++;
						}
					}
					int maxindex=0;
					int max=0;
					//String tie=""; We'll want to check for ties somehow
					for(int i=0;i<tally.length;i++){
						if(tally[i]>max){
							maxindex=i;
							max=tally[i];
						}
					}
					System.out.println("The winner was "+candidates[maxindex]+".");
					System.exit(0);
				}
			}*/
			
			
		}
		catch(Exception e){
			System.out.println(e);
		}
	}
	private static boolean verify(byte[] pk, byte[] message, byte[] sig) throws IOException, ClassNotFoundException{
		PSSSigner signer=new PSSSigner(new RSAEngine(), new SHA1Digest(), 20);
		RSAKeyParameters adminpk = (RSAKeyParameters)deserialize(pk);
		signer.init(false, adminpk);
		signer.update(message, 0,message.length);
		return signer.verifySignature(sig);
	}
	
	private static byte[] unblind(byte[] blindedMessage, BigInteger blindFactor, byte[] pk) throws IOException, ClassNotFoundException{
		RSABlindingEngine eng=new RSABlindingEngine();
		RSAKeyParameters adminpk = (RSAKeyParameters)deserialize(pk);

		RSABlindingParameters blindParams=new RSABlindingParameters(adminpk, blindFactor);
		eng.init(false, blindParams);
		return eng.processBlock(blindedMessage, 0, blindedMessage.length);
	}
	
	private static BigInteger getBlindingFactor(byte[] pk) throws IOException, ClassNotFoundException{
		RSAKeyParameters adminpk = (RSAKeyParameters)deserialize(pk);
		
		RSABlindingFactorGenerator genBlind=new RSABlindingFactorGenerator();
		genBlind.init(adminpk);
		return genBlind.generateBlindingFactor();
	}
	
	private static byte[] blind(byte[] message, byte[] pk, BigInteger blindFactor) throws IOException, ClassNotFoundException, DataLengthException, CryptoException{
		RSAKeyParameters adminpk = (RSAKeyParameters)deserialize(pk);
		
		RSABlindingParameters blindParams=new RSABlindingParameters(adminpk, blindFactor);
		RSABlindingEngine eng=new RSABlindingEngine();
		PSSSigner blinder=new PSSSigner(eng, new SHA1Digest(), 20);
		
		blinder.init(true, blindParams);
		blinder.update(message, 0, message.length);
		return blinder.generateSignature();
	}
	
	private static byte[] signBlind(byte[] blind, byte[] sk) throws InvalidKeySpecException, NoSuchAlgorithmException, InvalidKeyException, SignatureException{
		PrivateKey SK=KeyFactory.getInstance("RSA").generatePrivate(new PKCS8EncodedKeySpec(sk));
		Signature sign=Signature.getInstance("SHA256WITHRSA");
		sign.initSign(SK);
		sign.update(blind);
		return 	sign.sign();
	}
	
	private static Object deserialize(byte[] encVote) throws IOException, ClassNotFoundException {
		ByteArrayInputStream b = new ByteArrayInputStream(encVote);
        ObjectInputStream o = new ObjectInputStream(b);
        return o.readObject();
	}

}
