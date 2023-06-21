<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ include file="/includes/header.jsp" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:set var="numPage" value="${param.numPage}"/>  
<c:set var="pageSize" value="5"/>
<c:if test="${numPage ==null}">
    <c:set var="numPage" value="1"/>   
</c:if>

<style>
    .paggingmanage{
                display: flex;
                justify-content: center;
                align-items: center;


            }
            
            .pagging{
                font-size: 19px;
                padding: 10px;
                
                margin: 0px -24px;
                width: 9%;
                text-align: center;
                border-radius: 20px;
            }
</style>


<section id="banner">
    <div class="content">
        <header  style="text-align: center;">
            <h1>QUẢN LÝ PHÒNG Ở</h1>
        </header>
        <span style="color: red">${err}</span>
        <table style="margin-top: 50px">

            <thead>
                <tr>
                    <th>ID phòng</th>
                    <th>Số chỗ phòng</th>
                    <th>Số người đang sống</th>
                    <th>Giới tính phòng</th>
                    <th>Có điều hòa?</th>
                    <th>Mức giá phòng</th>
                    <th>Chức năng</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${roomList}" var="l" begin="${(numPage-1)*pageSize}" end="${(numPage*pageSize)-1}" >
                    <tr>
                        <td>${l.roomID}</td>
                        <td>${l.roomSize}</td>
                        <td>${l.roomAttendees}</td>
                        <td>${l.gender}</td>
                        <td>${l.hasAirConditioner}</td>
                        <td>${l.price}</td>
                        <td>
                            <a href="UpdateRoomServlet?roomID=${l.roomID}">Cập nhật |</a>
                            <a href="DeleteRoomServlet?roomID=${l.roomID}"> Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
                
            </tbody>
            
        </table>
        
        
        <div class="paggingmanage">

            <div class="pagging active">
                <a href="ManageRoomServlet"><<</a>  
            </div>
            <div class="pagging">
                <a href="ManageRoomServlet?numPage=<fmt:formatNumber value="${(numPage!=1)?(numPage-1):1}" type="number" pattern="###"/>  ">Prev</a> 
            </div>
            <div class="pagging">
                ${numPage}  
            </div>
            <div class="pagging">
                <a href="ManageRoomServlet?numPage=<fmt:formatNumber value="${(numPage!=lastPage)?(numPage+1):lastPage}" type="number" pattern="###"/> ">Next</a>
            </div>
            <div class="pagging">
                <a href="ManageRoomServlet?numPage=${lastPage}">>></a>
            </div>
        </div>
        
        
        <td><button><a href="addRoom.jsp">Thêm phòng</a></button></td>
        <td><button><a href="ManageRoomRegistrationServlet">Quản lý đăng kí phòng</a></button></td>

    </div>
</section>

</div></div>

<%@ include file="/includes/column_left_home.jsp" %> 
<%@ include file="/includes/footer.jsp" %> 