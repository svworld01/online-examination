<%@page import="java.sql.ResultSet"%>
<%@page import="services.DbDao"%>
<%@include file="inc/head.jsp" %>
<%@include file="inc/stu_header.jsp" %>
<%
    String stuid = (String) session.getAttribute("stu_id");
    DbDao d = new DbDao();
    ResultSet rs = d.selectAll("stu_profile", "*", " WHERE stu_id = '" + stuid + "'");
    if (rs.next()) {
%>
<div class="content">
    <div class="well" style="height: 60px;">
        <h2 style="margin: 0px; padding: 0px;">Student Profile</h2>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-2">

            </div>
            <div class="col-lg-8">
                <table class="table table-condensed">
                    <thead>
                        <tr>
                            <th colspan="4">GENERAL INFORMATION</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="width: 35%;">Student ID</td>
                            <td style="width: 40%;"><%=rs.getString(2)%></td>
                            <td rowspan="4">
                                <img src="<%="Uploaded/"+rs.getString(13)%>" class="image img-responsive" style="height: 120px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Name</td>
                            <td><%=rs.getString(3)%></td>

                        </tr>
                        <tr>
                            <td>Date of Birth</td>
                            <td><%=rs.getString(5)%></td>

                        </tr>
                        <tr>
                            <td>Gender</td>
                            <td><%=rs.getString(6)%></td>

                        </tr>
                    </tbody>
                </table>
                <table class="table table-condensed">
                    <thead>
                        <tr>
                            <th colspan="2">CONTACT INFORMATION</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="width: 35%;">Mobile Number</td>
                            <td><%=rs.getString(12)%></td>
                        </tr>
                        <tr>
                            <td>E-mail</td>
                            <td><%=(String)session.getAttribute("stu_email")%></td>

                        </tr>
                        <tr>
                            <td>Postal Address</td>
                            <td><%=rs.getString(10)%></td>

                        </tr>
                        <tr>
                            <td>PIN</td>
                            <td><%=rs.getString(11)%></td>

                        </tr>
                    </tbody>
                </table>
                <table class="table table-condensed">
                    <thead>
                        <tr>
                            <th colspan="2">PERSONAL INFORMATION</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="width: 35%;">Father's Name</td>
                            <td><%=rs.getString(3)%></td>
                        </tr>
                        <tr>
                            <td>Mother's Name</td>
                            <td><%=rs.getString(4)%></td>

                        </tr>
                        <tr>
                            <td>Nationality</td>
                            <td><%=rs.getString(9)%></td>

                        </tr>
                        <tr>
                            <td>Religion</td>
                            <td><%=rs.getString(8)%></td>

                        </tr>
                        <tr>
                            <td>Category</td>
                            <td><%=rs.getString(7)%></td>

                        </tr>
                    </tbody>
                </table>
                
                            
                            
                            

            </div>
            <div class="col-lg-2">

            </div>
        </div>
    </div>
</div>
<%
    } else {
        out.println("<h1>User Data is not found...</h1>");
    }
%>