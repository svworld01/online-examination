
package actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.Alert;
import services.DbDao;

public class AddQuestion extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String question  =  request.getParameter("question");
        String opa = request.getParameter("opa");
        String opb = request.getParameter("opb");
        String opc = request.getParameter("opc");
        String opd = request.getParameter("opc");
        String examid = request.getParameter("examid");
        String answer = request.getParameter("answer");
        String queID = "";
        DbDao d = new DbDao();
        if(d.insertRow("questions", "`exam_id`, `question`, `op_a`, `op_b`, `op_c`, `op_d`, `answer`", "'"+examid+"','"+question+"','"+opa+"','"+opb+"','"+opc+"','"+opd+"','"+answer+"'")){
            Alert.setIconMessage("Question Added Successfully.", "success","fa fa-check-circle");
            ResultSet rs = d.selectByQuery("SELECT `question_id` FROM `questions` ORDER BY `question_id` DESC LIMIT 1");
            try {
                if(rs.next()){
                    queID  = rs.getString(1);
                    System.out.println("INSERT ID "+queID);
               response.sendRedirect("admin/question.jsp?queid="+queID+"&&operation=show&&msg=ok"); 
                }
            } catch (SQLException ex) {
                System.out.println("Exception Occured : "+ex);
            }
        }else{
            
        }
        
    }

}
