<%@page contentType="text/html" pageEncoding="utf-8" %>	
<%@ page import="java.util.ArrayList,java.time.format.DateTimeFormatter,entity.News" %>
<%@ include file="/includes/header.jsp" %>

<script>
    function confirmDelete(event) {
        if (confirm("Bạn có chắc chắn xóa hay không?")) {
            alert("Xóa thành công!");
        } else {
            event.preventDefault();
        }
        return true;
    }
</script>

<section id="banner">
    <div class="content">
        <header>
            <h1>QUẢN LÝ THÔNG BÁO</h1>
        </header>
        <button onclick="window.location = 'addNews.jsp';">THÊM THÔNG BÁO</button>     
        <%if (request.getAttribute("err") !=null){%>
        <span style="color: red">${err}</span>
        <%}%>
        <%if (request.getAttribute("newsList") !=null){%>
        <table style="margin-top: 50px">
            <tr>
                <th>ID</th>
                <th>Tiêu đề</th>
                <th>Chỉnh sửa lần cuối</th>
                <th>Người chỉnh sửa</th>
                <th>Chức năng</th>
            </tr>
            <% ArrayList newsList = (ArrayList)request.getAttribute("newsList"); 
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            for (Object o : newsList){News news =(News) o;%>
            <tr>
                <td><%= news.getNewsID() %></td>
                <td><%= news.getSubject() %></td>
                <td><%= news.getTime().format(formatter) %></td>
                <td><%= news.getUserId() %></td>
                <td>
                    <a style="white-space: nowrap;" href="EditNewsServlet?notiID=<%= news.getNewsID() %>">Sửa</a>

                    <a style="white-space: nowrap;" onclick="confirmDelete(event);" href="DeleteNewsServlet?notiID=<%= news.getNewsID() %>">Xóa</a>
                </td>
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