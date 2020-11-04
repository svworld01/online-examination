
<%@page import="java.sql.ResultSet"%>
<%@page import="services.SelectData"%>
<%@include file="inc/head.jsp" %>
<%@include file="inc/sidebar.jsp" %>
<%@include file="inc/header.jsp" %>
<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>                    
    <li class="active">Dashboard</li>
</ul>
<!-- END BREADCRUMB -->                       
<%
    ResultSet rs = null;
    SelectData data;
    try {
         data =  new SelectData();
        rs = data.selectAll("exams");
    } catch (Exception ex) {
        System.out.println(ex);
    }

%>
<!-- PAGE CONTENT WRAPPER -->
<div class="page-content-wrap">
    <%@include file="inc/widgets.jsp" %>
    <div class="page-title">                    
        <h2><span class="fa fa-arrow-circle-o-left"></span> Exams</h2>
    </div>


    <div class="row">
        <div class="col-md-12">
            <!-- START DEFAULT DATATABLE -->
            <div class="panel panel-default">
                
                <div class="panel-heading ui-draggable-handle">                                
                    <h3 class="panel-title">Default</h3>
                    
                    <ul class="panel-controls">
                        <li><a href="#" class="panel-collapse"><span class="fa fa-angle-down"></span></a></li>
                        <li><a href="#" class="panel-refresh"><span class="fa fa-refresh"></span></a></li>
                        <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
                    </ul>                                
                </div>
                <div class="panel-body">
                    <table class="table datatable">
                        <thead>
                            <tr>
                                <th>Exam ID</th>
                                <th>Exam Type</th>
                                <th>Subject</th>
                                <th>Date</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% while (rs.next()) {%>
                            <tr>
                                <td><%= rs.getString(1)%></td>
                                <td><%= rs.getString(2)%></td>
                                <td><%= rs.getString(3)%></td>
                                <td><%= rs.getString(4)%></td>
                                <td><%= rs.getString(8)%></td>
                                <td style="text-align: center;"><a href="<%="viewexam.jsp?examid=" + rs.getString(1) + "&&operation=show"%>"><span class="fa fa-2x fa-eye"></span></a></td>

                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- END SIMPLE DATATABLE -->

        </div>
    </div>                                

</div>
<!-- END PAGE CONTENT WRAPPER --> 

</div>            
<!-- END PAGE CONTENT -->
</div>
<!-- END PAGE CONTAINER -->
<%@include file="inc/footer.jsp" %>