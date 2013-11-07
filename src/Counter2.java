import java.net.*;

import javax.crypto.*;

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
			
			final Connection con=DriverManager.getConnection(url, user, pw);
			final Statement st=con.createStatement();
			
			System.out.println("start");
			int servPort=7000;
			ServerSocket servSock=new ServerSocket(servPort);	

			while(true){
				final Socket clntSock=servSock.accept();
				SocketAddress clientAddress=clntSock.getRemoteSocketAddress();
				System.out.println("receiving requests from client at "+clientAddress);
				
				new Thread(new Runnable() {
				PreparedStatement pst=null;
				ResultSet rs=null;	
				int recvMsgSize;
				byte [] receiveBuf=new byte[1280];
				ArrayList<byte[]> bufArray = new ArrayList<byte[]>();
				InputStream in=clntSock.getInputStream();
				File log=new File("log.txt");
	            java.util.Date date = new java.util.Date();
	            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy h:mm:ss a");
				PrintWriter logwrite =new PrintWriter(new BufferedWriter(new FileWriter(log, true)));
				public void run(){
					try{
						
					
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
				Cipher dec=Cipher.getInstance("AES/CBC/PKCS5PADDING");
				dec.init(Cipher.DECRYPT_MODE,sk,new IvParameterSpec(iv));
				pst=con.prepareStatement("SELECT encVote FROM "+electionname+"votes WHERE nonce=?");
				pst.setBytes(1, nonce);
				rs=pst.executeQuery();
				rs.next();
				byte[] encVote=rs.getBytes("encVote");
				byte[] byteVote=dec.doFinal(encVote);
				String decVote=new String(byteVote);
				st.execute("INSERT INTO "+electionname+"results (vote) values ('"+decVote+"');");
			
			
			logwrite.close();

					}
					catch (Exception e){}
				}
				/***When all of the results have been put in the table, do the tally and send tally result to all vote clients****/

		}).start();
	}
	
}
		catch(Exception e){
			System.out.println(e);
		}
	}
}
