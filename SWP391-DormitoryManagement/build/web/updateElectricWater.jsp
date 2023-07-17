<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/includes/header.jsp" %>



<form action="UpdateElectricWater" method ="post" >
    <h1 style="text-align: center; padding-top: 20px">CẬP NHẬT ĐIỆN, NƯỚC</h1>
    <table>
        <tr>
            <td>ID</td>
            <td><input type="text" name="electricWaterUsedID" value="${electricWaterUsed.electricWaterUsedID}" readonly></td>             
        </tr>

        <tr>
            <td>Kỳ</td>
            <td><input type="text" name="semester" value="${electricWaterUsed.semester}" readonly></td>              
        </tr>

        <tr>
            <td>Số điện kỳ trước</td>
            <td><input type="text" name="oldElectricityIndex" value="${electricWaterUsed.oldElectricityIndex}" readonly></td>             
        </tr>

        <tr>
            <td>Số điện kỳ này</td>
            <td><input type="text" name="newElectricityIndex" value="${electricWaterUsed.newElectricityIndex}" required></td>             
        </tr>
        <tr>
            <td>Số nước kỳ trước</td>
            <td><input type="text" name="oldWaterIndex" value="${electricWaterUsed.oldWaterIndex}" readonly></td>             
        </tr>
        <tr>
            <td>Số nước kỳ này</td>
            <td><input type="text" name="newWaterIndex" value="${electricWaterUsed.newWaterIndex}" required></td>             
        </tr>
        <tr>
            <td><button type = "submit"> Cập nhật </button></td>
        </tr>
    </table> 

</form>
</div></div>

<%@ include file="/includes/column_left_home.jsp" %> 
<%@ include file="/includes/footer.jsp" %> 