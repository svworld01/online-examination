package  actions;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import services.DateTime;
import services.DbDao;

public class StudentLogin extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        DbDao d = new DbDao();
        DateTime date = new DateTime();
        ResultSet rs = d.selectAll("students", "*", " WHERE `email` = '"+email+"' and `password` = '"+password+"'");
        try {
            if(rs.next()){
                session.setAttribute("stu_id", rs.getString(1));
                session.setAttribute("stu_email", rs.getString(4));
                session.setAttribute("stu_name", rs.getString(3));
                
                String set[] = {"last_login"};
                String setdata[] = {DateTime.getDateTime()};
                if(d.updateRow("students",set , setdata, " WHERE `email` = '"+email+"'")){
                    //response.sendRedirect("login.jsp?msg=ok");
                    String formstatus = rs.getString(7);
                    session.setAttribute("fs", formstatus);
                    if(formstatus.equalsIgnoreCase("Step2")){
                        response.sendRedirect("step2.jsp");
                    }
                    else if(formstatus.equalsIgnoreCase("Step3")){
                        response.sendRedirect("step3.jsp");
                    }
                    else if(formstatus.equalsIgnoreCase("Completed")){
                        response.sendRedirect("home.jsp");
                    }
                }
            }else{
                response.sendRedirect("login.jsp?msg=error");
            }
        } catch (SQLException ex) {
            System.out.println("Exception Occured : "+ex);
            response.sendRedirect("login.jsp?msg=error");
        }
        
    }
}