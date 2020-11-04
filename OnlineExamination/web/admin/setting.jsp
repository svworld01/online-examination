<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="inc/head.jsp" %>
<%@include file="inc/sidebar.jsp" %>
<%@include file="inc/header.jsp" %>
<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>                    
    <li class="active">Dashboard</li>
</ul>
<!-- END BREADCRUMB --> 
<div class="page-content-wrap">
    <%@include file="inc/widgets.jsp" %>
    <div class="page-title">                    
        <h2><span class="fa fa-arrow-circle-o-left"></span> Change Password</h2>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <form class="form-group" action="" method="post">
                <table>
                    <tr>
                        <td>Current Password</td>
                        <td><input type="password" name="cp" ></td>
                    </tr>
                    <tr>
                        <td>New Password</td>
                        <td><input type="password" name="np" ></td>
                    </tr>
                    <tr>
                        <td>Confirm New Password</td>
                        <td><input type="password" name="cnp" ></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
