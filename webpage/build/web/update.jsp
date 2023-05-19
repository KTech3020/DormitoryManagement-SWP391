<%-- 
    Document   : update
    Created on : Feb 17, 2023, 11:00:35 AM
    Author     : ASUS
--%>
 <%@ include file="/includes/header.jsp" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form action ="update" method = "post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>N.o</td>
                    <td><input type="text" name="num" value="${std.num}" readonly></td>             
                </tr>
                
                <tr>
                    <td>ID</td>
                    <td><input type="text" name="id" value="${std.id}" required></td>             
                </tr>
                
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" value="${std.name}" required></td>             
                </tr>

                <tr>
                    <td>Gender</td>
                    <td><select name="gender">
                            <option value="M" ${male}>Male</option>
                            <option value="F" ${female}>Female</option>
                            <option value="L" ${lgbt}>LGBT</option>
                        </select>
                    </td> 
                </tr>

                <tr>
                    <td>DOB</td>
                    <td><input type="text" name="dob" value="${std.dob}" required></td>   
                </tr>
                
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="username" value="${std.userName}" required></td>   
                </tr>
                
                <tr>
                    <td>Password</td>
                    <td><input type="text" name="pass" value="${std.pass}" required></td>   
                </tr>
                
                <tr>
                    <td>Image</td>
                    <td><img src="images/${std.img}" height="200px" width="180px">
                        <input type="file" name="img">
                    </td>   
                </tr>

                <tr>
                    <td><button type = "submit"> Update </button></td>
                </tr>

            </table> 
        </form>    
<%@ include file="/includes/column_left_home.jsp" %>
<%@ include file="/includes/footer.jsp" %>

