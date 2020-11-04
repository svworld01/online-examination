<%@page import="java.sql.ResultSet"%>
<%@page import="services.DbDao"%>
<%@include file="inc/checkSession.jsp" %>
<%@include file="inc/head.jsp" %>
<%    String messagetype = request.getParameter("msg");
    String message = "";
    if (messagetype != null) {
        if (messagetype.equalsIgnoreCase("ok")) {
            message = "<div class='alert alert-success'>Login successfull.You are redirecting to your home page... <script>setTimeout(function(){ window.location.href='home.jsp' }, 3000);</script>";
        } else if (messagetype.equalsIgnoreCase("error")) {
            message = "<div class='alert alert-danger'>Your have entered wrong email or password..Try again</div>";
        } else {
            response.sendRedirect("page404.jsp");
        }
    } else {
        message = "";
    }
%>
<div class="content" style="background-color: #000">
    <div class="page-login rlp">
        <div class="container">
            <div class="login-wrapper rlp-wrapper">
                <div class="login-table rlp-table"><a href="index.html"></a>

                    <div class="login-title rlp-title">Question Paper</div>

                    <div class="login-form bg-w-form rlp-form">
                        <form action="ExamOver" method="post" name="examForm">
                            <div style="color: red;"> Time Remaining : <span id="m" style="color:red;"></span></div>
                                <%
                                    DbDao d = new DbDao();
                                    String e = (String)session.getAttribute("examid");
                                    if(e==null){
                                        response.sendRedirect("error.jsp");
                                    }
                                    ResultSet rs = d.selectAll("questions", "*", " WHERE exam_id = "+e );
                                    int i=1;
                                    while (rs.next()) {
                                %>
                            <div class="well">
                                <b>Q.<%= i %> : </b> <%= rs.getString(3)%>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <table style="height:95%;margin-left:5%;">
                                        <tr>
                                            <td style="width: 10%;  vertical-align: top;">A. </td>
                                            <td style="width: 90%;"><%= rs.getString(4)%></td>
                                            <td style="vertical-align: top;"><input type="radio" name="<%= "stu_answer"+i%>" value="A"/></td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: top;">B. </td>
                                            <td><%= rs.getString(5)%></td>
                                            <td style="vertical-align: top;"><input type="radio" name="<%= "stu_answer"+i%>" value="B"/></td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: top;">C. </td>
                                            <td><%= rs.getString(5)%></td>
                                            <td style="vertical-align: top;"><input type="radio" name="<%= "stu_answer"+i%>" value="C"/></td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: top;">D. </td>
                                            <td><%= rs.getString(6)%></td>
                                            <td style="vertical-align: top;"><input type="radio" name="<%= "stu_answer"+i%>" value="D"/></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <input type="hidden" name="<%="queid"+i%>" value="<%= rs.getString(1)%>">
                            <% i++;     
                                }
                            %>
                            <div class="login-submit">
                            <button type="submit"  class="btn btn-login btn-green"><span>Submit Paper</span></button>
                        </div>

                            <!--                        <div class="row">
                                                        <div class="login-submit"  style="text-align: right;">
                                                            <button type="button" class="btn btn-login btn-green"><span>Start Exam</span></button>
                                                        </div>
                               >                     </div>-->
                            <input type="hidden" value="<%= i-1%>" name="tqp"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- BUTTON BACK TO TOP-->
<script type="text/javascript">
    window.onload = function () {
        //window.setTimeout(document.examForm.submit(), 60*60*1000);
        var minute = 3;
        document.getElementById("m").innerHTML = minute;
        var interval = setInterval(function () {
            minute -= 1;
            document.getElementById("m").innerHTML = minute;
            if (minute == 0) {
                clearInterval(interval);
                document.examForm.submit();
            }

        }, 60000);
    };

</script>
<div id="back-top"><a href="#top"><i class="fa fa-angle-double-up"></i></a></div>
