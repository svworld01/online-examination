<%@include file="inc/checkSession.jsp"%>
<%
    String fs = session.getAttribute("fs").toString();
    if(fs!=null){
        if(fs.equalsIgnoreCase("Completed")){
            response.sendRedirect("home.jsp");
        }else if(fs.equalsIgnoreCase("Step3")){
            response.sendRedirect("step3.jsp");
        }
    }
%>
<%@include file="inc/head.jsp" %>

<%
    String msg = request.getParameter("msg");
    String message="";
    if(msg!=null){
        if(msg.equalsIgnoreCase("error")){
            message = "<div class='alert alert-danger'>Your Profile Is Not Updated Please Fill All The Fields Correctly</div>";
        }
        else{
            
        }
    }
%>
<div class="content">
    <div class="page-register rlp" style="background-attachment: fixed;">
        <div class="container">
            <div class="register-wrapper rlp-wrapper" >
                <div class="register-table rlp-table"><a href="index.html"></a>

                    <div class="register-title rlp-title">Complete Your Profile To Proceed</div>
                    <form action="SetProfile" method="post">
                        <div class="register-form bg-w-form rlp-form">
                            <div class="row">
                                <div class="col-lg-12">
                                    <%= message%>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="fname" class="control-label form-label">Father's Name <span class="highlight">*</span></label>
                                    <input name="fname" type="text" placeholder="Father's Name" class="form-control form-input" required="true"/><!--p.help-block Warning !-->
                                </div>
                                <div class="col-md-6">
                                    <label for="mname" class="control-label form-label">
                                        mother's Name 
                                        <span class="highlight">*</span>
                                    </label>
                                    <input name="mname" type="text" placeholder="Mother's Name" class="form-control form-input" required="true"/><!--p.help-block Warning !-->
                                </div>
                                <div class="col-md-6">
                                    <label for="dob" class="control-label form-label">
                                        date of birth
                                        <span class="highlight">*</span>
                                    </label>
                                    <input name="dob" type="date" class="form-control form-input" required="true"/><!--p.help-block Warning !-->
                                </div>
                                <div class="col-md-6">
                                    <label for="gender" class="control-label form-label">
                                        Gender
                                        <span class="highlight">*</span>
                                    </label>
                                    <select name="gender" class="form-control form-input" required="true">
                                        <option value="">Choose</option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="category" class="control-label form-label">
                                        Category
                                        <span class="highlight">*</span>
                                    </label>
                                    <select name="category" class="form-control form-input" required="true">
                                        <option value="">CHOOSE</option>
                                        <option value="GENERAL">GENERAL</option>
                                        <option value="OBC">OBC</option>
                                        <option value="SC/ST">SC/ST</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="religion" class="control-label form-label">
                                         religion
                                        <span class="highlight">*</span>
                                    </label>
                                    <input name="religion" type="text" placeholder="Religion" class="form-control form-input" required="true"/><!--p.help-block Warning !-->
                                </div>
                                <div class="col-md-6">
                                    <label for="nationality" class="control-label form-label">
                                         nationality
                                        <span class="highlight">*</span>
                                    </label>
                                    <input name="nationality" type="text" placeholder="Nationality" class="form-control form-input" required="true"/><!--p.help-block Warning !-->
                                </div>
                                <div class="col-md-6">
                                    <label for="address" class="control-label form-label">
                                         postal address
                                        <span class="highlight">*</span>
                                    </label>
                                    <textarea name="address" type="text" placeholder="" class="form-control form-input" required="true"></textarea><!--p.help-block Warning !-->
                                </div>
                                <div class="col-md-6">
                                    <label for="pin" class="control-label form-label">
                                         pin
                                        <span class="highlight">*</span>
                                    </label>
                                    <input name="pin" type="number" placeholder="xxxxxx" class="form-control form-input" required="true"/><!--p.help-block Warning !-->
                                </div>
                                <div class="col-md-6">
                                    <label for="mob_number" class="control-label form-label">
                                         mobile number
                                        <span class="highlight">*</span>
                                    </label>
                                    <input name="mob_number" type="number" placeholder="xxxxxxxxxx" class="form-control form-input" required="true"/><!--p.help-block Warning !-->
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
