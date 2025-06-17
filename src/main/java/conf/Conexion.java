/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package conf;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author jhoan
 */
public class Conexion {
    Connection conn;
    String url="jdbc:mysql://localhost:3306/store";
    String user="root";
    String pass="";
     
    
    public Connection conexion() throws ClassNotFoundException{
    try{
      Class.forName("com.mysql.cj.jdbc.Driver");
      conn=(Connection) DriverManager.getConnection(url, user, pass);
    
    
    }catch(SQLException e){
        
    }
    return conn;
    }
    
    
    
    
    
    
}
