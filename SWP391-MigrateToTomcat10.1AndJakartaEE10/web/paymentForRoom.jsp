<%-- 
    Document   : paymentForRoom
    Created on : Jun 19, 2023, 11:08:07 PM
    Author     : MSI GL63
--%>
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
<%@ page import="java.util.ArrayList,java.time.format.DateTimeFormatter,entity.RoomRegistration,dao.DormDAO" %>

<c:set var="numPage" value="${param.numPage}"/>  
<c:set var="pageSize" value="10"/>
<c:if test="${numPage ==null}">
    <c:set var="numPage" value="1"/>   
</c:if>

<section id="banner">
    <div class="content">
        <header>
            <h1>THANH TOÁN TIỀN PHÒNG</h1>
        </header>
        <div>
        <%if (request.getAttribute("err") !=null){%>
        <span style="color: red">${err}</span>
        <%} else if (request.getAttribute("registersList") !=null){%>
        <table style="margin-top: 50px">
            <tr>
                <th>ID</th>
                <th>ID phòng</th>
                <th>MSSV</th>
                <th>Thời gian đăng ký</th>
                <th>Đăng ký cho kì</th>
                <th>Trạng thái đăng ký</th>
                <th>Mức giá</th>
                <th>Thanh toán</th>
            </tr>

            <%ArrayList registersList = (ArrayList)request.getAttribute("registersList"); 
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            for (Object o : registersList){RoomRegistration room =(RoomRegistration) o;%>
            <tr>
                <td><%= room.getRegisterID() %></td>
                <td><%= room.getRoomID() %></td>
                <td><%= room.getUserID() %></td>
                <td><%= room.getRegistrationTime().format(formatter) %></td>
                <td><%= room.getSemester() %></td>
                <td><%= room.getStatus() %></td>
                <td><%= room.getPriceAtTheTime() %></td>
                <td>
                        <form action="PaymentServlet" method="post">
                            <input type= "hidden" value="<%= room.getRegisterID() %>" name="orderID">
                            <input type= "hidden" value="<%= room.getUserID() %>" name="userID">
                            <input type= "hidden" value="<%= room.getPriceAtTheTime() %>" name="amount">
                            <button class="button small">Thanh toán</button>
                        </form>
                </td>
            </tr>
            <%}%>
        </table>
        <%} %>  
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
            String reRoomID = parts[1];
            if(signValue.equals(vnp_SecureHash)){
                if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                    DormDAO dao = new DormDAO();
                    dao.paymentSuccess(Integer.parseInt(reRoomID));
                    request.setAttribute("userID", userID);%>
                    <script type="text/javascript">
                        window.onload = function() {
                            paymentStatus(1, event);
                            window.location.href = "LoadPaymentRegistered?userID=<%= userID %>";
                        };
                    </script>
                <%   
                }
                else{%>
                    <script type="text/javascript">
                        window.onload = function() {
                            paymentStatus(2, event);
                            window.location.href = "LoadPaymentRegistered?userID=<%= userID %>";
                        };
                    </script>
                <%
                }
            }
            else{%>
                <script type="text/javascript">
                    window.onload = function() {
                        paymentStatus(3, event);
                        window.location.href = "LoadPaymentRegistered?userID=<%= userID %>";
                    };
                </script>                
            <%}}%>
        </div>
        
        <div class="paggingmanage">

            <div class="pagging active">
                <a href="paymentForRoom.jsp"><<</a>  
            </div>
            <div class="pagging">
                <a href="paymentForRoom.jsp?numPage=<fmt:formatNumber value="${(numPage!=1)?(numPage-1):1}" type="number" pattern="###"/>  ">Prev</a> 
            </div>
            <div class="pagging">
                ${numPage}  
            </div>
            <div class="pagging">
                <a href="paymentForRoom.jsp?numPage=<fmt:formatNumber value="${(numPage!=lastPage)?(numPage+1):lastPage}" type="number" pattern="###"/> ">Next</a>
            </div>
            <div class="pagging">
                <a href="paymentForRoom.jsp?numPage=${lastPage}">>></a>
            </div>
        </div>
            
        <button><a href="index.jsp" class="nav-item nav-link">Về trang chủ</a></button>
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