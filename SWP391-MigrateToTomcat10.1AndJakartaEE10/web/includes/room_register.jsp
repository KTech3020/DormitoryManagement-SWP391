<%@page contentType="text/html" pageEncoding="utf-8" %>	
<section id="banner">
    <div class="content">
        <header>
            <h1>XÁC NHẬN ĐĂNG KÝ PHÒNG: ${roomID}</h1>
        </header>
        <form class="dangkiphong" action ="RegisterRoomServlet" method="POST">
            <table>
                <tr>
                    <td>ID phòng</td>
                    <td><input type="text" name="roomID" value="${roomID}" readonly></td>             
                </tr>

                <tr>
                    <td>MSSV</td>
                    <td><input type="text" name="user" value="${sessionScope.accountS.userid}" readonly></td>             
                </tr>

                <tr>
                    <td>Kì</td>
                    <td><input type="text" name="semester" value="${semester}" readonly></td>             
                </tr>

                <tr>
                    <td>Phí cần trả</td>
                    <td><input type="text" name="price" value="${price}" readonly></td>             
                </tr>
                <tr>
                    <td><button type = "submit">Xác nhận đăng ký</button></td>
                </tr>
            </table>
        </form>        
    </div>
</section>
</div>
</div>

