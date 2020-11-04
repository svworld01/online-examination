<body>
        <!-- START PAGE CONTAINER -->
        <div class="page-container">
            
            <!-- START PAGE SIDEBAR -->
            <div class="page-sidebar">
                <!-- START X-NAVIGATION -->
                <ul class="x-navigation">
                    <li class="xn-logo">
                        <a href="home.jsp">Admin Panel</a>
                        <a href="#" class="x-navigation-control"></a>
                    </li>
                    <li class="xn-profile">
                        <a href="#" class="profile-mini">
                            <img src="assets/images/users/avatar.jpg" alt="John Doe"/>
                        </a>
                        <div class="profile">
                            <div class="profile-image">
                                <img src="assets/images/users/avatar.jpg" alt="John Doe"/>
                            </div>
                            <div class="profile-data">
                                <div class="profile-data-name"><%= (String)session.getAttribute("user_name")  %></div>
                                <div class="profile-data-title">Web Developer/Designer</div>
                            </div>
                            <div class="profile-controls">
                                <a href="pages-profile.jsp" class="profile-control-left"><span class="fa fa-info"></span></a>
                                <a href="pages-messages.jsp" class="profile-control-right"><span class="fa fa-envelope"></span></a>
                            </div>
                        </div>                                                                        
                    </li>
                   
                    <li class="active">
                        <a href="home.jsp"><span class="fa fa-desktop"></span> <span class="xn-text">Dashboard</span></a>                        
                    </li>                    
                    <li class="xn-openable">
                        <a href="home.jsp"><span class="fa fa-files-o"></span> <span class="xn-text">Exams</span></a>
                        <ul>
                            <li><a href="viewexam.jsp?operation=add"><span class="fa fa-user"></span> Add New Exam</a></li>
                            <li><a href="viewexam.jsp?operation=list"><span class="fa fa-image"></span>Exams List</a></li>
                        </ul>
                    </li>
                    
                    <li class="xn-openable">
                        <a href="#"><span class="fa fa-users"></span> <span class="xn-text">Students</span></a>
                        <ul>
                            <li><a href="#"><span class="fa fa-image"></span> New Registration</a></li>
                            <li><a href="#"><span class="fa fa-user"></span> Add New Student</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><span class="fa fa-file"></span> <span class="xn-text">Result</span></a>
                        
                    </li>
                    <li class="xn-openable">
                        <a href="#"><span class="fa fa-star"></span> <span class="xn-text">Settings</span></a>
                        <ul>
                            <li><a href="setting.jsp"><span class="fa fa-image"></span>Change Password</a></li>
                            
                        </ul>
                    </li>
                   
                    
                </ul>
                <!-- END X-NAVIGATION -->
            </div>
            <!-- END PAGE SIDEBAR -->
            