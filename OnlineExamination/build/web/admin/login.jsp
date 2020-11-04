
<!DOCTYPE html>
<html lang="en" class="body-full-height">

    <!-- Mirrored from themifycloud.com/demos/templates/joli/pages-login.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2017 07:39:19 GMT -->
    <head>        
        <!-- META SECTION -->
        <title>Joli Admin - Responsive Bootstrap Admin Template</title>            
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <!-- END META SECTION -->

        <!-- CSS INCLUDE -->        
        <link rel="stylesheet" type="text/css" id="theme" href="css/theme-default.css"/>
        <!-- EOF CSS INCLUDE -->                                    
    </head>
    <body>

        <div class="login-container">

            <div class="login-box animated fadeInDown">
                <div class=""></div>
<%
                    
                    String message = request.getParameter("msg");
                    System.out.println(message);
                    if(message==null){
                            
                    }
                    else if (message.equalsIgnoreCase("error")) {
%>

                <div class="alert alert-danger" role="alert">
                    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <strong>Oh snap!</strong> <%= message%>
                </div>
<%
                    }
else if(message.equalsIgnoreCase("ok")){
%>
    <div class="alert alert-success" role="alert">
                    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <strong>Oh snap!</strong> <%= message%>
                </div>
                    <script>setTimeout(function(){ window.location.href="home.jsp" }, 1000);</script>
<%
                    }
else {}
                %>

                <div class="login-body">
                    <div class="login-title"><strong>Welcome</strong>, Please login</div>
                    <form action="../AdminLogin" class="form-horizontal" method="post">
                        <div class="form-group">
                            <div class="col-md-12">
                                <input type="text" name="Useremail" class="form-control" placeholder="Useremail"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <input type="password" name="Password" class="form-control" placeholder="Password"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6">
                                <a href="#" class="btn btn-link btn-block">Forgot your password?</a>
                            </div>
                            <div class="col-md-6">
                                <button class="btn btn-info btn-block">Log In</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="login-footer">
                    <div class="pull-left">
                        &copy; 2014 AppName
                    </div>
                    <div class="pull-right">
                        <a href="#">About</a> |
                        <a href="#">Privacy</a> |
                        <a href="#">Contact Us</a>
                    </div>
                </div>
            </div>

        </div>

    </body>

    <!-- Mirrored from themifycloud.com/demos/templates/joli/pages-login.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2017 07:39:19 GMT -->
</html>






