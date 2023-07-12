<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import="java.util.ArrayList,java.time.format.DateTimeFormatter,entity.News" %>
<%if (request.getAttribute("newsList") !=null){%>
<section>
    <header class="major">
        <h2>Thông báo mới nhất</h2>
    </header>
    <div class="posts">
        <% ArrayList newsList = (ArrayList)request.getAttribute("newsList"); 
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                for (Object o : newsList){News news =(News) o;%>
        <article>
            <a class="image"><img src="images/<%= news.getImage() %>" alt="" /></a>
            <h3><a href="StudentViewSingleNewsServlet?nid=<%= news.getNewsID() %>"><%= news.getSubject() %></a></h3>
            <p>Cập nhật vào: <%= news.getTime().format(formatter) %></p>
            </br>
            <% pageContext.setAttribute("content", news.getContent()); %> 
            <% pageContext.setAttribute("newLineChar", "\n"); %> 
            <p>${fn:replace(content, newLineChar, "</br> ")}</p>
        </article>      
        <% } %>    
    </div>
    <button onclick="window.location = 'StudentViewAllNewsServlet';">XEM TẤT CẢ THÔNG BÁO</button>
</section>
<% } %>
</div>
</div>