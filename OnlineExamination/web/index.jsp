<%
    String type = (String)session.getAttribute("user_id");
    if(type!=null){
        
        response.sendRedirect("home.jsp");
    }  
    
%>
<%@include file="inc/head.jsp" %>
<%@include file="inc/header.jsp" %>
<div class="content">
    <%@include file="inc/slider.jsp" %>
    <%@include file="inc/choosemenu.jsp" %>
    <%@include file="inc/progress.jsp" %>
    <%@include file="inc/topcourses.jsp" %>
    <%@include file="inc/whyus.jsp" %>
    <%@include file="inc/pricing.jsp" %>
    <%@include file="inc/slideraboutus.jsp" %>
    <%@include file="inc/latestnewa.jsp" %>
    <%@include file="inc/toppers.jsp" %>
    <%@include file="inc/gallery.jsp" %>
    <%@include file="inc/slider.jsp" %>
</div>

<%@include file="inc/footer.jsp" %>