<%@page contentType="text/html" pageEncoding="utf-8" %>
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
            <h3><%= news.getSubject() %></h3>
            <p>Cập nhật vào: <%= news.getTime().format(formatter) %></p>
            </br>
            <p><%= news.getContent() %></p>
        </article>      
        <% } %>        
    </div>
</section>
<% } %>
</div>
</div>