<%-- 
    Document   : updateStudent
    Created on : May 24, 2023, 8:57:06 PM
    Author     : MSI GL63
--%>
<%
    Account account = (Account) session.getAttribute("accountS");
    if (account == null || account.getIsAdmin() == 0){
        response.sendRedirect("/SWP391-MigrateToTomcat10.1AndJakartaEE10/index");
    } else { %>
<%@ include file="/includes/header.jsp" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form action ="EditNewsServlet" method ="post"  enctype="multipart/form-data">
    <table>
         <tr>
            <td>ID bài đăng</td>
            <td><input type="text" name="notiID" value="${news.newsID}" required></td>             
        </tr>
        <tr>
            <td>Tiêu đề</td>
            <td><input type="text" name="subject" value="${news.subject}" required></td>             
        </tr>

        <tr>
            <td>Nội dung</td>
            <td><textarea rows="15" name="content"required>${news.content}</textarea></td>             
        </tr>
        <tr>
            <td>Ảnh</td>
            <td><img src="images/${news.image}" height="150px" width="240px">
                <input type="file" name="img">
            </td>   
        </tr>

        <tr>
            <td><button type ="submit">Cập nhật</button></td>
            <td>
                <a href="index" type = "cancel"> <button> Cancel</button> </a>
            </td>
        </tr>
    </table> 
</form>
</div></div>
<%@ include file="/includes/column_left_home.jsp" %> 
<%@ include file="/includes/footer.jsp" %> 
<%}%>