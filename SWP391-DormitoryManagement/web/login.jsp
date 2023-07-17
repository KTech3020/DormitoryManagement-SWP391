

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/loginlogout.css"/>
        <title>Đăng nhập</title>
    </head>
    <body>
        <div class="login-page">
            <div class="form pag">
                <h1>Đăng nhập</h1>
                <form class="login-form" action="LoginServlet" method="post">
                    <input autofocus type="text" value="${name}" placeholder="Tài khoản" name="username"/>
                    <input type="password" value="${pass}" placeholder="Mật khẩu" name="password"/>
                    <input class="remember" type="checkbox"  name="remember" value="1"><span>Nhớ mật khẩu</span>
                    <br>
                    <span style="color: red">${err}</span>
                    <button>Đăng nhập</button>
                    <p class="message"><a href="register.jsp">Tạo tài khoản |</a><a href="forgotPass.jsp"> | Đổi mật khẩu</a></p>
                </form>
                <a class="home" href="index">Trang chủ</a>
            </div>
        </div>
    </body>
</html>
