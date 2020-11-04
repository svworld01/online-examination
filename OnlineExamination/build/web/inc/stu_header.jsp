<body><!-- HEADER-->
    <header>
        <div class="header-topbar">
            <div class="container">
                <div class="topbar-left pull-left">
                    <div class="email"><a href="#"><i class="topbar-icon fa fa-envelope-o"></i><span>Hello <%=(String) session.getAttribute("stu_name")%></span></a></div>
                    <div class="hotline"><a href="#"><i class="topbar-icon fa fa-phone"></i><span>+84 909 015 345</span></a></div>
                </div>
                <div class="topbar-right pull-right">
                    <div class="socials"><a href="#" class="facebook"><i class="fa fa-facebook"></i></a><a href="#" class="google"><i class="fa fa-google-plus"></i></a><a href="#" class="twitter"><i class="fa fa-twitter"></i></a><a href="#" class="pinterest"><i class="fa fa-pinterest"></i></a><a href="#" class="blog"><i class="fa fa-rss"></i></a><a href="#" class="dribbble"><i class="fa fa-dribbble"></i></a></div>
                    <div class="group-sign-in"><a href="profile.jsp" class="login">Profile</a><a href="logout.jsp" class="register">Logout</a></div>
                </div>
            </div>
        </div>
        <div class="header-main homepage-01">
            <div class="container">
                <div class="header-main-wrapper">
                    <div class="navbar-heade">
                        <div class="logo pull-left"><a href="index.jsp" class="header-logo"><img src="assets/images/logo-color-1.png" alt=""/></a></div>
                        <button type="button" data-toggle="collapse" data-target=".navigation" class="navbar-toggle edugate-navbar"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                    </div>
                    <nav class="navigation collapse navbar-collapse pull-right">
                        <ul class="nav-links nav navbar-nav">
                            <li><a href="home.jsp" class="main-menu">My Home</a></li>
                            <li ><a href="exams.jsp" class="main-menu">Exams</a></li>
                            <li ><a href="results.jsp" class="main-menu">Results</a></li>
                            <li ><a href="about.jsp" class="main-menu">About</a></li>
                            <li ><a href="contacts.jsp" class="main-menu">Contact</a></li>
                            <li class="dropdown"><a href="javascript:void(0)" class="main-menu">Setting<span class="fa fa-angle-down icons-dropdown"></span></a>
                                <ul class="dropdown-menu edugate-dropdown-menu-1">
                                    <li><a href="categories.jsp" class="link-page">Change Password</a></li>
                                    <li><a href="profile-teacher.jsp" class="link-page">Logout</a></li>
                                </ul>
                            </li>
                            
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- WRAPPER-->
    <div id="wrapper-content"><!-- PAGE WRAPPER-->
        <div id="page-wrapper"><!-- MAIN CONTENT-->
            <div class="main-content"><!-- CONTENT-->
