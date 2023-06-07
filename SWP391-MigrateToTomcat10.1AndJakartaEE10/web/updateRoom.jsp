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
            <td><input type="text" name="roomSize" value="${room.roomSize}"></td>             
        </tr>

        <tr>
            <td>Số người đang ở</td>
            <td><input type="text" name="roomAttendees" value="${room.roomAttendees}" readonly></td>             
        </tr>


        <tr>
            <td>Giới tính</td>
            <td>
                <c:choose>
                    <c:when test="${room.gender==M}">
                        <input type="text" name="gender" value="${room.gender}">
                    </c:when>
                    <c:otherwise>
                        <input type="text" name="gender" value="${room.gender}">
                    </c:otherwise>
                </c:choose>

            </td>
        </tr>
        
        
        <tr>
            <td>Có điều hòa?</td>
            <td><input type="text" name="hasAirConditioner" value="${room.hasAirConditioner}" ></td>   
        </tr>

        <tr>
            <td>Mức giá phòng</td>
            <td><input type="text" name="price" value="${room.price}" ></td>   
        </tr>

        <tr>
            <td><button type = "submit"> Cập nhật </button></td>
        </tr>

    </table> 

</form>
</div></div>

<%@ include file="/includes/column_left_home.jsp" %> 
<%@ include file="/includes/footer.jsp" %> 
