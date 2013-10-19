
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
            
        }catch (Exception e){
            System.out.println("Authentication failed");
        }
    }       //end main
}       //end class
