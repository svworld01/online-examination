
<%
    String type = (String)session.getAttribute("stu_id");
    if(type=="" || type==null){
        
        response.sendRedirect("login.jsp?msg=error");
    }  
    
%>