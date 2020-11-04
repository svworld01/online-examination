<%@page import="java.sql.ResultSet"%>
<%@page import="services.DbDao"%>
<%@include file="inc/checkSession.jsp" %>
<%@include file="inc/head.jsp" %>
<%@include  file="inc/stu_header.jsp" %>
<div class="content">
    <div class="well" style="height: 60px;">
        <h2 style="margin: 0px; padding: 0px;">All Exams List</h2>
    </div>
    <div class="container">
        <table class="table table-actions">
            <thead>
                <tr>
                    <th>Exam ID</th>
                    <th>Exam Type</th>
                    <th>Subject</th>
                    <th>Total Question</th>
                    <th>MPQ</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                DbDao d = new DbDao();
                ResultSet rs = d.selectAll("exams");
                while(rs.next()){
                %>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(7)%></td>
                    <td>
                        <form action="StartExam" method="post">
                            <input type="hidden" value="<%=rs.getString(1)%>" name="examid" />
                            <button type="submit" class="btn-primary">
                            <span class="fa fa-1x fa-pencil"></span>Start
                            </button>
                        </form>
                    </td>
                </tr>
                <%
                 }
                
                %>
            </tbody>
        </table>
    </div>
        
</div>