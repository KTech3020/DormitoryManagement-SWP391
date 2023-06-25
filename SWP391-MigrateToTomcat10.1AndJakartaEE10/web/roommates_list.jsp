<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.util.ArrayList,entity.Person" %>

<%@ include file="/includes/header.jsp" %>

<section id="banner">
    <div class="content">
        <header>
            <h1>Danh sách bạn cùng phòng</h1>
        </header>

        <table style="margin-top: 50px">
            <tr style="text-align: center">
                <th>ID</th>
                <th>Họ và tên</th>
                <th>Giới tính</th>
                <th>Ngày sinh</th>
                <th>SĐT</th>
                <th>Email</th>
                <th>Địa chỉ</th>
                <th>Ảnh</th>
            </tr>

            <%  ArrayList roommatesList = (ArrayList)request.getAttribute("roommatesList"); 
                    for (Object o : roommatesList){Person person =(Person) o;%>
            <tr>
                <td><%= person.getIdPerson() %></td>
                <td><%= person.getName() %></td>
                <td><%= person.getGender() %></td>
                <td><%= person.getDob() %></td>
                <td><%= person.getPhone() %></td>
                <td><%= person.getEmail() %></td>
                <td><%= person.getAddress() %></td>
                <td><img height="160px" width="120px" src="images/<%= person.getImg() %>"/></td>
            </tr>
            <%}%>
        </table>
    </div>
</section>
</div></div>
<%@ include file="/includes/column_left_home.jsp" %>
<%@ include file="/includes/footer.jsp" %>
