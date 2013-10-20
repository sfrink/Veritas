import java.sql.*;
import java.util.Scanner;

public class Supervisor{
	public static void main(String[] args){
		Connection con=null;
		Connection con2=null;
		Statement st=null;
		Statement st2=null;
		ResultSet rs=null;
		String url="jdbc:mysql://localhost:3306/elections";
		String user="root";
		String pw="";
		Scanner scan=new Scanner(System.in);
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(Exception e){
			System.out.println(e);
		}
		
		try{
			con=DriverManager.getConnection(url, user, pw);
			con2=DriverManager.getConnection(url, user, pw);
			st=con.createStatement();
			st2=con2.createStatement();
	
			String authorize;
			String userName;
			
			//	String create=scan.next();
    		//if (create.equals("yes")){
    			System.out.println("Please give a name for this election");
    			String elec=scan.next();
    			System.out.println("Please enter the names of the candidates");
    			String cand=scan.next();
    			st.execute("INSERT into candidates (election, candidateSet) VALUES ('" + elec +"','" + cand+"')");
    			st.execute("ALTER TABLE elections ADD "+elec+" varchar(1)");
    		//}  
    		
    		rs = st.executeQuery("SELECT usernames FROM elections");


			while(rs.next()) { 
				System.out.println("in while");
				userName = rs.getString("usernames");
				System.out.println("Please authorize voters, 1 for yes, and 0 for no:");
				System.out.println(userName+":");
				authorize = scan.next();
				st2.executeUpdate("UPDATE elections SET "+elec+" = " + authorize + " WHERE usernames = '" + userName + "' AND usertype='1'");
			} 
		

		}
		
		
		catch(Exception e){
			System.out.println(e);}
		
		
		finally {
			try{
				if(rs!=null){
					rs.close();
				}
				if(st!=null){
					st.close();
				}
				if(st2!=null){
					st2.close();
				}
				if(con!=null){
					con.close();
				}
			}
			catch(Exception e)
			{
			}
		}
	}
}
