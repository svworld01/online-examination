package  actions;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import services.DateTime;
import services.DbDao;

public class RegisterStudent extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        DbDao d = new DbDao();
        out.println(d.getRegId("admin", "id"));
        String reg_id = d.getRegId("students", "stu_id"), name = request.getParameter("name"), email  = request.getParameter("email"), password = request.getParameter("password"), cpassword = request.getParameter("cpassword");
        String msg="";
        System.out.println(password+"  "+cpassword);
        if((d.isExist("students", " WHERE email='"+email+"'"))){
            msg = "ep";
        }
        else if(!password.equals(cpassword)){
           msg="pp";
        }
        else{
            if(d.insertRow("students", "`reg_id`,`name`,`email`,`password`", "'"+reg_id+"','"+name+"','"+email+"','"+password+"'")){
                msg="ok";
            }
            else{
                System.out.println("there is a exceptional problem ");
            }
        }
        
        response.sendRedirect("register.jsp?msg="+msg+"");
    }
}