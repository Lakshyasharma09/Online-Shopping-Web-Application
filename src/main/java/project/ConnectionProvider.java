package project;
import java.sql.*;

public class ConnectionProvider {
    public static Connection getCon() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/ospjsp", "root", "Harsh123@"
            );
           // System.out.println("connected to databases");
            
        } catch (Exception e) {
           // System.out.println("❌ Failed to connect to DB:");
            e.printStackTrace();  // This will print the real error reason
        }
        return con;
    }
}