/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbcon;


import java.sql.Connection;
import java.sql.DriverManager;

public class DbCon {
    
    //instance variables
    public static Connection con;
    private String dbname="axamination";
    
    //constructor...
    public DbCon(){
        con = getConnection();
        if(con!=null){
            System.out.println("Connection Established..!!");
        }
    }
    public DbCon(String db){
        setDbname(db);
        con = getConnection();
        if(con!=null){
            System.out.println("Connection Established..!!");
        }
    }
    
    
    //get connection method....
    public Connection getConnection(){
        Connection connnection=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbname+"","root","");
            
        }catch(Exception ex){
            System.out.println("Exception Occutred : "+ex);
        }
        return connnection;
    }
    public Connection getConnection(String dbname){
        Connection connnection=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbname+"","root","");
            
        }catch(Exception ex){
            System.out.println("Exception Occutred : "+ex);
        }
        return connnection;
    }
    //setter getters
    public String getDbname() {
        return dbname;
    }

    public void setDbname(String dbname) {
        this.dbname = dbname;
    }
    
    
}