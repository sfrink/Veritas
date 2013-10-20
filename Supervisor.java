import java.sql.*;
import java.util.Scanner;

public class Supervisor{
	public static void main(String[] args){
		Connection con=null;
		
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
			st=con.createStatement();
			st2=con.createStatement();
			ResultSet ressult = st.executeQuery("SELECT usernames FROM elections");
	
			String userType;
			String userName;
			
			//	String create=scan.next();
    		//if (create.equals("yes")){
    			System.out.println("please give a name for this election");
    			String elec=scan.next();
    			System.out.println("please enter the name of the candidates");
    			String cand=scan.next();
    			st.execute("INSERT into candidates (election_name, candidate_name) VALUES ('" + elec +"','" + cand+"')");

    			//	}  
    		
    	

			while(ressult.next()) { 
			  userName = ressult.getString("usernames");
			  System.out.println("Please assign crendtials to the users,1 for yes, and 0 for no:");
			  System.out.println(userName+":");
			  userType = scan.next();
			  st2.executeUpdate("UPDATE elections SET elec1 = " + userType + " WHERE usernames = '" + userName + "'");
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
