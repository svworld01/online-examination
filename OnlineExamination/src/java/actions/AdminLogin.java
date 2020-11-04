package actions;

import dbcon.DbCon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import services.Alert;

public class AdminLogin extends HttpServlet {
    private Connection con;
    private ResultSet rs;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session  = request.getSession();
        
        String email = request.getParameter("Useremail");
        String password = request.getParameter("Password");
        
        try{
            DbCon d = new DbCon();
            con = d.getConnection();
            String sql="SELECT * FROM `admin` WHERE email=? and password = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if(rs.next()){
                session = request.getSession();
                session.setAttribute("user_id", rs.getString(1));
                session.setAttribute("user_email", rs.getString(3));
                session.setAttribute("user_name", rs.getString(2));
                Alert.setMessage("Login Success. Redirecting to Dashboard..", "success", "home.jsp");
                response.sendRedirect("admin/index.jsp?msg=ok");
            }
            else{
                Alert.setMessage("You have entered wrong id or password.", "danger");
                response.sendRedirect("admin/index.jsp?msg=error");
            }
        }catch(Exception ex){
            System.out.println("Exception Occured : "+ex);
        }
    }
}
