import java.net.*;

import javax.crypto.*;

import java.security.*;
import java.security.interfaces.RSAPrivateKey;
import java.security.spec.X509EncodedKeySpec;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.io.*;

import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;


public class Counter2 {

	public static void main(String[] args){
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		PreparedStatement pst=null;
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
			
			System.out.println("start");
			int servPort=7000;
			ServerSocket servSock=new ServerSocket(servPort);	
			int recvMsgSize;
			byte [] receiveBuf=new byte[128];
			ArrayList<byte[]> bufArray = new ArrayList<byte[]>();
			while(true){
				Socket clntSock=servSock.accept();
				SocketAddress clientAddress=clntSock.getRemoteSocketAddress();
				System.out.println("receiving requests from client at "+clientAddress);
				InputStream in=clntSock.getInputStream();
				OutputStream out=clntSock.getOutputStream();
				File log=new File("log.txt");
	            java.util.Date date = new java.util.Date();
	            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy h:mm:ss a");
				PrintWriter logwrite =new PrintWriter(new BufferedWriter(new FileWriter(log, true)));
				for(int j=0;j<=3;j++){	
					recvMsgSize=in.read(receiveBuf);
					byte[] tmp = new byte[recvMsgSize];
					System.arraycopy(receiveBuf, 0, tmp, 0, recvMsgSize);
					bufArray.add(tmp);
					
				}
				
				
				byte[] nonce=bufArray.get(0);
				byte[] key=bufArray.get(1);
				String electionname = new String(bufArray.get(2), "UTF-8");
				byte[] iv=bufArray.get(3);
				
                logwrite.println("Time: "+sdf.format(date)+"; Event Type: Counter Receive Info; Electionname: "+electionname+"; Description: Counter received signed vote from "+electionname+"\n");        
                SecretKeySpec sk=new SecretKeySpec(key, "AES");
				//byte[] iv={(byte)0};// = whatever iv the voter sends
				Cipher dec=Cipher.getInstance("AES/CBC/PKCS5PADDING");
				dec.init(Cipher.DECRYPT_MODE,sk,new IvParameterSpec(iv));
				pst=con.prepareStatement("SELECT encVote FROM "+electionname+"votes WHERE nonce=?");
				pst.setBytes(1, nonce);
				rs=pst.executeQuery();
				byte[] encVote=rs.getBytes("encVote");
				byte[] byteVote=dec.doFinal(encVote);
				String decVote=new String(byteVote);
				st.execute("INSERT INTO "+electionname+"results vote values '"+decVote+"';");
			
			
			logwrite.close();

			}
		}
		catch(Exception e){
			System.out.println(e);
		}
	}
}
