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
import dbcon.DbCon;

public class AddExam extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String exam_id, exam_type,subject,total_que,mpq,exam_date,result_date,status;
        
        exam_type = request.getParameter("exam_type");
        subject = request.getParameter("subject");
        total_que = request.getParameter("total_que");
        mpq = request.getParameter("mpq");
        exam_date = request.getParameter("exam_date");
        result_date = request.getParameter("result_date");
        status = request.getParameter("status");
        out.println(exam_type+" "+subject+" "+total_que+" "+mpq+" "+exam_date+" "+result_date+" "+status);
        String set = "exam_type,subject,total_que,mpq,date,result_date,status";
        String setdata = "'"+exam_type+"','"+subject+"','"+total_que+"','"+mpq+"','"+exam_date+"','"+result_date+"','"+status+"'";
        DbDao d = new DbDao();
        if(d.insertRow("exams", set, setdata)){
            Alert.setIconMessage("Exam details are updated successfully.", "success","fa fa-check-circle");
            String sql="SELECT `exam_id` FROM `exams` ORDER BY `exam_id` DESC LIMIT 1";
            DbCon db = new DbCon();
            Connection con = db.getConnection();
            try{
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                exam_id = rs.getString(1);
                System.out.println("INSERT ID "+exam_id);
               response.sendRedirect("admin/viewexam.jsp?examid="+exam_id+"&&operation=show&&msg=ok"); 
            }
            else{
                System.out.println("Hello Dear");
            }
            }catch(SQLException | IOException ex){ out.println(ex);}
        }else{
            Alert.setIconMessage("Exam details are not Inserted. Please fill data correctly", "danger","fa fa-times-circle");
            response.sendRedirect("admin/viewexam.jsp?operation=add&&msg=error");
        }
        
    }
    public String getServletInfo() {
        return "This is a servlet for add a new exam data...";
    }// </editor-fold>

}
