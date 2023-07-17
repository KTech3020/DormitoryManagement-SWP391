

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/loginlogout.css"/>
        <title>Đăng ký</title>
    </head>
    <body>

        <div class="login-page">
            <div class="form bt">
                <form class="login-form" action="RegisterServlet" method="post">
                    <h1>Đăng ký</h1>
                    <input type="text" placeholder="Mã số sinh viên" name="username" />
                    <input type="password" placeholder="Mật khẩu" name="password" />
                    <input type="password" placeholder="Nhập lại mật khẩu" name="repassword" />
                    <br>
                    <span style="color: red">${err}</span>
                    <button type="submit">Đăng ký</button>
                    <p class="message"><a href="LoginServlet">Đăng nhập</a></p>
                </form>
            </div>
        </div>
    </body>
</html>
