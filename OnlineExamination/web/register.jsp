
<%@include file="inc/head.jsp" %>
<header><!-- not include--></header>
<%
    String messagetype = request.getParameter("msg");
    String message = "";
    if(messagetype!=null){
        if(messagetype.equalsIgnoreCase("ok")){
            message = "<div class='alert alert-success'>Registration successfull. <a href='login.jsp'>go back to login page</a></div>";
        }
        
        else if(messagetype.equalsIgnoreCase("ep")){
            message = "<div class='alert alert-danger'>The email you entrered is already registered.</div>";
        }
        else if(messagetype.equalsIgnoreCase("pp")){
            message = "<div class='alert alert-danger'>Password and confirm is not matched..</div>";
        }else{
            response.sendRedirect("page404.jsp");
        }
    }
    else{
        message = "";
    }
%>

            <div class="content">
                <div class="page-register rlp">
                    <div class="container">
                        <div class="register-wrapper rlp-wrapper">
                            <div class="register-table rlp-table"><a href="index.html"><img src="assets/images/logo-color-1.png" alt="" class="login"/></a>

                                <div class="register-title rlp-title">create your account and join with us!</div>
                                <form action="RegisterStudent" method="post">
                                <div class="register-form bg-w-form rlp-form">
                                    <div class="row">
                                        <div class="col-lg-12">
                                         <%=message%>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label for="regname" class="control-label form-label">Name <span class="highlight">*</span></label>
                                            <input name="name" id="regname" type="text" placeholder="" class="form-control form-input" required="true"/><!--p.help-block Warning !-->
                                        </div>
                                        <div class="col-md-6">
                                            <label for="regemail" class="control-label form-label">Email <span class="highlight">*</span></label>
                                            <input name="email" id="regemail" type="email" placeholder="" class="form-control form-input" required="true"/><!-- p.help-block Warning !-->
                                        </div>
                                        <div class="col-md-6">
                                            <label for="regpassword" class="control-label form-label">Password <span class="highlight">*</span></label>
                                            <input name="password" id="regpassword" type="password" placeholder="" class="form-control form-input" required="true"/><!-- p.help-block Warning !-->
                                        </div>
                                        <div class="col-md-6">
                                            <label for="reregpassword" class="control-label form-label">Confirm Password <span class="highlight">*</span></label>
                                            <input name="cpassword"id="reregpassword" type="password" placeholder="" class="form-control form-input" required="true"/><!-- p.help-block Warning !-->
                                        </div>
                                    </div>
                                </div>
                                <div class="register-submit">
                                    <button type="submit" class="btn btn-register btn-green"><span>create account</span></button>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       
<%@include file="inc/footer.jsp" %>