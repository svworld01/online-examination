<%@page import="services.DbDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="services.SelectData"%>
<%@include file="inc/head.jsp" %>
<%@include file="inc/sidebar.jsp" %>
<%@include file="inc/header.jsp" %>
<%
    String msg = request.getParameter("mag");
    String examid = request.getParameter("examid");
    String queid = request.getParameter("queid");
    String operation = request.getParameter("operation");
    String message = request.getParameter("msg");
    String tbname = "questions";
    String condition = " WHERE exam_id = " + examid + "";
    DbDao d = new DbDao();
    ResultSet rs = null;

    if (operation != null && (operation.equalsIgnoreCase("show") || operation.equalsIgnoreCase("edit") || operation.equalsIgnoreCase("add") || operation.equalsIgnoreCase("list") || operation.equalsIgnoreCase("delete"))) {
        if (examid != null && operation.equalsIgnoreCase("add")) {
            String aq = "";
            String tq = "";
            rs = d.selectAll(tbname, " COUNT(*) ", condition);
            if (rs.next()) {
                aq = rs.getString(1);
            }
            rs = d.selectAll("exams", "total_que", condition);
            if (rs.next()) {
                tq = rs.getString(1);
            }
%>
<div class="page-content-wrap">

    <div class="page-title">                    
        <h2><span class="fa fa-arrow-circle-o-left"></span>Add Questions for Exam ID : <%= examid%></h2>

    </div>
    <p style="margin-left:5%;">
        Total Questions : <b><%= tq%></b>
    </p>
    <p style="margin-left:5%;">
        Question Added : <b><%= aq%></b>
    </p>
    <br/>
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
    <%
        if (!tq.equalsIgnoreCase(aq)) {
    %>
    <form class="form-group" action="../AddQuestion" method="post">
        <div class="row" style="text-align: center">
            <div class="col-lg-10">

                <table class="table table-condensed" style="text-align: center; width: 90%; margin: 0px auto 0px auto;">
                    <tbody>
                        <tr>
                            <th>Question :</th>
                            <td><textarea class="form-control" name="question" required="true"></textarea></td>
                        </tr>
                        <tr>
                            <th>Option A :</th>
                            <td><input type="text" name="opa" class="form-control"  required="true"></td>
                        </tr>
                        <tr>
                            <th>Option B :</th>
                            <td><input type="text" name="opb" class="form-control"  required="true"></td>
                        </tr>
                        <tr>
                            <th>Option C :</th>
                            <td><input type="text" name="opc" class="form-control"  required="true"></td>
                        </tr>
                        <tr>
                            <th>Option D :</th>
                            <td><input type="text" name="opd" class="form-control"  required="true"></td>
                        </tr>
                        <tr>
                            <th>Answer :</th>
                            <td>
                                <select name="answer" required="true" class="form-control">
                                    <option value="">Choose Answer</option>
                                    <option value="A">A</option>
                                    <option value="B">B</option>
                                    <option value="C">C</option>
                                    <option value="D">D</option>
                                </select>
                            </td>
                        </tr>

                    </tbody>

                </table>
                <input type="hidden"value="<%= examid%>" name="examid"/>

            </div>
            <div class="col-lg-2" style="text-align: left;">
                <button type="submit" class="btn btn-lg btn-primary"><span class="fa fa-plus-circle"></span>Add</button>
            </div>
        </div>
    </form> 

    <%
    } else {
    %>
    <div class="row">
        <div class="col-lg-12">
            <%
                String link = "question.jsp?examid=" + examid + "&&operation=list";
                Alert.setIconMessage("Total Questions are Added for this exam. You cann't add more questions in this exam. <a href='" + link + "' class='btn btn-link'>Back To List</a>", "info", "fa fa-exclamation-triangle");
                if (Alert.getMessage() != null) {
                    out.println(Alert.getMessage());
                }
            %>   
        </div> </div>

</div>
<%
    }
} else if (queid != null && operation.equalsIgnoreCase("show")) {
    DbDao result = new DbDao();
    rs = result.selectAll(tbname, "*", " WHERE question_id = '" + queid + "'");
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
                        <td><%= rs.getString(2)%></td>
                    </tr>
                    <tr>
                        <td>Question ID </td>
                        <td><%= rs.getString(1)%></td>
                    </tr>
                    <tr>
                        <td>Question</td>
                        <td><%= rs.getString(3)%></td>
                    </tr>
                    <tr>
                        <td>Option A</td>
                        <td><%= rs.getString(4)%></td>
                    </tr>
                    <tr>
                        <td>Option B</td>
                        <td><%= rs.getString(5)%></td>
                    </tr>
                    <tr>
                        <td>Option C</td>
                        <td><%= rs.getString(6)%></td>
                    </tr>
                    <tr>
                        <td>Option D</td>
                        <td><%= rs.getString(7)%></td>
                    </tr>
                    <tr>
                        <td>Answer</td>
                        <td><%= rs.getString(8)%></td>
                    </tr>


                </tbody>

            </table>

        </div>
        <div class="col-lg-2" style="text-align: left; width: 15%;">
            <a href="<%="question.jsp?examid=" + rs.getString(2) + "&&operation=add"%>" class="btn btn-lg btn-primary btn-group-justified">
                <span class="fa fa-plus-square"></span>Add More</a>
            <br/>
            <a href="<%="question.jsp?queid=" + rs.getString(1) + "&&operation=edit"%>" class="btn btn-lg btn-info btn-group-justified">
                <span class="fa fa-edit"></span>Edit</a>
            <br/>
            <a href="<%="question.jsp?queid=" + rs.getString(1) + "&&operation=delete"%>" class="btn btn-lg btn-danger btn-group-justified">
                <span class="fa fa-times-circle"></span>Delete</a>
            <br/>
            <a href="<%="question.jsp?examid=" + rs.getString(2) + "&&operation=list"%>" class="btn btn-lg btn-success btn-group-justified">
                <span class="fa fa-list-alt"></span>Back to List</a>
            <br/>
        </div>

        <%
            } else {
                out.println("NO Data Found.");
            }
        %>

        <%
        } else if (examid != null && operation.equalsIgnoreCase("list")) {
            DbDao result = new DbDao();
            rs = result.selectAll(tbname, "*", condition);
            if (rs != null) {

        %>
        <!-- PAGE CONTENT WRAPPER -->
        <div class="page-content-wrap">
            <div class="page-title">                    
                <h2><span class="fa fa-arrow-circle-o-left"></span> Questions List of Exam ID : <%= examid%></h2>
            </div>
            <div style="text-align: right;" class="row">
                <div class="col-lg-12">
                    <a href="<%= "question.jsp?examid=" + examid + "&&operation=add"%>" class="btn btn-lg btn-primary">Add Question</a>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <!-- START DEFAULT DATATABLE -->
                    <div class="panel panel-default">

                        <div class="panel-heading ui-draggable-handle">                                
                            <h3 class="panel-title">Here is all Questions-</h3>

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

                                        <th style="width: 15%">Question ID</th>
                                        <th style="width: 75%">Question</th>
                                        <th style="width: 10%">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% while (rs.next()) {%>
                                    <tr>

                                        <td><%= rs.getString(1)%></td>
                                        <td><%= rs.getString(3)%></td>
                                        <td style="text-align: center;"><a href="<%="question.jsp?queid=" + rs.getString(1) + "&&operation=show"%>"><span class="fa fa-2x fa-eye"></span></a></td>

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

            <!-- END PAGE CONTENT -->
        </div>
        <!-- END PAGE CONTAINER -->
        <%
            } else {
                out.println("NO Data Found.");
            }
        } else if (examid != null && operation.equalsIgnoreCase("delete")) {

            System.out.println(message);
            if (message == null) {

            } else if (message.equalsIgnoreCase("error") || message.equalsIgnoreCase("ok")) {
                if (Alert.getMessage() != null) {
                    out.println(Alert.getMessage());
        %>
        <br/><br/>
        <a href="<%="question.jsp?examid=" + examid + "&&operation=list"%>" class="btn btn-lg btn-success btn-group-justified">
            <span class="fa fa-users"></span>Back To List</a>
            <%
                    }
                } else {
                }
            } else if (queid != null && operation.equalsIgnoreCase("edit")) {
                DbDao result = new DbDao();
                rs = result.selectAll(tbname, "*", " WHERE question_id = '" + queid + "'");
                if (rs.next()) {
            %>
        <div class="page-content-wrap">
            <div class="page-title">                    
                <h2><span class="fa fa-arrow-circle-o-left"></span> Edit Question ID : <%= queid%></h2>
            </div>
            <form class="form-group" action="../UpdateQuestion" method="post">
                <div class="row" style="text-align: center">
                    <div class="col-lg-10">

                        <table class="table table-condensed" style="text-align: center; width: 90%; margin: 0px auto 0px auto;">
                            <tbody>
                                <tr>
                                    <th>Exam ID :</th>
                                    <td><input type="text" value="<%= rs.getString(2)%>" class="form-control" name="examid" required="true" readonly="true"></textarea></td>
                                </tr>
                                <tr>
                                    <th>Question ID :</th>
                                    <td><input type="text" value="<%= rs.getString(1)%>" class="form-control" name="queid" required="true" readonly="true"></textarea></td>
                                </tr>
                                <tr>
                                    <th>Question :</th>
                                    <td><textarea class="form-control" name="question" required="true"><%= rs.getString(3)%></textarea></td>
                                </tr>
                                <tr>
                                    <th>Option A :</th>
                                    <td><input type="text" name="opa" value="<%= rs.getString(4)%>" class="form-control"  required="true"></td>
                                </tr>
                                <tr>
                                    <th>Option B :</th>
                                    <td><input type="text" name="opb" value="<%= rs.getString(5)%>" class="form-control"  required="true"></td>
                                </tr>
                                <tr>
                                    <th>Option C :</th>
                                    <td><input type="text" name="opc" value="<%= rs.getString(6)%>" class="form-control"  required="true"></td>
                                </tr>
                                <tr>
                                    <th>Option D :</th>
                                    <td><input type="text" name="opd" value="<%= rs.getString(7)%>" class="form-control"  required="true"></td>
                                </tr>
                                <tr>
                                    <th>Answer :</th>
                                    <td>
                                        <select name="answer" required="true" class="form-control">

                                            <option value="<%= rs.getString(8)%>" selected=""><%= rs.getString(8)%></option>
                                            <option value="A">A</option>
                                            <option value="B">B</option>
                                            <option value="C">C</option>
                                            <option value="D">D</option>
                                        </select>
                                    </td>
                                </tr>

                            </tbody>

                        </table>
                    </div>
                    <div class="col-lg-2" style="text-align: left;">
                        <button type="submit" class="btn btn-lg btn-primary"><span class="fa fa-pencil-square-o"></span>Update</button>
                    </div>
                </div>
            </form> 
            <%
                } else {

                }
            }  else {
                        response.sendRedirect("invalidaccess.jsp");
                    }

                } else {
                    response.sendRedirect("invalidaccess.jsp");
                }

            %>

            <%@include file="inc/footer.jsp" %>