<%
    Account account = (Account) session.getAttribute("accountS");
    if (account == null || account.getIsAdmin() == 1){
        response.sendRedirect("/SWP391-MigrateToTomcat10.1AndJakartaEE10/index");
    } else { %>
<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/room_search.jsp" %>
<%@ include file="/includes/column_left_home.jsp" %>
<%@ include file="/includes/footer.jsp" %>
<%}%>