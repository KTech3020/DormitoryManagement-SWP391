<%@page contentType="text/html" pageEncoding="utf-8" %>	
<section id="banner">
    <div class="content">
        <header>
            <h1>XÁC NHẬN ĐĂNG KÝ PHÒNG: ${roomID}</h1>
        </header>
        <%if (request.getAttribute("error") !=null){%>
        <div style="color: red">${error}</div>
        <a href="index.jsp"><button>Quay về trang chủ</button></a>
        <%} else {%>
        <form class="dangkiphong" action ="RegisterRoomServlet" method="POST">
            <table>
                <tr>
                    <td>ID phòng</td>
                    <td><input type="text" name="roomID" value="${roomID}" readonly></td>             
                </tr>

                <tr>
                    <td>MSSV</td>
                    <td><input type="text" name="userID" value="<%if (request.getAttribute("success") == null){%>${sessionScope.accountS.userid}<%} %>" readonly></td>             
                </tr>

                <tr>
                    <td>Kì</td>
                    <td><input type="text" name="semester" value="${semester}" readonly></td>             
                </tr>

                <tr>
                    <td>Phí cần trả</td>
                    <td><input type="text" name="price" value="${price}" readonly></td>             
                </tr>
                <%if (request.getAttribute("success") !=null){%>
            </table>
        </form> 
        <form action="index.jsp">
            <table>
                <tr>
                    <td><button>Quay về trang chủ</button></td>
                    <td><span style="color: green">${success}</span></td>
                </tr>
            </table>
        </form>
        <%} else {%>
        <tr>
            <td><button type = "submit">Xác nhận đăng ký</button></td>
        </tr>
        <%} %>
        </table>
        </form>
        <%} %>
    </div>
</section>
</div>
</div>

