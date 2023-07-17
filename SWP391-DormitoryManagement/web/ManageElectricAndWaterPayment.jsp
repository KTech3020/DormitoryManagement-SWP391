<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/includes/header.jsp" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="numPage" value="${param.numPage}"/>  
<c:set var="pageSize" value="5"/>
<c:if test="${numPage ==null}">
    <c:set var="numPage" value="1"/>   
</c:if>

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
            <h1>QUẢN LÝ THANH TOÁN ĐIỆN NƯỚC</h1>
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
                    <th>Trạng thái</th>
                    <th>Chức năng</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${result}" var="l" begin="${(numPage-1)*pageSize}" end="${(numPage*pageSize)-1}">
                    <tr>
                        <td>${l.semester}</td>
                        <td>${l.oldElectricityIndex}</td>
                        <td>${l.newElectricityIndex}</td>
                        <td>${l.oldWaterIndex}</td>
                        <td>${l.newWaterIndex}</td>                                              
                        <td>${l.status}</td>
                        <td>
                            <a href="UpdateElectricWater?electricWaterUsedID=${l.electricWaterUsedID}">Cập nhật |</a>
                            <a href="DeleteElectricWater?electricWaterUsedID=${l.electricWaterUsedID}"> Xóa</a>
                            
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <div class="paggingmanage">

            <div class="pagging active">
                <a href="ManageElectricAndWaterServlet"><<</a>  
            </div>
            <div class="pagging">
                <a href="ManageElectricAndWaterServlet?numPage=<fmt:formatNumber value="${(numPage!=1)?(numPage-1):1}" type="number" pattern="###"/>  ">Prev</a> 
            </div>
            <div class="pagging">
                ${numPage}  
            </div>
            <div class="pagging">
                <a href="ManageElectricAndWaterServlet?numPage=<fmt:formatNumber value="${(numPage!=lastPage)?(numPage+1):lastPage}" type="number" pattern="###"/> ">Next</a>
            </div>
            <div class="pagging">
                <a href="ManageElectricAndWaterServlet?numPage=${lastPage}">>></a>
            </div> 
        </div>
        <button><a href="addElectricAndWater.jsp">Thêm hóa đơn điện, nước</a></button>
        
        
    </div>
</section>

</div></div>

<%@ include file="/includes/column_left_home.jsp" %> 
<%@ include file="/includes/footer.jsp" %> 