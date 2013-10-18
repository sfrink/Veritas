import java.math.BigInteger;
import java.net.*;
import javax.crypto.*;
import java.security.*;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;

public class Vote {

	
	public static void vote(String b){
		try{
			Socket MyClient=new Socket("localhost", 6545);
			RSAPublicKey pkAdmin;
			RSAPrivateKey skAdmin;
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
			KeyPairGenerator genRSA=KeyPairGenerator.getInstance("RSA");
			genRSA.initialize(3072);
			KeyPair keypair=genRSA.genKeyPair();
			pkAdmin=(RSAPublicKey)keypair.getPublic();
			skAdmin=(RSAPrivateKey)keypair.getPrivate();
			BigInteger n=pkAdmin.getModulus();
			BigInteger e=pkAdmin.getPublicExponent();
			BigInteger d=skAdmin.getPrivateExponent();
			BigInteger ct=new BigInteger(c);
			SecureRandom rand=new SecureRandom();
			byte[] random=new byte[10];
			BigInteger r=null;
			BigInteger gcd=null;
			BigInteger one=new BigInteger("1");
			do{
				rand.nextBytes(random);
				r=new BigInteger(random);
				gcd=r.gcd(n);
			}
			while(!gcd.equals(one) || r.compareTo(n)>=0 || r.compareTo(one)<=0);
			//Blinding
			BigInteger blind=((r.modPow(e,n)).multiply(ct)).mod(n);
			byte[] blindBytes=blind.toByteArray();
			//Send blind to Administrator to be signed
			//Receive signature for c
			
			//Sign c.  Here we DO need to set up a new pk and sk.
			KeyPairGenerator genRSA2=KeyPairGenerator.getInstance("RSA");
			genRSA.initialize(3072);
			KeyPair kp=genRSA2.genKeyPair();
			PublicKey pk=kp.getPublic();
			PrivateKey sk=kp.getPrivate();
			Signature sign=Signature.getInstance("SHA256WITHRSA");
			sign.initSign(sk);
			sign.update(blindBytes);
			byte[] signedVote=sign.sign();
			
			/*Send signedVote to Counting Principal along with public key.
			 * OR: We could create a table in the database of public and private signing keys.
			 * Whenever a user creates an account, we add a key pair.
			 */
			
		}
		catch(Exception e){
			System.out.println(e);
		}
	}
}
