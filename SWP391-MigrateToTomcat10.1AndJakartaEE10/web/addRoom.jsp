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
            <td>
                <select id="roomSize" required name="roomSize"">
                    <option value="" disabled selected hidden>Chọn kích thước</option><!-- dummy default option -->
                    <option value="4">Phòng 4 chỗ</option>
                    <option value="6">Phòng 6 chỗ</option>
                    <option value="8">Phòng 8 chỗ</option>
                </select>
            </td>          
        </tr>

        <tr>
            <td>Giới tính</td>
            <td>
                <select required name="gender">
                    <option value="" disabled selected hidden>Chọn giới tính phòng</option><!-- dummy default option -->
                    <option value="M">Nam</option>
                    <option value="F">Nữ</option>
                </select>
            </td> 
        </tr>


        <tr>
            <td>Có điều hòa?</td>
            <td>
                <select required name="hasAirConditioner">
                    <option selected value="Y">Có</option>
                    <option value="N">Không</option>
                </select>
            </td>   
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