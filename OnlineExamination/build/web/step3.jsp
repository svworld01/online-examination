<%@include file="inc/checkSession.jsp" %>
<%@include file="inc/head.jsp" %>
<%
    String fs = session.getAttribute("fs").toString();
    if(fs!=null){
        if(fs.equalsIgnoreCase("Completed")){
            response.sendRedirect("home.jsp");
        }else if(fs.equalsIgnoreCase("Step2")){
            response.sendRedirect("step2.jsp");
        }
    }
%>

<%    String msg = request.getParameter("msg");
    String message = "";
    if (msg != null) {
        if (msg.equalsIgnoreCase("error")) {
            message = "<div class='alert alert-danger'>Your Profile Is Not Updated Please Fill All The Fields Correctly</div>";
        } else {

        }
    }
%>

<div class="content">
    <div class="page-register rlp">
        <div class="container">
            <div class="register-wrapper rlp-wrapper">
                <div class="register-table rlp-table"><a href="index.html"></a>

                    <div class="register-title rlp-title">Upload Your Profile Picture</div>
                    <form action="UploadProfile" method="post" enctype="multipart/form-data">
                        <div class="register-form bg-w-form rlp-form">
                            <div class="row">
                                <div class="col-lg-12">
                                    <%=message%>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label for="regname" class="control-label form-label">Upload Picture :  <span class="highlight">*</span></label>
                                    <input name="files" id="myphoto" type="file" placeholder="" class="form-control form-input" required="true"/><!--p.help-block Warning !-->
                                </div>

                                <div class="col-md-6">
                                    <br/>
                                    <div class="register-submit">
                                        <button type="submit" class="btn btn-register btn-green"><span>Upload</span></button>
                                    </div>
                                </div>

                            </div>
                            
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("#myphoto").select(function(){
            var url  = $(this).val();
            alert(url);
        });
        });
    });
</script>
<%@include file="inc/footer.jsp" %>