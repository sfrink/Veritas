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
		String url="jdbc:mysql://localhost:3306/Client";
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
			//System.out.println(c.length);
			
			//Blinding key setup
			
			//System.out.println("testing1");			
			
			//Some network stuff to get pk:
			Socket socket=new Socket("localhost",33333);
			System.out.println("Connected to server");
			InputStream in=socket.getInputStream();
			OutputStream out=socket.getOutputStream();
			byte[] electionnameByte=electionname.getBytes();
			out.write(electionnameByte);
		
			byte[] receiveBuf = new byte[12800];
			in.read(receiveBuf);
			ArrayList<byte[]> bufArray2 = new ArrayList<byte[]>();
			ByteArrayInputStream byteArray = new ByteArrayInputStream(receiveBuf);
			for (int j = 0; j <=2; j++) {
					int tmp = byteArray.read();
					byte[] tmpArray = new byte[tmp];
					byteArray.read(tmpArray, 0, tmp);
					bufArray2.add(tmpArray);
				}  
	
			byte[] adminkey=bufArray2.get(0);
			byte[] modulus=bufArray2.get(1);
			//System.out.println("got stuff from admin");
			BigInteger blindFactor=getBlindingFactor(adminkey, modulus);

			//Blind encrypted vote:
			byte[] blindBytes=blind(c, adminkey, modulus, blindFactor);
			/*BigInteger a=new BigInteger(adminkey);
			/BigInteger m=new BigInteger(modulus);
			RSAKeyParameters adminpk=new RSAKeyParameters(false,m,a);
			RSABlindingParameters bParams=new RSABlindingParameters(adminpk, bf);
			ParametersWithRandom pwr=new ParametersWithRandom(bParams);
			RSABlindingEngine eng= new RSABlindingEngine();
			eng.init(true, pwr);
			System.out.println("output size:"+eng.getOutputBlockSize());
			System.out.println("input size:"+eng.getInputBlockSize());
			byte[] blindBytes=eng.processBlock(c, 0, c.length);*/
			
			//Sign blind
			rs=st.executeQuery("SELECT sk FROM voterkey WHERE username='"+username+"'");
			rs.next();
			byte[] votersk=rs.getBytes("sk");
			byte[] signedBlind=signBlind(blindBytes, votersk);
			byte[] nonce = null;
			byte[] key = null;
			
			//Send username, signedBlind and blindBytes, and electionname to Administrator to be signed
			byte[] usernameBytes=username.getBytes();
			byte[] electionnameBytes=electionname.getBytes();
			rs=st.executeQuery("SELECT pk FROM voterkey WHERE username='"+username+"'");
			rs.next();
			byte[] voterpk=rs.getBytes("pk");
			//System.out.println("got stuff altogether");
			
			
			PublicKey PK=KeyFactory.getInstance("RSA").generatePublic(new X509EncodedKeySpec(voterpk));
			
			Signature ver=Signature.getInstance("SHA256WITHRSA");
			ver.initVerify(PK);
			ver.update(blindBytes);
			System.out.println(ver.verify(signedBlind));
			ByteArrayOutputStream byteArray2 = new ByteArrayOutputStream();
			DataOutputStream dataOut =new DataOutputStream(byteArray2);
			System.out.println("Blind: "+blindBytes.length);
			System.out.println("sign: "+signedBlind.length);
			System.out.println("pk:"+voterpk.length);
			dataOut.writeInt(usernameBytes.length);
			dataOut.write(usernameBytes);
			dataOut.writeInt(blindBytes.length);
			dataOut.write(blindBytes);
			dataOut.writeInt(signedBlind.length);
			dataOut.write(signedBlind);
			dataOut.writeInt(voterpk.length);
			dataOut.write(voterpk);
		/*	for(int i=0;i<blindBytes.length;i++){
				byte[] seg=new byte[1];
				seg[0]=blindBytes[i];
				byteArray2.write(seg);
			}
			//byteArray2.write(blindBytes);
			byteArray2.write(signedBlind.length);
			for(int i=0;i<signedBlind.length;i++){
				byte[] seg=new byte[1];
				seg[0]=signedBlind[i];
				byteArray2.write(seg);
			}
			//byteArray2.write(signedBlind);
			byteArray2.write(voterpk.length);
			for(int i=0;i<voterpk.length;i++){
				byte[] seg=new byte[1];
				seg[0]=voterpk[i];
				byteArray2.write(seg);
			}
			//byteArray2.write(voterpk);*/
			out.write(byteArray2.toByteArray());
			logwrite.println("Time: "+sdf.format(date)+"; Event Type: Voter Send Info; Username: "+username+"; Description: Voter sent blind and signed blind to Admin\n");
			//System.out.println("testing3");
			
			// receive the signedVote from the admin
			
			byte [] receiveBuf2=new byte[128];
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
			byte[] signedVote=unblind(blindedSignedVote, blindFactor, adminkey, modulus);
			//eng.init(false, pwr);
			//byte[] signedVote=eng.processBlock(blindedSignedVote, 0, blindedSignedVote.length);
			System.out.println("unblinded");
			//verify
			boolean good=verify(adminkey, c, signedVote, modulus);
			System.out.println("verify ran");
			if(good){
				System.out.println("sig verified");
				Socket socket2=new Socket("localhost",8000);	
				InputStream in2=socket2.getInputStream();
				OutputStream out2=socket2.getOutputStream();
				System.out.println("Connected to server of the counter");
				ByteArrayOutputStream byteArray3 = new ByteArrayOutputStream();
				DataOutputStream dataOut2 =new DataOutputStream(byteArray3);
			
				dataOut2.writeInt(c.length);
				dataOut2.write(c);
				dataOut2.writeInt(signedVote.length);
				dataOut2.write(signedVote);
				dataOut2.writeInt(electionnameBytes.length);
				dataOut2.write(electionnameBytes);
		
		
				out2.write(byteArray3.toByteArray());
				in2.read(receiveBuf);
				ByteArrayInputStream byteArray4 = new ByteArrayInputStream(receiveBuf);
				for (int j = 0; j <= 2; j++) {
					int tmp = byteArray4.read();
					byte[] tmpArray = new byte[tmp];
					byteArray4.read(tmpArray, 0, tmp);
					bufArray.add(tmpArray);
				}
				nonce= bufArray.get(0);
				key=k.getEncoded();
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
				System.exit(0);
				//if not valid then need to raise some alarms, but don't need that implemented yet
			}
			/***List of (nonce,encVote,signedVote) needs to be sent from Counter to Vote***/
			
			
			//byte[] encVote= bufArray.get(1);	
			//byte[] signedVote2= bufArray.get(2);	
			/*
			 * Needs to be redone with list sent from Counter--find your nonce, send over with key
			 * pst=con.prepareStatement("SELECT nonce FROM "+electionname+"votes WHERE encVote= (?)");
			pst.setBytes(1,c);
			rs=pst.executeQuery();
			rs.next();*/
			//byte[] nonce=rs.getBytes("nonce");
			//System.out.println("testing6");
		
		

			Socket socket3=new Socket("localhost",7000);
			System.out.println("Connected to server of the counter2");
			OutputStream out3=socket3.getOutputStream();
			InputStream in3=socket3.getInputStream();
			ByteArrayOutputStream byteArray3 = new ByteArrayOutputStream();
			byteArray3.write(nonce.length);
			byteArray3.write(nonce);
			System.out.println("sent nonce");
			byteArray3.write(key.length);
			byteArray3.write(key);
			System.out.println("sent key");
			byteArray3.write((electionname.getBytes()).length);
			byteArray3.write(electionname.getBytes());
			System.out.println("sent elecname");
			byteArray3.write(iv.length);
			byteArray3.write(iv);
			System.out.println("sent iv");
			out3.write(byteArray3.toByteArray());
			System.out.println("sent all");
			
			byte[] recevBuff=new byte[10000];
			in3.read(recevBuff);
			String results=new String(recevBuff);
			System.out.println("The winner was "+results+".");
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
	private static boolean verify(byte[] pk, byte[] message, byte[] sig, byte[] mod) throws IOException, ClassNotFoundException{
		PSSSigner signer=new PSSSigner(new RSAEngine(), new SHA1Digest(), 20);
		BigInteger p=new BigInteger(pk);
		BigInteger m=new BigInteger(mod);
		RSAKeyParameters adminpk=new RSAKeyParameters(false, m, p);
		signer.init(false, adminpk);
		signer.update(message, 0,message.length);
		return signer.verifySignature(sig);
		//BigInteger sign=new BigInteger(sig);
		//BigInteger mess=new BigInteger(message);
		//BigInteger orig=sign.modPow(p,m);
		//if(orig.compareTo(mess)==0)
		//	return true;
		//else
		//	return false;
	}
	
	private static byte[] unblind(byte[] blindedMessage, BigInteger blindFactor, byte[] pk, byte[] mod) throws IOException, ClassNotFoundException{
		RSABlindingEngine eng=new RSABlindingEngine();
		BigInteger p=new BigInteger(pk);
		BigInteger m=new BigInteger(mod);
		RSAKeyParameters adminpk=new RSAKeyParameters(false, m, p);
		RSABlindingParameters blindParams=new RSABlindingParameters(adminpk, blindFactor);
		eng.init(false, blindParams);
		System.out.println(eng.getInputBlockSize());
		System.out.println(blindedMessage.length);
		return eng.processBlock(blindedMessage, 0, blindedMessage.length);
	}
	
	private static BigInteger getBlindingFactor(byte[] pk, byte[] mod) throws IOException, ClassNotFoundException{
		System.out.println("in blinding factor");
		BigInteger p=new BigInteger(pk);
		BigInteger m=new BigInteger(mod);
		//System.out.println(m.toString());
		RSAKeyParameters adminpk=new RSAKeyParameters(false, m, p);
		RSABlindingFactorGenerator genBlind=new RSABlindingFactorGenerator();
		genBlind.init(adminpk);
		return genBlind.generateBlindingFactor();
		/*SecureRandom rand=new SecureRandom();
		byte[] random=new byte[10];
		BigInteger r=null;
		BigInteger gcd=null;
		BigInteger one=new BigInteger("1");
		do{
			rand.nextBytes(random);
			r=new BigInteger(1,random);
			gcd=r.gcd(m);
		}
		while(!gcd.equals(one) || r.compareTo(m)>=0 || r.compareTo(one)<=0);
		return r;*/
	}
	
	/*private static RSABlindingEngine getEng(byte[] pk, byte[] mod){
		BigInteger p=new BigInteger(pk);
		BigInteger m=new BigInteger(mod);
		RSAKeyParameters adminpk=new RSAKeyParameters(false, m, p);
		RSABlindingEngine eng= new RSABlindingEngine();
		eng.init(true, adminpk);
		return eng;
	}*/
	
	private static byte[] blind(byte[] message, byte[] pk, byte[] mod, BigInteger blindFactor) throws IOException, ClassNotFoundException, DataLengthException, CryptoException{
		System.out.println("in blind");
		BigInteger p=new BigInteger(pk);
		BigInteger m=new BigInteger(mod);
		RSAKeyParameters adminpk=new RSAKeyParameters(false, m, p);
		RSABlindingParameters blindParams=new RSABlindingParameters(adminpk, blindFactor);
		RSABlindingEngine eng=new RSABlindingEngine();
		//eng.init(true, blindParams);
				
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

}