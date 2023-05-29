<%@page contentType="text/html" pageEncoding="utf-8" %>	

<!-- Sidebar -->
<div id="sidebar">
    <div class="inner">
        <!-- Menu -->
        <nav id="menu">
            <header class="major">
                <h2>Menu</h2>
            </header>
            <style>
                ul.navigation-menu>li>div{
                    display: none;
                }
                ul.navigation-menu>li:hover>div{
                    display: block;
                }
            </style>
            <ul class="navigation-menu">
                <li><a href="index.jsp">Trang chủ</a></li>
                <li><a href="rules.jsp">Nội quy KTX</a></li>              
                    <c:if test="${sessionScope.accountS==null}">
                    <li>
                        <a href="LoginServlet" class="nav-item nav-link">Login</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.accountS.isAdmin==0}">
                    <li>
                        <a href="RoomSearchServlet" class="nav-item nav-link">Xem và tìm kiếm phòng</a>
                    </li>
                    <li>
                        <a href="#" class="nav-item nav-link">Quản lí hóa đơn</a>
                    </li>
                    <li>
                        <a href="#" class="nav-item nav-link">Gửi yêu cầu/khiếu nại</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.accountS.isAdmin==1}">
                    <li>
                        <a href="#" class="nav-item nav-link">Quản lí thông báo</a>
                    </li>
                    <li>
                        <a href="listStudent.jsp" class="nav-item nav-link">Quản lí sinh viên</a>
                    </li>
                    <li>
                        <a href="#" class="nav-item nav-link">Quản lí phòng ở</a>
                    </li>
                    <li>
                        <a href="#" class="nav-item nav-link">Quản lí hóa đơn</a>
                    </li>
                    <li>
                        <a href="#" class="nav-item nav-link">Xem yêu cầu, khiếu nại</a>
                    </li>
                    <li>
                        <a href="#" class="nav-item nav-link">Thống kê</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.accountS!=null}">
                    <li>
                        <a href="">Tài khoản: ${sessionScope.accountS.users}</a>
                        <a href="ManageProfile">Quản lý tài khoản</a>
                        <a href="LogoutServlet">Đăng xuất</a>
                    </li>
                </c:if>    


            </ul>
        </nav>

        <!-- Section -->
        <section>
            <header class="major">
                <h2>Liên hệ</h2>
            </header>
            <!--<p>Sed varius enim .</p>-->
            <ul class="contact">
                <li class="icon solid fa-envelope"><a href="#">dnuni@fe.edu.vn</a></li>
                <li class="icon solid fa-phone">(0236) 730 0999</li>
                <li class="icon solid fa-home">Khu Đô Thị FPT Đà Nẵng,<br /> P. Hòa Hải, Q.Ngũ Hành Sơn, TP Đà Nẵng</li>
            </ul>
        </section>
