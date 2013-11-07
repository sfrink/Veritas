import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketAddress;
import java.util.ArrayList;
import java.sql.*;


public class settup {

	public static void main(String[] args) throws IOException, InterruptedException, ClassNotFoundException {

		try{
			String url="jdbc:mysql://localhost:3306/Server";
    		String user="root";
    		String pw="";
    		Connection conn = DriverManager.getConnection(url, user, pw);
            Statement stmt = conn.createStatement();
            
            
			int servPort = 8001;
			ServerSocket servSock = new ServerSocket(servPort);
	
			while (true) {
	
				System.out.print("start");
				final Socket clntSock = servSock.accept();
				SocketAddress clientAddress = clntSock.getRemoteSocketAddress();
				System.out.println("receiving requests from client at "+ clientAddress);
	
				byte[] receiveBuf = new byte[4096];
				InputStream in = clntSock.getInputStream();
				ArrayList<byte[]> bufArray = new ArrayList<byte[]>();
				in.read(receiveBuf);
				ByteArrayInputStream byteArray = new ByteArrayInputStream(receiveBuf);
				for (int j = 0; j <= 1; j++) {
					int tmp = byteArray.read();
					byte[] tmpArray = new byte[tmp];
					byteArray.read(tmpArray, 0, tmp);
					bufArray.add(tmpArray);
				}
					
				String electionname=new String(bufArray.get(0), "UTF-8");
				String cand=new String(bufArray.get(1), "UTF-8");
	            PreparedStatement pstmt=null;
	            
	            
	            RSAKeyPairGenerator r=new RSAKeyPairGenerator();
    			r.init(new RSAKeyGenerationParameters(new BigInteger("10001",16),new SecureRandom(),3072,80));
    			AsymmetricCipherKeyPair keys=r.generateKeyPair();
    			AsymmetricKeyParameter pkAdmin=keys.getPublic();
    			AsymmetricKeyParameter skAdmin=keys.getPrivate();
    			byte[] pk=serialize(pkAdmin);
    			byte[] sk=serialize(skAdmin);
    			pstmt=conn.prepareStatement("INSERT INTO adminkeys (election, pk, sk) values (?,?,?);");
    			pstmt.setString(1, electionname);
    			pstmt.setBytes(2, pk);
    			pstmt.setBytes(3, sk);
    			pstmt.execute();
    			stmt.execute("INSERT INTO candidates (election, candidateSet, numVoters) VALUES ('"+electionname+"', '"+cand+"', '0');");
    			
    			ResultSet rs=stmt.executeQuery("SELECT usernames FROM elections WHERE usertype='1'");
    			//Send usernames from rs over to veritaslogin
    			
				}
		
		}
	
	}
	private static byte[] serialize(Object n) throws IOException {
		ByteArrayOutputStream b = new ByteArrayOutputStream();
        ObjectOutputStream o = null;
		try {
			o = new ObjectOutputStream(b);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        try {
			o.writeObject(n);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return b.toByteArray();
	}
	
	
	
	
	
	
	
	private static Object deserialize(byte[] encVote) throws IOException, ClassNotFoundException {
		ByteArrayInputStream b = new ByteArrayInputStream(encVote);
        ObjectInputStream o = new ObjectInputStream(b);
        return o.readObject();
	}
}
