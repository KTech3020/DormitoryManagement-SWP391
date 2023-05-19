<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/includes/header.jsp" %> 
        <form action ="create" method = "post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>ID</td>
                    <td><input type="text" name="id" required></td>             
                </tr>
                
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" required></td>             
                </tr>

                <tr>
                    <td>Gender</td>
                    <td><select name="gender">
                            <option value="M">Male</option>
                            <option value="F">Female</option>
                            <option value="L">LGBT</option>
                        </select>
                    </td> 
                </tr>

                <tr>
                    <td>DOB</td>
                    <td><input type="text" name="dob" required></td>   
                </tr>
                
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="username" required></td>   
                </tr>
                
                <tr>
                    <td>Password</td>
                    <td><input type="text" name="password" required></td>   
                </tr>
                
                <tr>
                    <td>Image</td>
                    <td><input type="file" name="img" required></td>   
                </tr>


                <tr>
                    <td><button type = "submit"> Create </button></td>
                </tr>

            </table> 
        </form>    
<%@ include file="/includes/column_left_home.jsp" %>
<%@ include file="/includes/footer.jsp" %>

        