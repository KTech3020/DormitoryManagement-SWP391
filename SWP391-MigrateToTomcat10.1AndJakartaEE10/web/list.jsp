<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" import="Model.*,java.util.*" pageEncoding="utf-8" %>
<% response.setCharacterEncoding("UTF-8"); %>
<%@ include file="/includes/header.jsp" %>

<!-- start the middle column -->
            <h1> Student List </h1>   
            <table border="1px solid black">
                <tr>
                    <th></th>
                    <th>ID</th>
                    <th>Name</th>
                    <th style = "text-align: center">Gender</th>
                    <th style = "text-align: center">Date of birth</th>
                    <th style = "text-align: center">Username</th>
                    <th style = "text-align: center">Password</th>
                    <th style = "text-align: center">Image</th>
                    <th style = "text-align: center">Update</th>
                    <th style = "text-align: center">Delete</th>
                </tr>
            <c:forEach items="${student}" var="x">
                <tr>
                    <td style = "vertical-align: middle">${x.num}</td>
                    <td style = "vertical-align: middle">${x.id}</td>
                    <td style = "vertical-align: middle">${x.name}</td>
                    <td style = "text-align: center; vertical-align: middle">${x.gender}</td>        
                    <td style = "text-align: center; vertical-align: middle">${x.dob}</td>
                    <td style = "text-align: center; vertical-align: middle">${x.userName}</td>
                    <td style = "text-align: center; vertical-align: middle">${x.pass}</td>
                    <td style = "text-align: center; vertical-align: middle"><img src="images/${x.img}" height="100px" width="100px"></td>
                    
                    <td style = "text-align: center; vertical-align: middle">
                        <a href="update?num=${x.num}">Update</a>                    
                    </td>
                    
                    <td style = "text-align: center; vertical-align: middle">
                        <a href="delete?id=${x.id}">Delete</a>
                    </td>
                </tr>
            </c:forEach>

            </table>
            <a href="add.jsp">Add more...</a>  
<%@ include file="/includes/column_left_home.jsp" %>
<%@ include file="/includes/footer.jsp" %>


<!-- end the middle column -->


