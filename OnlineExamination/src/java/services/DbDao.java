package services;
import dbcon.DbCon;
import java.sql.*;
public class DbDao extends DbCon{
    DateTime date = new DateTime();
    PreparedStatement ps;
    ResultSet rs;
    
    public boolean insertRow(String tbname, String fields, String values){
        String sql =  "INSERT INTO "+tbname+" ("+fields+") VALUES ("+values+")";
        System.out.println("Your Insert Query : "+sql);
        try{
            ps = con.prepareStatement(sql);
            int i= ps.executeUpdate();
            if(i>0){
                return true;
            }
            else{
                return false;
            }
        }catch(Exception ex){
            System.out.println("Exception Occured : "+ex);
            return false;
        }
    }
    public boolean updateRow(String tbname, String[] set, String[] setdata, String condition){
        String sql =  "UPDATE `"+tbname+"` SET ";
        String data = "";
        int forset=1;
        for(int count=0; count<set.length; count++){
            data += "`"+set[count]+"`=?, ";
        }
        data = data.substring(0,data.lastIndexOf(","));
        System.out.println(set.length+" "+setdata.length+" "+condition);
        System.out.println(sql+" "+data+" "+condition);
        sql = sql+" "+data+" "+condition;
        System.out.println(sql);
        try{
            ps = con.prepareStatement(sql);
                for(int count=0; count<set.length; count++){
                    ps.setString(forset++, setdata[count]);
                }
                
            
            int i= ps.executeUpdate();
            
            if(i>0){
                return true;
            }
            else{
                return false;
            }
        }catch(Exception ex){
            System.out.println("Exception Occured : "+ex);
            return false;
        } 
    }
    public boolean deleteRow(String tbname, String condition){
        String sql =  "DELETE FROM `"+tbname+"` "+condition;
        try{
            ps = con.prepareStatement(sql);
            int i= ps.executeUpdate();
            if(i>0){
                return true;
            }
            else{
                return false;
            }
        }catch(Exception ex){
            System.out.println("Exception Occured : "+ex);
            return false;
        }
    }
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
    public boolean isExist(String tbname,String condition){
        
        String sql = "SELECT * FROM `"+tbname+"` "+condition;
        try{
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        if(rs.next()){
            return true;
        }
        else{
            return false;
        }
        }catch(Exception ex){
            System.out.println("Exception Occurred in isExist() : "+ex);
            return false;
        }
        
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
    public ResultSet selectByQuery(String sql){
        try{
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        }catch(Exception ex){
            System.out.println("Exception Occurred in selectAll() : "+ex);
        }
        return rs;
    }
    public String getRegId(String tbname, String primaryColumn){
        String id = "";
        String sql="SELECT `"+primaryColumn+"` FROM `"+tbname+"` ORDER BY `"+primaryColumn+"` DESC LIMIT 1";
        try{
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if(rs.next()){
                id = DateTime.getDate()+(rs.getInt(1)+1);
                System.out.println();
            }
        }catch(Exception ex){System.out.println(ex);}
        return id;
    }
}

