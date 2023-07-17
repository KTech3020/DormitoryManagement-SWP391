<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/includes/header.jsp" %> 
<form action ="AddNewsServlet" method = "post" enctype="multipart/form-data">
    <table>
        <tr>
            <td>Tiêu đề</td>
            <td><input type="text" name="title" required></td>             
        </tr>
        <tr>
            <td>Nội dung</td>
            <td><textarea rows="15" name="content" required></textarea></td>             
        </tr>
        <tr>
            <td>Ảnh</td>
            <td><input type="file" name="img" required></td>   
        </tr>
        <tr>
            <td><button type = "submit"> Tạo </button></td>
            <td>
                <button> <a href="index" type = "cancel"> Cancel </a></button>
            </td>
        </tr>
    </table> 
</form>    
</div></div>
<%@ include file="/includes/column_left_home.jsp" %>
<%@ include file="/includes/footer.jsp" %>