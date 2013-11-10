import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketAddress;
import java.util.ArrayList;
import java.sql.*;


public class Setup {

	public static void main(String[] args) throws IOException, InterruptedException, ClassNotFoundException {

		try{
			String url="jdbc:mysql://localhost:3306/Server";
    		String user="root";
    		String pw="";
    		Connection conn = DriverManager.getConnection(url, user, pw);
            final Statement stmt = conn.createStatement();
            
            
			int servPort = 8001;
<<<<<<< HEAD
			ServerSocket servSock = new ServerSocket(servPort);
			/***Need to make this an if stmt like in veritas login -- should do one thing if its a voter,
			 * Something else if its a supervisor
			 */
=======
			final ServerSocket servSock = new ServerSocket(servPort);
			System.out.print("start");
>>>>>>> bf753a2836b59642d081fdebd70e4ba69d427068
			while (true) {
				final Socket clntSock = servSock.accept();
				SocketAddress clientAddress = clntSock.getRemoteSocketAddress();
				System.out.println("receiving requests from client at "+clientAddress);
				new Thread(new Runnable() {
				public void run(){
				byte[] receiveBuf = new byte[4096];
				byte[] receiveBuf2 = new byte[4096];
				InputStream in = clntSock.getInputStream();
				OutputStream out=clntSock.getOutputStream();
		// get the username and candidate
				ArrayList<byte[]> bufArray = new ArrayList<byte[]>();
				ArrayList<byte[]> bufArray2 = new ArrayList<byte[]>();
			
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
				//add electionname and cand to database
				stmt.execute("ALTER TABLE elections ADD "+electionname+" varchar(1)");
				
				
				//send usernames to the client
				 ByteArrayOutputStream byteArray2 = new ByteArrayOutputStream();
        		 ResultSet rs = stmt.executeQuery("SELECT usernames FROM elections WHERE usertype ='1'");
        		 int count=0;
        		 while (rs.next()){
        			 count++;
        		 }
        		 byteArray2.write(serialize(count).length);
 				 byteArray2.write(serialize(count)); 
    			 while(rs.next()) { 
    			  String userName = rs.getString("usernames");
    			  byte[] userNamebyte=userName.getBytes();
  				  byteArray2.write(userNamebyte.length);
  				  byteArray2.write(userNamebyte);
  				  
    			 }
  				 out.write(byteArray2.toByteArray());
				
  				 
  				 // get the credential from the client:
  				in.read(receiveBuf2);
				ByteArrayInputStream byteArray3 = new ByteArrayInputStream(receiveBuf2);
				for (int j = 0; j <count; j++) {
					int tmp = byteArray.read();
					byte[] tmpArray = new byte[tmp];
					byteArray3.read(tmpArray, 0, tmp);
					bufArray2.add(tmpArray);
				}
  				 // update the database using the credential:  
				
			}
		}).start();
				
				
	  
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
