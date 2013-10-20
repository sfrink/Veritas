
/**
 *
 * @author Zhen Ni
 */

import java.sql.*;
import java.io.*;
import java.util.*;

public class VeritasLogin {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {           
        try{
            Scanner sc = new Scanner(System.in);
            String databaseUsername = "";
            String databasePassword = "";
            
            System.out.println("Enter Username: ");         //Input Username
            String name = sc.next();
            System.out.println("Enter Password: ");         //Input Password
            String password = sc.next();
            String url="jdbc:mysql://localhost:3306/elections";
    		String user="root";
    		String pw="";
            Connection conn = DriverManager.getConnection(url, user, pw);          /*  Steven, please help me fill in this line  */
            Statement stmt = conn.createStatement();
            String query = "SELECT * from users";
            ResultSet rs = stmt.executeQuery(query);
            
            while(rs.next()){                           //Read username & password from database
                databaseUsername = rs.getString("username");
                databasePassword = rs.getString("password");
            }
            
            if (name.equals(databaseUsername) && password.equals(databasePassword)) {           //check username & password
                System.out.println("Successful Login!\n----");
            } else {
                System.out.println("Incorrect Username or Password!\n----");
            }
            rs=stmt.executeQuery("SELECT usertype FROM elections WHERE usernames='"+name+"'");
            while(rs.next()){
            	if(rs.getString("usertype").equals("1")){
            		//use voter code
            		rs=stmt.executeQuery("SELECT * FROM elections WHERE usernames='"+name+"'");
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
        				String election=sc.next();
        				rs=stmt.executeQuery("SELECT candidateSet FROM candidates WHERE election='"+election+"'");
        				if(rs.next()){
        					System.out.println("Here are the candidates:");
        					String candidates=rs.getString(1);
        					System.out.println(candidates);
        				}
        				System.out.println("Please enter the candidate of your choice:");
        				String choice=sc.next();
        				//vote(choice);
        			}
            	}
            	else{
            		//Ruinian's supervisor code should go here (in some form)
        			Connection con2=DriverManager.getConnection(url, user, pw);
        			Statement st2=con2.createStatement();
        			
        			String authorize;
        			String userName;
        			
        			//	String create=scan.next();
            		//if (create.equals("yes")){
            			System.out.println("Please give a name for this election");
            			String elec=sc.next();
            			System.out.println("Please enter the names of the candidates");
            			String cand=sc.next();
            			stmt.execute("INSERT into candidates (election, candidateSet) VALUES ('" + elec +"','" + cand+"')");
            			stmt.execute("ALTER TABLE elections ADD "+elec+" varchar(1)");
            		//}  
            		
            		rs = stmt.executeQuery("SELECT usernames FROM elections WHERE usertype ='1'");


        			while(rs.next()) { 
        				userName = rs.getString("usernames");
        				System.out.println("Please authorize voters, 1 for yes, and 0 for no:");
        				System.out.println(userName+":");
        				authorize = sc.next();
        				st2.executeUpdate("UPDATE elections SET "+elec+" = " + authorize + " WHERE usernames = '" + userName + "'");
        			} 
            	}
            }
            
        }catch (Exception e){
            System.out.println(e+"  Authentication failed");
        }
    }       //end main
}       //end class
