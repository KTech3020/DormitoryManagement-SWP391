<%@page contentType="text/html" pageEncoding="utf-8" %>	
<%@ page import="java.util.ArrayList,java.time.format.DateTimeFormatter,entity.News" %>
<%@ include file="/includes/header.jsp" %>

<form action ="SingleNew" method ="post"  enctype="multipart/form-data">
    <table>
        
        <tr>
           
                <h2>${SingleNew.subject}</h2>                  
        </tr>
        <tr>
        <p><strong>Cập nhật lần cuối: </strong>${SingleNew.time}</p>
        
        </tr>
        <tr>
        <p><strong>Người đăng: </strong>${SingleNew.userId}</p>
        </tr>

        <tr>
            <td>${SingleNew.content}</td>            
        </tr>
        <tr>
        <a class="image"><img src="images/${SingleNew.image}"  /></a>
             
        </tr>

        
    </table> 
</form>
</div></div>
<%@ include file="/includes/column_left_home.jsp" %>
<%@ include file="/includes/footer.jsp" %>