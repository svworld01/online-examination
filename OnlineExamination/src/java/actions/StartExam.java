package actions;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import services.DbDao;

public class StartExam extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        
        HttpSession session = request.getSession();
        String examid = request.getParameter("examid");
        DbDao d = new DbDao();
        ResultSet rs = d.selectAll("stu_answer", examid, "WHERE stu_id = '" + (String) session.getAttribute("stu_id") + "'");
        try {
            if (rs.next()) {
                response.sendRedirect("invalidexam.jsp");
            } else {
                session.setAttribute("examid", examid);
                response.sendRedirect("setexam.jsp?examid="+ examid);
            }
        } catch (SQLException ex) {
            System.out.println("Exception Occured : " + ex);
        }

    }
}
