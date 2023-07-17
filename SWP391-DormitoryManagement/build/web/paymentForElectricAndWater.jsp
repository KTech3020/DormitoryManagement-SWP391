<%-- 
    Document   : paymentForElectricAndWater
    Created on : Jul 13, 2023, 12:11:59 AM
    Author     : MSI GL63
--%>


<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="context.Config"%>
<%@ page import="entity.ElectricWaterUsed,dao.DormDAO" %>
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
                    <th>Trạng thái</th>
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
                        <td>${l.status}</td>
                        <td>
                            <form action="PaymentForEW" method="post">
                                <input type="hidden" value="${total}" name="amount">
                                <input type="hidden" value="${l.electricWaterUsedID}" name="id">
                                <input type="hidden" value="${sessionScope.accountS.userid}}" name="userID">
                                <button class="button small">Thanh toán</button>
                            </form>    
                        </td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>
        <%
            if (request.getParameterNames().hasMoreElements()){
            //return after payment from VNPAY
            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            String signValue = Config.hashAllFields(fields);
            String[] parts = request.getParameter("vnp_OrderInfo").split("-");
            String userID = parts[0];
            String electricWaterUsedID = parts[1];
            if(signValue.equals(vnp_SecureHash)){
                if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                    DormDAO dao = new DormDAO();
                    dao.updateStatusElectricWater(Integer.parseInt(electricWaterUsedID));%>
                    <script type="text/javascript">
                        window.onload = function() {
                            paymentStatus(1, event);
                            window.location.href = "LoadPaymentElecAndWater";
                        };
                    </script>
                <%   
                }
                else{%>
                    <script type="text/javascript">
                        window.onload = function() {
                            paymentStatus(2, event);
                            window.location.href = "LoadPaymentElecAndWater";
                        };
                    </script>
                <%
                }
            }
            else{%>
                <script type="text/javascript">
                    window.onload = function() {
                        paymentStatus(3, event);
                        window.location.href = "LoadPaymentElecAndWater";
                    };
                </script>                
            <%}}%>
    </div>
</section>

</div></div>

<%@ include file="/includes/column_left_home.jsp" %> 
<%@ include file="/includes/footer.jsp" %> 
<script>    
    function paymentStatus(type,event){
        event.preventDefault();
        if (type === 1)
            alert("Thanh toán thành công!");
        else if (type === 2)
            alert("Thanh toán thất bại!");
        else 
            alert("Danh tính không hợp lệ!");
        return true;
    }
</script>