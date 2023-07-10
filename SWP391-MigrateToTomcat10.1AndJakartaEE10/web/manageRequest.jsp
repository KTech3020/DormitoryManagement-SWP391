
<%@ include file="/includes/header.jsp" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<section id="banner">
    <div class="content">
        <header>
            <h1>QUẢN LÝ GỬI YÊU CẦU / KHIẾU NẠI</h1>
        </header>

        <form  action ="TypeManageRequestServlet" method="POST">   
            <div class="row gtr-uniform">
                <div class="col-2 col-12-xsmall"></div>

                <div class="col-4 col-12-xsmall">
                    <label>Chọn loại yêu cầu</label>
                    <select name="option">
                        <option value="changeRoom" ${option.equals("changeRoom")?"selected":""}>Đổi phòng</option>
                        <option value="complain" ${option.equals("complain")?"selected":""}>Bảo trì / Khiếu nại</option>
                    </select>
                </div>

                <div class="col-4 col-12-small">
                    <label>Bấm để xác nhận</label>
                    <button type = "submit">Chọn</button>
                </div>
                <div class="col-2 col-12-xsmall"></div><div class="col-2 col-12-xsmall"></div>    
            </div>
        </form>
        <%
            String check = (String)request.getAttribute("option");
        %>            
        <%
               if(check.equals("changeRoom")){
        %> 
        <h2>CÁC YÊU CẦU ĐỔI PHÒNG</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Mã số sinh viên 1</th>
                    <th>Mã số sinh viên 2</th>
                    <th>Ngày gửi</th>
                    <th>Chức năng</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="l">
                    <tr>
                        <td>${l.changeRoomID}</td>
                        <td>${l.userId1}</td>
                        <td>${l.userId2}</td>
                        <td>${l.date}</td>
                        <td>
                            <form action="AcceptChangeRoomServlet" method="POST">
                                <input type= "hidden" value="${l.userId1}" name="userId1">
                                <input type= "hidden" value="${l.userId2}" name="userId2">
                                <input type= "hidden" value="${l.changeRoomID}" name="changeRoomID">
                                <button class="button small">Chấp nhận đổi phòng và xóa yêu cầu</button>
                            </form>

                            <form action="DeleteChangeRoomServlet" method="POST">
                                <input type= "hidden" value="${l.changeRoomID}" name="changeRoomID">
                                <button class="button small">Xóa</button>
                            </form>
                          
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <%
            }
        %> 
    </div>
</section>
</div></div>
<%@ include file="/includes/column_left_home.jsp" %> 
<%@ include file="/includes/footer.jsp" %> 