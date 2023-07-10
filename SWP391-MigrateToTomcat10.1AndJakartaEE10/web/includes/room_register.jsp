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
                <tr>
                    <td><button onclick="showPopup()" type = "submit">Xác nhận đăng ký</button></td>
                </tr>
            </table>
        </form>
    </div>
    <%if (request.getAttribute("error") !=null){%>
    <script>
            window.alert("${error}");
    </script>
    <%}%>
    <%if (request.getAttribute("success") !=null){%>
    <script>
            window.alert("${success}");
    </script>
    <%}%>
    <script>
        function showPopup(){
            window.alert("Đăng ký thành công!");
        }
    </script>
</section>
</div>
</div>

