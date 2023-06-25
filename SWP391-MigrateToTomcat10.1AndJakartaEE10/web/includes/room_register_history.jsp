<%@page contentType="text/html" pageEncoding="utf-8" %>	
<%@ page import="java.util.ArrayList,java.time.format.DateTimeFormatter,entity.RoomRegistration" %>
<section id="banner">
    <div class="content">
        <header>
            <h1>LỊCH SỬ ĐĂNG KÝ PHÒNG</h1>
        </header>
        <div>
        <%if (request.getAttribute("err") !=null){%>
        <span style="color: red">${err}</span>
        <%} else if (request.getAttribute("historyList") !=null){%>
        <table style="margin-top: 50px">
            <tr>
                <th>ID phòng</th>
                <th>Thời gian đăng ký</th>
                <th>Đăng ký cho kì</th>
                <th>Trạng thái đăng ký</th>
                <th>Hủy đăng ký</th>
            </tr>

            <%ArrayList historyList = (ArrayList)request.getAttribute("historyList"); 
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            for (Object o : historyList){RoomRegistration room =(RoomRegistration) o;%>
            <tr>
                <td><%= room.getRoomID() %></td>
                <td><%= room.getRegistrationTime().format(formatter) %></td>
                <td><%= room.getSemester() %></td>
                <td><%= room.getStatus() %></td>
                <td>
                    <%if (room.getStatus().equals("Registered")){%>
                        <a href="CancelRegisterServlet?reRoomID=<%= room.getRegisterID() %>">Hủy</a>
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

