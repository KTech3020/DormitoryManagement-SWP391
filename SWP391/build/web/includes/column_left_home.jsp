<%@page contentType="text/html" pageEncoding="utf-8" %>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- Sidebar -->
<div id="sidebar">
    <div class="inner">

        <!-- Search -->
        <section id="search" class="alt">
            <form method="post" action="#">
                <input type="text" name="query" id="query" placeholder="Search" />
            </form>
        </section>

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
                <li><a href="services.jsp">Dịch vụ</a></li>
                <li>
                    <span class="opener">Ngành học</span>
                    <ul>
                        <li><a href="#">Công nghệ thông tin</a></li>
                        <li><a href="#">Quản trị kinh doanh</a></li>
                        <li><a href="#">Ngôn ngữ Anh</a></li>
                        <li><a href="#">Ngôn ngữ Nhật</a></li>
                    </ul>
                </li>
                <li><a href="#">Đời sống sinh viên</a></li>
                <li><a href="#">Tuyển sinh</a></li>
                <li><a href="#">Liên hệ</a></li>
                <c:if test="${sessionScope.accountS==null}">
                    <li>
                        <a href="LoginServlet" class="nav-item nav-link">Login</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.accountS!=null}">
                    <li>
                        <a href="">Tài khoản: ${sessionScope.accountS.users}</a>
                        <a href="ManageProfile">Quản lý tài khoản</a>
                        <a href="LogoutServlet">Đăng xuất</a>
                    </li>
                </c:if>    
                <li><a href="list">Danh sách sinh viên</a></li>

            </ul>
        </nav>

        <!-- Section -->
        <section>
            <header class="major">
                <h2>Sự kiện</h2>
            </header>
            <div class="mini-posts">
                <article>
                    <a href="#" class="image"><img src="images/fpt_sukien01.webp" alt="" /></a>
                    <p>Hội thảo và khóa học bảo mật thông tin dành cho sinh viên FPTU Đà Nẵng </p>
                </article>
                <article>
                    <a href="#" class="image"><img src="images/fpt_sukien02.webp" alt="" /></a>
                    <p>Học tập suốt đời – Đại học FPT cấp tài khoản Coursera miễn phí cho cựu sinh viên</p>
                </article>
                <article>
                    <a href="#" class="image"><img src="images/fpt_sukien03.webp" alt="" /></a>
                    <p>Đại học FPT nồng nhiệt chào đón Tập đoàn Jardines Matheson (JM)</p>
                </article>
            </div>
            <ul class="actions">
                <li><a href="#" class="button">More</a></li>
            </ul>
        </section>

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
