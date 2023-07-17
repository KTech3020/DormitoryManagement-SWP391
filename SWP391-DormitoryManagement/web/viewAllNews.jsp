<%@page contentType="text/html" pageEncoding="utf-8" %>	
<%@ page import="java.util.ArrayList,java.time.format.DateTimeFormatter,entity.News" %>
<%@ include file="/includes/header.jsp" %>
<section id="banner">
    <div class="content">
        <header>
            <h1>THÔNG BÁO ĐÃ ĐĂNG</h1>
        </header>
             
        <%if (request.getAttribute("err") !=null){%>
        <span style="color: red">${err}</span>
        <%}%>
        <%if (request.getAttribute("newsList") !=null){%>
        <table style="margin-top: 50px">
            <tr>
                <th>Tiêu đề</th>
                <th>Chỉnh sửa lần cuối</th>
            </tr>
            <% ArrayList newsList = (ArrayList)request.getAttribute("newsList"); 
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            for (Object o : newsList){News news =(News) o;%>
            <tr>
                <td><a style="white-space: nowrap;" href="StudentViewSingleNewsServlet?nid=<%= news.getNewsID() %>"><%= news.getSubject() %></a></td>
                <td><%= news.getTime().format(formatter) %></td>
            </tr>
            <% } %>
        </table>
        <%}%>
    </div>
</section>
</div>
</div>
<%@ include file="/includes/column_left_home.jsp" %>
<%@ include file="/includes/footer.jsp" %>