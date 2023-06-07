<%-- 
    Document   : updateStudent
    Created on : May 24, 2023, 8:57:06 PM
    Author     : MSI GL63
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="assets/css/manager.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Cập nhật thông tin <b>sinh viên</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="UpdateServlet" method="post" enctype="multipart/form-data">
                            <div class="modal-header">						
                                <h4 class="modal-title"></h4>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>ID</label>
                                    <input value="${person.idPerson}" name="idPerson" type="text" class="form-control" readonly>
                                </div>
                                <div class="form-group">
                                    <label>ID Phòng ở</label>
                                    <input value="${person.roomId}" name="roomId" type="text" class="form-control" readonly>
                                </div>
                                <div class="form-group">
                                    <label>Họ và tên</label>
                                    <input value="${person.name}" name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>CMND</label>
                                    <input value="${person.cmnd}" name="cmnd" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Giới tính</label>
                                    <c:choose>
                                        <c:when test="${person.gender==M}">
                                            <input value="${person.gender}" name="gender" type="text" class="form-control" required>
                                        </c:when>
                                        <c:otherwise>
                                            <input value="${person.gender}" name="gender" type="text" class="form-control" required>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="form-group">
                                    <label>Ngày sinh</label>
                                    <input value="${person.dob}" name="dob" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Điện thoại</label>
                                    <input value="${person.phone}" name="phone" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input value="${person.email}" name="email" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Địa chỉ</label>
                                    <input value="${person.address}" name="address" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Image</label> <br>
                                    <img style="width: 370px; height: 370px;" src="images/${person.img}">
                                    <input name="image" type="file" value="" class="form-control">
                                </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="Cập Nhật">
                                <a href="listStudent.jsp" class="btn btn-success" style = "background-color: white; color: black">Trở lại danh sách sinh viên</a>	
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>


        <script src="assets/js/manager.js" type="text/javascript"></script>
    </body>
</html>
