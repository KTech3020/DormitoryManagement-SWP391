<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/includes/header.jsp" %>



<form action="AddElectricWaterServlet" method ="post" >
    <h1 style="text-align: center; padding-top: 20px">THÊM HÓA ĐƠN ĐIỆN, NƯỚC MỚI CHO SINH VIÊN</h1>
    <table>

        <tr>
            <td>ID Sinh viên</td>
            <td><input type="text" name="studentID" required></td>             
        </tr>

        <tr>
            <td>Số điện cũ</td>
            <td><input type="text" name="oldElectricityIndex" required></td>                
        </tr>
        <tr>
            <td>Số điện mới</td>
            <td><input type="text" name="newElectricityIndex" required></td>                
        </tr>
        <tr>
            <td>Số nước cũ</td>
            <td><input type="text" name="oldWaterIndex" required></td>                
        </tr>
        <tr>
            <td>Số nước mới</td>
            <td><input type="text" name="newWaterIndex" required></td>                
        </tr>
        <div><span style="color: red">${err}</span></div>
        <tr>
            <td><button type = "submit"> Tạo hóa đơn </button></td>
        </tr>

    </table> 
    
</form>
</div></div>

<%@ include file="/includes/column_left_home.jsp" %> 
<%@ include file="/includes/footer.jsp" %> 