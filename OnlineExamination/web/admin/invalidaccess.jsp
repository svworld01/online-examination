<%@include file="inc/head.jsp" %>
<%@include file="inc/sidebar.jsp" %>
<%@include file="inc/header.jsp" %>
<!-- START BREADCRUMB -->
                <ul class="breadcrumb push-down-0">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Pages</a></li>
                    <li class="active">Error 404</li>
                </ul>
                <!-- END BREADCRUMB -->  
                                <!-- PAGE CONTENT WRAPPER -->
                <div class="page-content-wrap">
                
                    <div class="row">
                        <div class="col-md-12">

                            <div class="error-container">
                                <div class="error-code">404</div>
                                <div class="error-text">page not found</div>
                                <div class="error-subtext">Unfortunately we're having trouble loading the page you are looking for. Please wait a moment and try again or use action below.</div>
                                <div class="error-actions">                                
                                    <div class="row">
                                        <div class="col-md-6">
                                            <button class="btn btn-info btn-block btn-lg" onClick="document.location.href = 'home.jsp';">Back to dashboard</button>
                                        </div>
                                        <div class="col-md-6">
                                            <button class="btn btn-primary btn-block btn-lg" onClick="history.back();">Previous page</button>
                                        </div>
                                    </div>                                
                                </div>
                                <div class="error-subtext">Or you can use search to find anything you need.</div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="input-group">
                                            <input type="text" placeholder="Search..." class="form-control"/>
                                            <div class="input-group-btn">
                                                <button class="btn btn-primary"><span class="fa fa-search"></span></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    
                                                                        
                </div>                
                <!-- END PAGE CONTENT WRAPPER -->
                <%@include file="inc/footer.jsp" %>