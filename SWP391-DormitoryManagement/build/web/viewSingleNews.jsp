<%@page contentType="text/html" pageEncoding="utf-8" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.ArrayList,java.time.format.DateTimeFormatter,entity.News" %>

<%@ include file="/includes/header.jsp" %>
<section id="banner">
    <div class="content">
        <table>
            <tr>
            <h2>${SingleNew.subject}</h2>                  
            </tr>
            <tr>
                <%
                    News singleNews = (News)request.getAttribute("SingleNew");
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                %>
            <p><strong>Cập nhật lần cuối: </strong><%= singleNews.getTime().format(formatter)%><strong> bởi: </strong>${SingleNew.userId}</p>
            </tr>
            <tr>
            <a class="image"><img src="images/${SingleNew.image}"  /></a>
            </tr>
            <tr>
                <% pageContext.setAttribute("newLineChar", "\n"); %> 
                ${fn:replace(SingleNew.content, newLineChar, "</br> ")}          
            </tr>
            
        </table> 
</section>

</div></div>
<%@ include file="/includes/column_left_home.jsp" %>
<%@ include file="/includes/footer.jsp" %>