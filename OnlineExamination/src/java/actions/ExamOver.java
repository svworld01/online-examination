package  actions;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import services.DbDao;

public class ExamOver extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
        HttpSession session = request.getSession();
        //get parameters
        String examid = (String)session.getAttribute("examid");
        String userid = (String)session.getAttribute("stu_id");
        int tq  = Integer.parseInt(request.getParameter("tqp"));
        DbDao d = new DbDao();
        
        System.out.println(tq+"  "+request.getParameter("stu_answer"+1));
        for(int i =1; i<=tq; i++){
            if(request.getParameter("stu_answer"+i)!=null)
            {
                if(d.insertRow("`stu_answer`", "`stu_id`, `exam_id`, `que_id`, `answer`", "'"+userid+"','"+examid+"','"+request.getParameter("queid"+i)+"','"+request.getParameter("stu_answer"+i)+"'")){
                    
                    System.out.println("Added");
                    session.setAttribute("examid", "");
                    
                }
                else{
                    System.out.println("Not Added");
                }
            }
            
            
        }
        response.sendRedirect("examover.jsp");
        
        
    }
}