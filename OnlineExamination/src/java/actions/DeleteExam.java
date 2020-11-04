/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.Alert;
import services.DbDao;

/**
 *
 * @author Saurabh Kr. Verma
 */
public class DeleteExam extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String examid =  request.getParameter("examid");
        DbDao d = new DbDao();
        if(d.deleteRow("exams", " WHERE exam_id = '"+examid+"'")){
             Alert.setIconMessage("Exam details are deleted successfully.", "success","fa fa-check-circle");
             response.sendRedirect("admin/viewexam.jsp?examid="+examid+"&&operation=delete&&msg=ok");
        }
        else{
            Alert.setIconMessage("Exam details are not deleted due to some resons..", "danger","fa fa-times-circle");
            response.sendRedirect("admin/viewexam.jsp?examid="+examid+"&&operation=show&&msg=error");
        }
    }
}
