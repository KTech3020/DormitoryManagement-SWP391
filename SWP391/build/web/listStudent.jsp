<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">


        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="assets/css/style.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="student" class="entity.Person"/>
        <jsp:useBean id="studentArr" class="dao.DormDAO"/>
        <c:choose>
            <c:when test="${param.index == null}">
                <c:set var="page" value="1"/>
            </c:when>
            <c:otherwise>
                <c:set var="page" value="${param.index}"/>
            </c:otherwise>
        </c:choose> 
        <c:set var="pagesize" value="${5}"/>
        <c:set var="listsize" value="${studentArr.personProfileManager.size()}"/>
        <fmt:formatNumber var="lastpage" value="${listsize div pagesize}"/>
        <style>
            body {
                color: #404E67;
                background: #F5F7FA;
                font-family: 'Open Sans', sans-serif;
            }

            .table-wrapper {
                width: 100%;
                margin: 30px auto;
                background: #fff;
                padding: 20px;
                box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
            }

            .table-title {
                padding-bottom: 10px;
                margin: 0 0 10px;
            }

            .table-title h2 {
                margin: 6px 0 0;
                font-size: 22px;
            }

            .table-title .add-new {
                float: right;
                height: 30px;
                font-weight: bold;
                font-size: 12px;
                text-shadow: none;
                min-width: 100px;
                border-radius: 50px;
                line-height: 13px;
            }

            .table-title .add-new i {
                margin-right: 4px;
            }

            table.table {
                table-layout: fixed;
            }

            table.table tr th,
            table.table tr td {
                border-color: #e9e9e9;
            }

            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }

            table.table th:last-child {
                width: 100px;
            }

            table.table td a {
                cursor: pointer;
                display: inline-block;
                margin: 0 5px;
                min-width: 24px;
            }

            table.table td a.add {
                color: #f55d06;
            }

            table.table td a.edit {
                color: #FFC107;
            }

            table.table td a.delete {
                color: #E34724;
            }

            table.table td i {
                font-size: 19px;
            }

            table.table td a.add i {
                font-size: 24px;
                margin-right: -1px;
                position: relative;
                top: 3px;
            }

            table.table .form-control {
                height: 32px;
                line-height: 32px;
                box-shadow: none;
                border-radius: 2px;
            }

            table.table .form-control.error {
                border-color: #f50000;
            }

            table.table td .add {
                display: none;
            }
            .des-css {
                width: 100px;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                text-align: justify !important;

            }
            .pagging{
                font-size: 19px;
                padding: 10px;
                background-color: #e9e9e9;
                margin: 0px -24px;
                width: 9%;
                text-align: center;
                border-radius: 20px;
            }
            .paggingmanage{
                display: flex;
                justify-content: center;
                align-items: center;


            }

            b{
                background-color: #f55d06;
                color:#000;
            }
            .divpagging{
                border: 1px solid #ccc;
                border-radius: 10px;
                background-color: #ccc;
            }

            .pagging a {
                text-decoration: none;
                color:#000;
                font-family:Cursive;
            }
            .iconadd{
                color: #000;
                font-weight: bold;
                font-family: Cursive;
                text-decoration: none;
                font-size: 20px;
            }
        </style>
        <div class="container-lg">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-8">
                                <h2>Danh sách <b>Sinh viên</b></h2>
                                <a href="index.jsp">Trang chủ</a>
                            </div>
                        </div>
                    </div>
                    <table class="table table-bordered" style="text-align: ">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>ID Phòng ở</th>
                                <th>Họ và tên</th>
                                <th>CMND</th>
                                <th>Giới tính</th>
                                <th>Ngày sinh</th>
                                <th>SĐT</th>
                                <th>Email</th>
                                <th>Địa chỉ</th>
                                <th>Image</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${studentArr.personProfileManager}" var="l" begin="${(page-1)*pagesize}" end="${(page*pagesize)-1}" >
                                <tr>
                                    <th>${l.idPerson}</th>
                                    <td>${l.roomId}</td>
                                    <td class="des-css">${l.name}</td>
                                    <td class="des-css">${l.cmnd}</td>
                                    <td>${l.gender}</td>
                                    <td>${l.dob}</td>
                                    <td class="des-css">${l.phone}</td>
                                    <td class="des-css">${l.email}</td>
                                    <td class="des-css">${l.address}</td>
                                    <td><img style="width: 100%;" src="${l.img}" alt="alt"/></td>
                                    <td>

                                        <a class="edit" title="Edit" data-toggle="tooltip" href="updateServlet?id=${l.idPerson}"><i class="material-icons">&#xE254;</i></a>

                                    </td>
                                </tr>
                            </c:forEach>

                        </tbody>


                    </table>
                </div>
            </div>
        </div>
        <div class="paggingmanage">

            <div class="pagging active">
                <a href="listStudent.jsp?index=${1}"><<</a>  
            </div>
            <div class="pagging">
                <c:choose>
                    <c:when test="${page == 1}"><a href="listStudent.jsp?index=${1}">Prev</a></c:when> 
                    <c:otherwise> <a href="listStudent.jsp?index=${page - 1}">Prev</a></c:otherwise>
                </c:choose>
            </div>
            <div class="pagging">
                <c:choose>
                    <c:when test="${page == lastpage}"><a href="listStudent.jsp?index=${lastpage}">Next</a></c:when> 
                    <c:otherwise> <a href="listStudent.jsp?index=${page + 1}">Next</a></c:otherwise>
                </c:choose>   
            </div>
            <div class="pagging">
                <a href="listStudent.jsp?index=${lastpage}">>></a>
            </div>
        </div>

    </body>
</html>

