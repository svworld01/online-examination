<%@include file="inc/checkSession.jsp" %>
<%@include file="inc/head.jsp" %>
<%    
    String messagetype = request.getParameter("msg");
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

                    <div class="login-title rlp-title">Enter exam id to enter in exam</div>
                    <form action="StartExam" method="post">
                        <div class="login-form bg-w-form rlp-form">
                            <div class="row">
                                <div class="col-lg-12">
                                    <%=message%>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4" style="text-align: center;">
                                    <label for="regemail" class="control-label form-label">Exam ID <span class="highlight">*</span></label>
                                </div>
                                <div class="col-md-8">
                                    
                                    <input name="examid" id="regemail" type="text" placeholder="" class="form-control form-input"/><!--p.help-block Warning !-->
                                </div>
                                
                            </div>
                        </div>
                        <div class="login-submit">
                            <button type="submit"  class="btn btn-login btn-green"><span>Enter in Exam</span></button>
                        </div>
                    </form>
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