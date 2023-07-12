<%-- 
    Document   : paymentForElectricAndWater
    Created on : Jul 12, 2023, 5:51:03 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/includes/header.jsp" %>



<style>
    .paggingmanage{
        display: flex;
        justify-content: center;
        align-items: center;


    }

    .pagging{
        font-size: 19px;
        padding: 10px;

        margin: 0px -24px;
        width: 9%;
        text-align: center;
        border-radius: 20px;
    }
</style>
<section id="banner">
    <div class="content">
        <header  style="text-align: center;">
            <h1>THANH TOÁN ĐIỆN NƯỚC</h1>
        </header>
        <span style="color: red">${err}</span>
        <table style="margin-top: 50px">

            <thead>
                <tr>
                    <th>Kỳ</th>
                    <th>Số điện cũ</th>
                    <th>Số điện đã dùng</th>
                    <th>Số nước cũ</th>
                    <th>Số nước đã dùng</th>
                    <th>Tổng tiền</th>
                    <th>Chức năng</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${result}" var="l">
                    <tr>
                        <td>${l.semester}</td>
                        <td>${l.oldElectricityIndex}</td>
                        <td>${l.newElectricityIndex}</td>
                        <td>${l.oldWaterIndex}</td>
                        <td>${l.newWaterIndex}</td>
                        <td>${total}</td>
                        <td>
                            <a href="#">Thanh toán</a>
                        </td>
                    </tr>
                </c:forEach>

            </tbody>

        </table>
    </div>
</section>

</div></div>

<%@ include file="/includes/column_left_home.jsp" %> 
<%@ include file="/includes/footer.jsp" %> 