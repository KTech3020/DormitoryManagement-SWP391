
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="entity.Statistics" %>
<%@ include file="/includes/header.jsp" %>

<section id="banner">
    <div class="content">
        <header>
            <h1>THỐNG KÊ</h1>
        </header>
        <%if (request.getAttribute("err") !=null){%>
        <span style="color: red">${err}</span>
        <%}%>
        <table>
        <tr>
            <td>Tổng số chỗ</td>
            <td>${stats.allRoomSize}</td>             
        </tr>
        <tr>
            <td>Số chỗ hiện đã ở</td>
            <td>${stats.occupiedRoomSize}</td>             
        </tr>
        <tr>
            <td>Số chỗ còn trống</td>
            <td>${stats.emptyRoomSize}</td>             
        </tr>
        <tr>
            <td>Số nam đang ở</td>
            <td>${stats.maleOccupied}</td>             
        </tr>
        <tr>
            <td>Số nữ đang ở</td>
            <td>${stats.femaleOccupied}</td>             
        </tr>
        <tr>
            <td>Tổng số phòng</td>
            <td>${stats.roomCount}</td>             
        </tr>
        <tr>
            <td>Số phòng đầy chỗ</td>
            <td>${stats.fullRoom}</td>             
        </tr>
        <tr>
            <td>Số phòng có người ở</td>
            <td>${stats.occupiedRoom}</td>             
        </tr>
        <tr>
            <td>Số phòng trống</td>
            <td>${stats.emptyRoom}</td>             
        </tr>
        <tr>
            <td>Tổng số tiền đã trả</td>
            <td>${stats.totalPaid}</td>             
        </tr>
        <tr>
            <td>Số tiền đã trả cho đăng kí phòng kì tới</td>
            <td>${stats.semesterPaid}</td>             
        </tr>
        
    </table> 
    </div>
</section>

</div></div>
<%@ include file="/includes/column_left_home.jsp" %>
<%@ include file="/includes/footer.jsp" %>
