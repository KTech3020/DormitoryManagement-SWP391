<%-- 
    Document   : manageListStudent
    Created on : Jun 7, 2023, 5:21:18 PM
    Author     : MSI GL63
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/includes/header.jsp" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<session>
    <head>
        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <!-- Customized Bootstrap Stylesheet -->
        <link href="assets/css/style.css" rel="stylesheet">
    </head>
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
        <div class="table-wrapper">
            <div class="table-title">
                <h2>Danh sách sinh viên</h2>
                <a href="index">Trang chủ</a>
            </div>
            <table class="table table-bordered">
                <thead >
                    <tr style="text-align: center">
                        <th>ID</th>
                        <th>Phòng</th>
                        <th>Họ và tên</th>
                        <th>CMND/ CCCD</th>
                        <th>Giới tính</th>
                        <th>Ngày sinh</th>
                        <th>SĐT</th>
                        <th>Email</th>
                        <th>Địa chỉ</th>
                        <th>Ảnh</th>
                        <th>Chức năng</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${studentArr.personProfileManager}" var="l" begin="${(page-1)*pagesize}" end="${(page*pagesize)-1}" >
                    <tr>
                        <td>${l.idPerson}</td>
                        <td>${l.roomId}</td>
                        <td class="des-css">${l.name}<span>${l.name}</span></td>
                        <td class="des-css">${l.cmnd}<span>${l.cmnd}</span></td>
                        <td>${l.gender}</td>
                        <td>${l.dob}</td>
                        <td class="des-css">${l.phone}<span>${l.phone}</span></td>
                        <td class="des-css">${l.email}<span>${l.email}</span></td>
                        <td class="des-css">${l.address}<span>${l.address}</span></td>
                        <td><img style="width: 100%;" src="images/${l.img}" alt="alt"/></td>
                        <td>
                            <a class="edit" title="Update" href="UpdateServlet?id=${l.idPerson}">Update</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    <div class="paggingmanage">

        <div>
            <a href="listStudent.jsp?index=${1}"><<</a>  
        </div>
        <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
        <div>
            <c:choose>
                <c:when test="${page == 1}"><a href="listStudent.jsp?index=${1}">Prev</a></c:when> 
                <c:otherwise> <a href="listStudent.jsp?index=${page - 1}">Prev</a></c:otherwise>
            </c:choose>
        </div>
        <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
        <div>
            <c:choose>
                <c:when test="${page == lastpage}"><a href="listStudent.jsp?index=${lastpage}">Next</a></c:when> 
                <c:otherwise> <a href="listStudent.jsp?index=${page + 1}">Next</a></c:otherwise>
            </c:choose>   
        </div>
        <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
        <div>
            <a href="listStudent.jsp?index=${lastpage}">>></a>
        </div>
    </div></div></div>
<%@ include file="/includes/column_left_home.jsp" %>
<%@ include file="/includes/footer.jsp" %>

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
        color: #f55d06;
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
        width: 80px;
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
    .des-css span {
        display: none;
        position: absolute;
        color: #fff;
        background: rgba(100,100,100,40);
        padding: 5px;
    }
    .des-css {
        width: 100px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        text-align: justify !important;
    }
    .des-css:hover span {
        display: block;
        overflow: initial;
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


