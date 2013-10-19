import java.math.BigInteger;
import java.net.*;
import javax.crypto.*;
import java.security.*;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;

public class Admin {
	
	public static void main(String[] args){
		try{
			RSAPublicKey pkAdmin;
			RSAPrivateKey skAdmin;
			KeyPairGenerator genRSA=KeyPairGenerator.getInstance("RSA");
			genRSA.initialize(3072);
			KeyPair keypair=genRSA.genKeyPair();
			pkAdmin=(RSAPublicKey)keypair.getPublic();
			skAdmin=(RSAPrivateKey)keypair.getPrivate();
			//Get pk to voters
			//The key generation actually needs to take place before here, and the keys should be stored somewhere
			//This is because keys for the admin need to be the same for all voters in an election.
			//get blinded message m, signature s of m, and username
			//check that the user is eligible for this election
			//check that user has not already asked for signature
			//Check signature of the blinded message
			/*
			 * Signature sign=Signature.getInstance("SHA256WITHRSA");
			 * sign.init(sk);
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
