<%-- 
    Document   : updateStudent
    Created on : May 24, 2023, 8:57:06 PM
    Author     : MSI GL63
--%>
<%@ include file="/includes/header.jsp" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form action ="ManageNews" method ="post"  enctype="multipart/form-data">
    <table>
         <tr>
            <td>ID bài đăng</td>
            <td><input type="text" name="notiID" value="${ListP.notiID}" required></td>             
        </tr>
        <tr>
            <td>Tiêu Đề</td>
            <td><input type="text" name="subject" value="${listP.subject}" requireds></td>             
        </tr>

        <tr>
            <td>Nội Dung</td>
            <td><input type="text" name="content" value="${ListP.content}" required></td>             
        </tr>
        
        <tr>
            <td>Người Đăng</td>
            <td><input type="text" name="userId" value="${ListP.userId}" required></td>             
        </tr>
        
         <tr>
            <td>Ngày Đăng</td>
            <td><input type="text" name="time" value="${ListP.time}" required></td>             
        </tr>
       


       
        <tr>
            <td>Image</td>
            <td><img src="images/${ListP.img}" height="200px" width="180px">
                <input type="file" name="img">
            </td>   
        </tr>

        <tr>
            <td><button type = "Update"> Update </button></td>
            <td><a href="banner_news.jsp" style = "background-color: white; color: black"></a></td>
        </tr>
    </table> 
</form>
</div></div>
<%@ include file="/includes/column_left_home.jsp" %> 
<%@ include file="/includes/footer.jsp" %> 


