import java.sql.*;
import java.util.Scanner;

public class voter{
	public static void main(String[] args){
		Connection con=null;
		Statement st=null;
		String username="sfrink";
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
			rs=st.executeQuery("SELECT * FROM elections WHERE usernames='"+username+"'");
			System.out.println("You are eligible for the following elections:");
			int numelections=0;
			while(rs.next()){
				ResultSetMetaData metadata = rs.getMetaData();
				int columnCount = metadata.getColumnCount();
				for(int i=3;i<=columnCount;i++){
					if(rs.getString(i).equals("1")){
						System.out.print((i-2)+"."+metadata.getColumnName(i));
						numelections++;
					}
				}
			}
			if(numelections==0)
				System.out.println("You are not currently eligible for any elections.");
			else{
				System.out.println("\nPlease type the election name you would like to vote in:");
				String election=scan.next();
				rs=st.executeQuery("SELECT candidateSet FROM candidates WHERE election='"+election+"'");
				if(rs.next()){
					System.out.println("Here are the candidates:");
					String candidates=rs.getString(1);
					System.out.println(candidates);
				}
				System.out.println("Please enter the candidate of your choice:");
				String choice=scan.next();
				//vote(choice);
				//Display candidates, choose a candidate, send it to some vote function
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
		finally {
			try{
				if(rs!=null){
					rs.close();
				}
				if(st!=null){
					st.close();
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
