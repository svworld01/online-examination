<%@page import="services.DbDao"%>
<%@page import="java.sql.ResultSet"%>
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
<div class="content">
    <div class="page-login rlp">
        <div class="container">
            <div class="login-wrapper rlp-wrapper">
                <div class="login-table rlp-table"><a href="index.html"></a>

                    <div class="login-title rlp-title">Instructions</div>

                    <div class="login-form bg-w-form rlp-form">
                        <div class="row">
                            <div class="col-lg-12">
                                <%
                                    String examid = (String)session.getAttribute("examid");
                                    DbDao d = new DbDao();
                                    ResultSet rs = d.selectAll("exams","*"," WHERE exam_id='"+examid+"'");
                                    rs.next();
                                %>
                                <ul>
                                    <li>You are going to give th exam on Exam ID <b><%=rs.getString(1)%></b> questions.</li>
                                    <li>The exam has <b><%=rs.getString(7)%></b> questions.</li>
                                    <li>You have total <b><%=Integer.parseInt(rs.getString(7))*1.50%> minutes</b> to do all questions.</li>
                                    <li>If you not submit question at time the exam will automatically Submitted.. </li>
                                    
                                </ul>
                            </div>
                            <div class="col-lg-12">
                                    <input type="checkbox" name="check" checked="true"/> I accept the <a href="#">Terms and Condition</a><br/><br/><br/>
                                </div>
                                    
                        </div>
                        <div class="row">
                            <div class="login-submit"  style="text-align: right;">
                                <button type="button" onclick="window.location.href='<%= "exampage.jsp?examid="+examid %>'" class="btn btn-login btn-green"><span>Start Exam</span></button>
                            </div>
                            <div class="col-lg-12">
                                        If You Not Wanna Give The Eaxm <button onClick="history.back();" type="button" class=" btn-link">GO BACK</button>
                                    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- BUTTON BACK TO TOP-->
<div id="back-top"><a href="#top"><i class="fa fa-angle-double-up"></i></a></div>
<%@include file="inc/footer.jsp" %>