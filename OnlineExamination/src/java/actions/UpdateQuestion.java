
package actions;

import dbcon.DbCon;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.Alert;
import services.DbDao;

public class UpdateQuestion extends HttpServlet {
    private DbDao d = new DbDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String queation_id = request.getParameter("queid");
        String question  = request.getParameter("question");
        String op_a = request.getParameter("opa");
        String op_b = request.getParameter("opb");
        String op_c = request.getParameter("opc");
        String op_d = request.getParameter("opd");
        String answer = request.getParameter("answer");
        String[] set = {"question","op_a","op_b","op_c","op_d","answer"};
        String[] setdata = {question,op_a,op_b,op_c,op_d,answer};
        String condition  = " WHERE `question_id` = '"+queation_id+"'";
        if(d.updateRow("questions", set, setdata, condition)){
            Alert.setIconMessage("Question Updated Successfully", "success", "fa fa-check-circle");
            response.sendRedirect("admin/question.jsp?queid="+queation_id+"&&operation=show&&msg=ok");
        }
        else{
            Alert.setIconMessage("Question Not Updated.", "danger", "fa fa-times-circle");
            response.sendRedirect("admin/question.jsp?queid="+queation_id+"&&operation=show&&msg=error");
        }
    }

}
