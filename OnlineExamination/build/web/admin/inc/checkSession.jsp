<%@page import="services.Alert"%>
<%
    String type = (String)session.getAttribute("user_id");
    if(type=="" || type==null){
        Alert.setIconMessage("You Cann't Access That page directly. Kindly Login for it.", "danger", "fa fa-times-circle");
        response.sendRedirect("index.jsp?msg=error");
    }  
    
%>