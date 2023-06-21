<%@page contentType="text/html" pageEncoding="utf-8" %>	
<%@ page import="java.util.ArrayList,java.time.format.DateTimeFormatter,entity.RoomRegistration" %>
<section id="banner">
    <div class="content">
        <header>
            <h1>QUẢN LÝ ĐĂNG KÝ PHÒNG</h1>
        </header>
        <div>
        <%if (request.getAttribute("err") !=null){%>
        <span style="color: red">${err}</span>
        <%} else if (request.getAttribute("registersList") !=null){%>
        <table style="margin-top: 50px">
            <tr>
                <th>ID </th>
                <th>ID phòng</th>
                <th>MSSV</th>
                <th>Thời gian đăng ký</th>
                <th>Đăng ký cho kì</th>
                <th>Trạng thái đăng ký</th>
                <th>Mức giá</th>
                <th>Chức năng</th>
            </tr>

            <%ArrayList historyList = (ArrayList)request.getAttribute("registersList"); 
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            for (Object o : historyList){RoomRegistration room =(RoomRegistration) o;%>
            <tr>
                <td><%= room.getRegisterID() %></td>
                <td><%= room.getRoomID() %></td>
                <td><%= room.getUserID() %></td>
                <td><%= room.getRegistrationTime().format(formatter) %></td>
                <td><%= room.getSemester() %></td>
                <td><%= room.getStatus() %></td>
                <td><%= room.getPriceAtTheTime() %></td>
                <td>
                    <% if (room.getStatus().equals("Registered")) {%>
                    <form action="ManageRoomRegistrationServlet" method="POST">
                        <input type= "hidden" value="<%= room.getRegisterID() %>" name="registerID">
                        <input type= "hidden" value="Success" name="status">
                        <button class="button small">Chấp nhận</button>
                    </form>
                    <form action="ManageRoomRegistrationServlet" method="POST">
                        <input type= "hidden" value="<%= room.getRegisterID() %>" name="registerID">
                        <input type= "hidden" value="Rejected" name="status">
                        <button class="button small">Từ chối</button>
                    </form>
                        <%}%>
                </td>
            </tr>
            <%}%>
        </table>
        <%} %>    
        <button><a href="index" class="nav-item nav-link">Về trang chủ</a></button>
        </div>
    </div>
</section>
</div>
</div>

