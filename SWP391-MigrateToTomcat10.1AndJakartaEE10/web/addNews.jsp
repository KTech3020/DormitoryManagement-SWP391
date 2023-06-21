<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/includes/header.jsp" %> 
        <form action ="create" method = "post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>ID</td>
                    <td><input type="text" name="notiID" value ="${listP.notiID}" required></td>             
                </tr>
                
                <tr>
                    <td>Tiêu đề</td>
                    <td><input type="text" name="subject" value ="${listP.subject}" required></td>             
                </tr>
                <tr>
                    <td>Nội dung</td>
                    <td><input type="text" name="content" value ="${listP.content}" required></td>             
                </tr>
                 <tr>
                    <td>Người đăng</td>
                    <td><input type="text" name="userId" value ="${listP.userId}" required></td>             
                </tr>
                 <tr>
                    <td>Ngày đăng</td>
                    <td><input type="text" name="time" value ="${listP.time}" required></td>             
                </tr>
                
                <tr>
                    <td>Image</td>
                    <td><input type="file" name="img" required></td>   
                </tr>


                <tr>
                    <td><button type = "submit"> Create </button></td>
                </tr>
                
                <td>
                    <button> <a href="banner_news.jsp" type = "cancel"> Cancel </a></button>
                </td>
                
            </table> 
        </form>    
                    
<%@ include file="/includes/footer.jsp" %>

        