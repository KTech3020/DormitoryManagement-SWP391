<%@page contentType="text/html" pageEncoding="utf-8" %>
<%
    Account account = (Account) session.getAttribute("accountS");
    if (account == null || account.getIsAdmin() == 0){
        response.sendRedirect("/SWP391-MigrateToTomcat10.1AndJakartaEE10/index");
    } else { %>
<%@ include file="/includes/header.jsp" %>

<%@ include file="/includes/room_register_manage.jsp" %>
<%@ include file="/includes/column_left_home.jsp" %>
<%@ include file="/includes/footer.jsp" %>
<%}%>