
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

    String examid = request.getParameter("examid");
    String operation = request.getParameter("operation");
    String message = request.getParameter("msg");
    System.out.println(examid + " and " + operation);
    if (operation != null && !(operation.equalsIgnoreCase("show") || operation.equalsIgnoreCase("edit") || operation.equalsIgnoreCase("add") || operation.equalsIgnoreCase("list") || operation.equalsIgnoreCase("delete"))) {
        response.sendRedirect("invalidaccess.jsp");
    } else if (examid != null && operation.equalsIgnoreCase("show")) {
        try {
            data = new SelectData();
            rs = data.selectAll("exams", "*", "WHERE exam_id = " + examid);
            if (rs.next()) {
%>
<div class="page-content-wrap">

    <div class="page-title">                    
        <h2><span class="fa fa-arrow-circle-o-left"></span> Exam Details </h2>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <%
                
                System.out.println(message);
                if (message == null) {

                } else if (message.equalsIgnoreCase("error") || message.equalsIgnoreCase("ok")) {
                    if (Alert.getMessage() != null) {
                        out.println(Alert.getMessage());
                    }
                } else {
                }
            %>
        </div>
    </div>
    <div class="row" style="text-align: center">
        <div class="col-lg-10">
            <table class="table table-bordered">
                <tbody>
                    <tr>
                        <td>Exam ID </td>
                        <td><%= rs.getString(1)%></td>
                    </tr>
                    <tr>
                        <td>Exam Type </td>
                        <td><%= rs.getString(2)%></td>
                    </tr>
                    <tr>
                        <td>Subject</td>
                        <td><%= rs.getString(3)%></td>
                    </tr>
                    <tr>
                        <td>Total Questions</td>
                        <td><%= rs.getString(5)%></td>
                    </tr>
                    <tr>
                        <td>MPQ</td>
                        <td><%= rs.getString(7)%></td>
                    </tr>
                    <tr>
                        <td>Exam Date</td>
                        <td><%= rs.getString(4)%></td>
                    </tr>
                    <tr>
                        <td>Result Date</td>
                        <td><%= rs.getString(6)%></td>
                    </tr>
                    <tr>
                        <td>Registered Students</td>
                        <td>n/a</td>
                    </tr>
                    <tr>
                        <td>Attend </td>
                        <td>n/a</td>
                    </tr>
                    <tr>
                        <td>Exam Status</td>
                        <td><%= rs.getString(8)%></td>
                    </tr>
                    
                </tbody>

            </table>

        </div>
        <div class="col-lg-2" style="text-align: left; width: 15%;">
            <a href="<%="viewexam.jsp?examid=" + rs.getString(1) + "&&operation=edit"%>" class="btn btn-lg btn-primary btn-group-justified">
                <span class="fa fa-edit"></span>Edit</a>
            <br/>
            
            <a href="<%="question.jsp?examid=" + rs.getString(1) + "&&operation=list"%>" class="btn btn-lg btn-info btn-group-justified">
                <span class="fa fa-folder-o"></span>Questions</a>
            <br/>
            <a href="#" class="btn btn-lg btn-default btn-group-justified">
                <span class="fa fa-users"></span>Students</a><br/>
                <form action="../DeleteExam" method="post">
                    <input type="hidden" value="<%= rs.getString(1)%>" name="examid"/>
                <button onclick="confirm('Are you sure to delete ?')" href="<%="../DeleteExam?examid="+rs.getString(1)%>" class="btn btn-lg btn-danger btn-group-justified">
                <span class="glyphicon glyphicon-floppy-remove"></span>Delete</button>
                </form>
            <br/>
            <a href="<%="viewexam.jsp?&&operation=list"%>" class="btn btn-lg btn-success btn-group-justified">
                <span class="fa fa-users"></span>Back To List</a>
        </div>
    </div>

    <%
            } else {
                response.sendRedirect("invalidaccess.jsp");
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
    %>
</div>
<%
} else if (examid != null && operation.equalsIgnoreCase("edit")) {
    try {
        data = new SelectData();
        rs = data.selectAll("exams", "*", "WHERE exam_id = " + examid);
        if (rs.next()) {
%>
<div class="page-content-wrap">

    <div class="page-title">                    
        <h2><span class="fa fa-arrow-circle-o-left"></span> Exam Details </h2>
    </div>

    <form class="form-group" action="../UpdateExam" method="post">
        <div class="row" style="text-align: center">
            <div class="col-lg-10">

                <table class="table table-condensed">
                    <tbody>
                        <tr>
                            <td>Exam ID </td>
                            <td><input type="text" name="exam_id" value="<%= rs.getString(1)%>" class="form-control" required="required" readonly="readonly"/></td>
                        </tr>
                        <tr>
                            <td>Exam Type </td>
                            <td><input type="text" name="exam_type" value="<%= rs.getString(2)%>"  required="required"  class="form-control"  /></td>
                        </tr>
                        <tr>
                            <td>Subject</td>
                            <td><input type="text" name="subject" value="<%= rs.getString(3)%>"  required="required"  class="form-control"/></td>
                        </tr>
                        <tr>
                            <td>Total Questions</td>
                            <td><input type="text" name="total_que" value="<%= rs.getString(5)%>"  required="required"  class="form-control"/></td>
                        </tr>
                        <tr>
                            <td>MPQ</td>
                            <td><input type="text" name="mpq" value="<%= rs.getString(7)%>"  required="required"  class="form-control"/></td>
                        </tr>
                        <tr>
                            <td>Exam Date</td>
                            <td><input type="text" name="exam_date" value="<%= rs.getString(4)%>"  required="required"  class="form-control"/></td>
                        </tr>
                        <tr>
                            <td>Result Date</td>
                            <td><input type="text" name="result_date" value="<%= rs.getString(6)%>"  required="required"  class="form-control"/></td>
                        </tr>
                        <tr>
                            <td>Exam Status</td>
                            <td><input type="text" name="status" value="<%= rs.getString(8)%>"  required="required"  class="form-control"/></td>
                        </tr>
                    </tbody>

                </table>


            </div>
            <div class="col-lg-2" style="text-align: left;">
                <button type="submit" class="btn btn-lg btn-success"><span class="fa fa-save"></span>Update</button>
            </div>
        </div>
    </form>
</div>
                            
<%
        } else {

        }
    } catch (Exception ex) {
        System.out.println(ex);
    }
} else if (operation.equalsIgnoreCase("add")) {

    
%>
<div class="page-content-wrap">

    <div class="page-title">                    
        <h2><span class="fa fa-arrow-circle-o-left"></span>Add New Exam</h2>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <%
         if (message == null) {

                } else if (message.equalsIgnoreCase("error") || message.equalsIgnoreCase("ok")) {
                    if (Alert.getMessage() != null) {
                        out.println(Alert.getMessage());

                    }
                } else {
                }
    %>
        </div>
    </div>
    
    <form class="form-group" action="../AddExam" method="post">
        <div class="row" style="text-align: center">
            <div class="col-lg-10">

                <table class="table table-condensed">
                    <tbody>
                        <tr>
                            <td>Exam Type </td>
                            <td><input type="text" name="exam_type"   required="required"  class="form-control"  /></td>
                        </tr>
                        <tr>
                            <td>Subject</td>
                            <td><input type="text" name="subject"  required="required"  class="form-control"/></td>
                        </tr>
                        <tr>
                            <td>Total Questions</td>
                            <td><input type="text" name="total_que"  required="required"  class="form-control"/></td>
                        </tr>
                        <tr>
                            <td>MPQ</td>
                            <td><input type="text" name="mpq"  required="required"  class="form-control"/></td>
                        </tr>
                        <tr>
                            <td>Exam Date</td>
                            <td><input type="text" name="exam_date"  required="required"  class="form-control"/></td>
                        </tr>
                        <tr>
                            <td>Result Date</td>
                            <td><input type="text" name="result_date"  required="required"  class="form-control"/></td>
                        </tr>
                        <tr>
                            <td>Exam Status</td>
                            <td><input type="text" name="status"   required="required"  class="form-control"/></td>
                        </tr>
                    </tbody>

                </table>


            </div>
            <div class="col-lg-2" style="text-align: left;">
                <button type="submit" class="btn btn-lg btn-success"><span class="fa fa-plus-circle"></span>Add</button>
            </div>
        </div>
    </form>
    
</div>
<%
} else if (operation.equalsIgnoreCase("list")) {

    rs = null;
    data = null;
    try {
        data = new SelectData();
        rs = data.selectAll("exams");
    } catch (Exception ex) {
        System.out.println(ex);
    }

%>
<!-- PAGE CONTENT WRAPPER -->
<div class="page-content-wrap">
    <div class="page-title">                    
        <h2><span class="fa fa-arrow-circle-o-left"></span> Exams List</h2>
    </div>
    <div class="row">
        <div class="col-md-12">
            <!-- START DEFAULT DATATABLE -->
            <div class="panel panel-default">

                <div class="panel-heading ui-draggable-handle">                                
                    <h3 class="panel-title">Here is all exams list-</h3>

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
<!-- END PAGE CONTENT WRAPPER --> 

<%
    } else if(examid!=null && operation.equalsIgnoreCase("delete")){

    
                System.out.println(message);
                if (message == null) {

                } else if (message.equalsIgnoreCase("error") || message.equalsIgnoreCase("ok")) {
                    if (Alert.getMessage() != null) {
                        out.println(Alert.getMessage());
%>
    <br/><br/>
<a href="<%="viewexam.jsp?&&operation=list"%>" class="btn btn-lg btn-success btn-group-justified">
                <span class="fa fa-users"></span>Back To List</a>
<%
                    }
                } else {
                }
}
else{
        response.sendRedirect("invalidaccess.jsp");
    }
%>

<!-- END PAGE CONTENT -->
</div>
<!-- END PAGE CONTAINER -->
<%@include file="inc/footer.jsp" %>