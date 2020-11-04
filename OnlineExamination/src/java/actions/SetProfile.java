package  actions;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import services.DbDao;

public class SetProfile extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
        //response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        
        DbDao data = new DbDao();
        String fields = "`stu_id`, `fname`, `mname`, `dob`, `gender`, `category`, `religion`, `nationality`, `address`, `pin`, `mob_number`";
        String values = "'"+(String)session.getAttribute("stu_id")+"','"+request.getParameter("fname")+"','"+request.getParameter("mname")+"','"+request.getParameter("dob")+"','"+request.getParameter("gender")+"','"+request.getParameter("category")+"','"+request.getParameter("religion")+"','"+request.getParameter("nationality")+"','"+request.getParameter("address")+"','"+request.getParameter("pin")+"','"+request.getParameter("mob_number")+"'";
        if(data.insertRow("stu_profile", fields, values)){
            //String sql = "UPDATE `students` SET `form_status`=? WHERE `stu_id` = ?";
            String[] set  = {"form_status"};
            String[] setdata  = {"Step3"};
            String condition = " WHERE stu_id = '"+(String)session.getAttribute("stu_id")+"'";
            if(data.updateRow("students", set, setdata, condition)){
                session.setAttribute("fs", "Step3");
                response.sendRedirect("step3.jsp");
            }
            else{
                System.out.println("form status is not updated..");
            }
            
        }else{
            response.sendRedirect("step2.jsp?msg=error");
        }
        
        //System.out.println(values+"\n"+fields);
        
    }
}