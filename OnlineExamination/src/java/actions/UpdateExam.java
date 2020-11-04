package actions;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import services.Alert;
import services.DbDao;


public class UpdateExam extends HttpServlet {
    private DbDao d = new DbDao();
    private Alert alert = new Alert();
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        String exam_id, exam_type,subject,total_que,mpq,exam_date,result_date,status;
        
        exam_id = request.getParameter("exam_id");
        exam_type = request.getParameter("exam_type");
        subject = request.getParameter("subject");
        total_que = request.getParameter("total_que");
        mpq = request.getParameter("mpq");
        exam_date = request.getParameter("exam_date");
        result_date = request.getParameter("result_date");
        status = request.getParameter("status");
        //out.println(exam_id+" "+exam_type+" "+subject+" "+total_que+" "+mpq+" "+exam_date+" "+result_date+" "+status);
        String[] set = {"exam_type","subject","total_que","mpq","date","result_date","status"};
        String[] setdata = {exam_type,subject,total_que,mpq,exam_date,result_date,status};
        String condition = "WHERE `exam_id` = '"+exam_id+"'";
        
        
        if(d.updateRow("exams",set,setdata,condition)){
            Alert.setIconMessage("Exam details are updated successfully.", "success","fa fa-check-circle");
            response.sendRedirect("admin/viewexam.jsp?examid="+exam_id+"&&operation=show&&msg=ok");
        }else{
            Alert.setIconMessage("Exam details are not updated. Please fill data correctly", "warning","fa fa-times-circle");
            response.sendRedirect("admin/viewexam.jsp?examid=101&&operation=show&&msg=error");
        }
        
        
    }
    public String getServletInfo() {
        return "This is a servlet for add a new exam data...";
    }// </editor-fold>

}
