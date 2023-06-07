<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/includes/header.jsp" %>



<form action="AddRoomServlet" method ="post" >
    <h1 style="text-align: center; padding-top: 20px">THÊM PHÒNG Ở MỚI</h1>
    <table>
        <tr>
            <td>ID phòng</td>
            <td><input type="text" name="roomID" required></td>             
        </tr>

        <tr>
            <td>Kích thước phòng</td>
            <td><input type="text" name="roomSize" required></td>             
        </tr>

        <tr>
            <td>Giới tính</td>
            <td>
                <input type="text" name="gender" required>                   
            </td>
        </tr>


        <tr>
            <td>Có điều hòa?</td>
            <td><input type="text" name="hasAirConditioner" required></td>   
        </tr>

        <tr>
            <td>Mức giá phòng</td>
            <td><input type="text" name="price" required ></td>   
        </tr>

        <tr>
            <td><button type = "submit"> Tạo Phòng </button></td>
        </tr>

    </table> 

</form>
</div></div>

<%@ include file="/includes/column_left_home.jsp" %> 
<%@ include file="/includes/footer.jsp" %> 
