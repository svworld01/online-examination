
package services;

import java.sql.*;
import dbcon.*;

public class SelectData extends DbCon{
    private String tbname;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public ResultSet selectAll(String tbname){
        
        String sql = "SELECT * FROM "+tbname+"";
        try{
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        return rs;
        
        }catch(Exception ex){
            System.out.println("Exception Occurred in selectAll() : "+ex);
        }
        return rs;
    }
    public ResultSet selectAll(String tbname,String fields, String condition){
        String sql = "SELECT "+fields+" FROM `"+tbname+"` "+condition;
        System.out.println("Your Query : "+sql);
        try{
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        return rs;
        
        }catch(Exception ex){
            System.out.println("Exception Occurred in selectAll() : "+ex);
        }
        return rs;
    }
    public String getTbname() {
        return tbname;
    }

    public void setTbname(String tbname) {
        this.tbname = tbname;
    }
    
}
