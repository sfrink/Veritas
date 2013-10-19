import java.math.BigInteger;
import java.net.*;
import javax.crypto.*;
import java.security.*;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import javax.crypto.spec.IvParameterSpec;


public class Counter {

	public static void main(String[] args){
		try{
			//Network stuff to get (encVote, signedVote) from voter
			byte[] encVote; //=initialized to whatever is sent from voter;
			byte[] signedVote; //=whatever is sent from voter
			//Check signature
			Signature ver=Signature.getInstance("SHA256WITHRSA");
			//We need to get the pk from a database table probably
			//ver.initVerify(pk);
			ver.update(encVote);
			boolean goodSign=ver.verify(signedVote);
			if(goodSign){
				SecureRandom rand=new SecureRandom();
				byte[] nonce=new byte[20];
				rand.nextBytes(nonce);
				//Store nonce along with encVote somewhere
				//Add one to totalVotesCollected
			}
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
		catch(Exception e){
			System.out.println(e);
		}
	}
}
