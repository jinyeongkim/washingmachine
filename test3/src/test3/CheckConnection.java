package test3;

import java.sql.*;


public class CheckConnection {

   private Connection connection;
    
   public CheckConnection(String dbURL, String user, String pwd) throws ClassNotFoundException, SQLException{
       Class.forName("com.mysql.jdbc.Driver");
       this.connection = DriverManager.getConnection(dbURL, user, pwd);
   }
    
   public Connection getConnection(){
       return this.connection;
   }
}