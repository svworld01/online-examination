<%@page import="java.sql.ResultSet"%>
<%@page import="services.DbDao"%>
<%@include file="inc/checkSession.jsp" %>
<%@include file="inc/head.jsp" %>
<%@include file="inc/stu_header.jsp" %>
<div class="content">
    <div class="well" style="height: 60px;">
        <h2 style="margin: 0px; padding: 0px;">Find Result</h2>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3"></div>
            <div class="col-lg-6">
                <form action="results.jsp" method="post">
                    <table class="table table-condensed">
                        <tbody>
                            <tr>
                                <td>Enter Exam ID</td>
                                <td><input type="text" name="examid" class="form-control"></td>
                            </tr>
                            <tr>
                                <td  colspan="2"><input type="submit" class="form-control btn-primary" value="Submit" ></td>

                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="col-lg-3"></div>
        </div>
        <%            
            String examid = request.getParameter("examid");
            int result = 0;
            ResultSet rs = null;
            if (examid != null && examid != "") {
                DbDao d = new DbDao();
                ResultSet check = d.selectByQuery("select * from stu_answer where stu_id = '" + (String) session.getAttribute("stu_id") + "' and exam_id='" + examid + "'");
                if (check.next()) {

                    String sql = "SELECT DISTINCT stu_answer.que_id FROM stu_answer INNER JOIN questions ON stu_answer.exam_id = questions.exam_id and stu_answer.answer = questions.answer WHERE stu_answer.stu_id = '" + (String) session.getAttribute("stu_id") + "' and stu_answer.exam_id = '" + examid + "'";
                    rs = d.selectByQuery(sql);

                    while (rs.next()) {
                        result++;
                    }
                    ResultSet mpq = d.selectByQuery("SELECT mpq from exams WHERE exam_id = '" + examid + "'");
                    if (mpq.next()) {
                        result *= Integer.parseInt(mpq.getString(1));
                    }
        %>
        
        <div class="row">
            <div class="col-lg-3"></div>
            <div class="col-lg-6">

                <table class="table table-condensed">
                    <tbody>
                        <tr>
                            <td>Student ID</td>
                            <td><%= (String) session.getAttribute("stu_id")%></td>
                        </tr>
                        <tr>
                            <td>Exam ID</td>
                            <td><%=examid%></td>
                        </tr>
                        <tr>
                            <td>Marks Obtained</td>
                            <td><%=result%></td>
                        </tr>
                    </tbody>
                </table>

            </div>
            <div class="col-lg-3"></div>
        </div>
        <%
                }
else{
out.println("result not found..");
}
            } 
        %>
    </div>

</div>