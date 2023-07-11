<%-- 
    Document   : forgotPass
    Created on : May 23, 2023, 7:18:28 PM
    Author     : LENOVO
--%>
<%@ page import="entity.Account" %>
<%
    Account account = (Account) session.getAttribute("accountS");
    if (account != null){
        response.sendRedirect("/SWP391-MigrateToTomcat10.1AndJakartaEE10/index");
    } else { %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/loginlogout.css"/>
        <title>Đổi mật khẩu</title>
    </head>
    <body>
        <div class="login-page">
            <div class="form pag">
                <h1>Đổi mật khẩu</h1>
                <form class="login-form" action="ChangePasswordServlet" method="post">
                    <input type="text" value="${name}" placeholder="Tài khoản" name="username"/>
                    <input type="password" value="${pass}" placeholder="Mật khẩu cũ" name="oldpassword"/>
                    <input type="password" placeholder="Nhập mật khẩu mới" name="newpassword" />
                    <input type="password" placeholder="Xác nhận mật khẩu mới" name="renewpassword" />
                    <br>
                    <span style="color: red">${err}</span>
                    <button>Xác nhận</button>

                </form>
                <a class="home" href="index">Trang chủ</a>
            </div>
        </div>
    </body>
</html>
<%}%>