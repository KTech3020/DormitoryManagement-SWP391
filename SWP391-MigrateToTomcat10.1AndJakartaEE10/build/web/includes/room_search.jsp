<%@page contentType="text/html" pageEncoding="utf-8" %>	
<%@ page import="java.util.ArrayList,entity.Room" %>
<section id="banner">
    <div class="content">
        <header>
            <h1>TÌM KIẾM PHÒNG</h1>
        </header>
        <form class="dangki" action ="RoomSearchServlet" method="POST">
            <div class="row gtr-uniform">
                <div class="col-2 col-12-xsmall"></div>
                <div class="col-4 col-12-xsmall">
                    <label>Kích thước phòng</label>
                    <select required name="roomSize">
                        <option value="" disabled selected hidden>Chọn kích thước</option><!-- dummy default option -->
                        <option value="4">Phòng 4 chỗ</option>
                        <option value="6">Phòng 6 chỗ</option>
                        <option value="8">Phòng 8 chỗ</option>
                    </select>
                </div>
                <div class="col-4 col-12-small">
                    <label>Giới tính phòng</label>
                    <select required name="gender">
                        <option value="" disabled selected hidden>Chọn giới tính phòng</option><!-- dummy default option -->
                        <option value="M">Nam</option>
                        <option value="F">Nữ</option>
                    </select>
                </div>
                <div class="col-2 col-12-xsmall"></div><div class="col-2 col-12-xsmall"></div>
                <div class="col-4 col-12-small">
                    <label>Số lượng người tối đa trong phòng</label>
                    <input type="number" required step=1 min=0 max=8 placeholder=0 name="roomAttendees"/>
                </div>
                <div class="col-4 col-12-small">
                    <label>Mức giá tối đa</label>
                    <input type="number" required step=1000 min=0 placeholder=0 name="price"/>
                </div>
                <div class="col-2 col-12-xsmall"></div>
                <div class="col-2 col-12-xsmall"></div>
                <div class="col-4 col-12-small">
                    <input type="checkbox" id="hasAirCon" name="hasAirCon" value="Y">
                    <label for="hasAirCon">Có điều hòa?</label>
                </div>
                <div class="col-6 col-12-xsmall"></div>
                <div class="col-4 col-12-small"></div>
                <div class="col-2 col-12-small">
                    <input type="submit" value="TÌM KIẾM">
                </div>
                <div class="col-2 col-12-small">
                    <a  href="RoomSearchServlet">Xem tất cả</a>
                </div>
            </div>
        </form>
        <%if (request.getAttribute("err") !=null){%>
        <span style="color: red">${err}</span>
        <%}%>
        <%if (request.getAttribute("roomList") !=null){%>
        <h2>Kết quả tìm kiếm</h2>
        <table style="margin-top: 50px">
            <tr>
                <th>ID phòng</th>
                <th>Số chỗ phòng</th>
                <th>Số người đang sống</th>
                <th>Giới tính phòng</th>
                <th>Có điều hòa?</th>
                <th>Mức giá phòng</th>
            </tr>

            <%ArrayList roomList = (ArrayList)request.getAttribute("roomList"); 
                    for (Object o : roomList){Room room =(Room) o;%>
            <tr>
                <td><%= room.getRoomID() %></td>
                <td><%= room.getRoomSize() %></td>
                <td><%= room.getRoomAttendees() %></td>
                <td><%= room.getGender() %></td>
                <td><%= room.getHasAirConditioner() %></td>
                <td><%= room.getPrice() %></td>
            </tr>
            <%}%>
        </table>
        <%}%>
    </div>
</section>
</div>
</div>