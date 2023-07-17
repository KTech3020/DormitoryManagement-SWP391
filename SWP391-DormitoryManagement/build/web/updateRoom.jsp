<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/includes/header.jsp" %>



<form action="UpdateRoomServlet" method ="post" >
    <h1 style="text-align: center; padding-top: 20px">CẬP NHẬT PHÒNG Ở</h1>
    <table>
        <tr>
            <td>ID phòng</td>
            <td><input type="text" name="roomID" value="${room.roomID}" readonly></td>             
        </tr>

        <tr>
            <td>Kích thước phòng</td>
            <td>
                <select id="roomSize" required name="roomSize"">
                    <option <c:if test="${room.roomSize == 4}">selected</c:if> value="4">Phòng 4 chỗ</option>
                    <option <c:if test="${room.roomSize == 6}">selected</c:if> value="6">Phòng 6 chỗ</option>
                    <option <c:if test="${room.roomSize == 8}">selected</c:if> value="8">Phòng 8 chỗ</option>
                </select>
            </td>          
        </tr>

        <tr>
            <td>Số người đang ở</td>
            <td><input type="text" name="roomAttendees" value="${room.roomAttendees}" readonly></td>             
        </tr>
        
        <tr>
            <td>Giới tính</td>
            <td>
                <select required name="gender">
                    <option <c:if test="${room.gender eq 'M'}">selected</c:if> value="M">Nam</option>
                    <option <c:if test="${room.gender eq 'F'}">selected</c:if> value="F">Nữ</option>
                </select>
            </td> 
        </tr>


        <tr>
            <td>Có điều hòa?</td>
            <td>
                <select required name="hasAirConditioner">
                    <option <c:if test="${room.hasAirConditioner eq 'Y'}">selected</c:if> value="Y">Có</option>
                    <option <c:if test="${room.hasAirConditioner eq 'N'}">selected</c:if> value="N">Không</option>
                </select>
            </td>   
        </tr>

        <tr>
            <td>Mức giá phòng</td>
            <td><input type="text" name="price" value="${room.price}" required ></td>   
        </tr>

        <tr>
            <td><button type = "submit"> Cập nhật </button></td>
        </tr>

    </table> 

</form>
</div></div>

<%@ include file="/includes/column_left_home.jsp" %> 
<%@ include file="/includes/footer.jsp" %> 
