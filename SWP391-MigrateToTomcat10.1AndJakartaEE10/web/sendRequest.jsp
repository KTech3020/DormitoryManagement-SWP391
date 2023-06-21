
<%@ include file="/includes/header.jsp" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<section id="banner">
    <div class="content">
        <header>
            <h1>GỬI YÊU CẦU / KHIẾU NẠI</h1>
        </header>

        <form  action ="TypeRequestServlet" method="POST">   
            <div class="row gtr-uniform">
                <div class="col-2 col-12-xsmall"></div>

                <div class="col-4 col-12-xsmall">
                    <label>Chọn loại yêu cầu</label>
                    <select name="option">
                        <option value="changeRoom" ${option.equals("circle")?"selected":""}>Đổi phòng</option>
                        <option value="complain" ${option.equals("square")?"selected":""}>Bảo trì / Khiếu nại</option>
                    </select>
                </div>

                <div class="col-4 col-12-small">
                    <label>Bấm để xác nhận</label>
                    <button type = "submit">Chọn</button>
                </div>
                <div class="col-2 col-12-xsmall"></div><div class="col-2 col-12-xsmall"></div>    

            </div>
        </form>
        <%
            String check = (String)request.getAttribute("option");
        %>            
        <%
               if(check.equals("changeRoom")){
        %> 

        <h2>PHIẾU YÊU CẦU ĐỔI PHÒNG</h2>
        <form  action ="SendChangeRoomServlet" method="POST">   

            <table>
                <tr>
                    <td>Mã số sinh viên</td>
                    <td><input type="text" name="idUser1" value="${profile.idPerson}" readonly></td>             
                </tr>
                <tr>
                    <td>Mã số sinh viên bạn muốn đổi phòng</td>
                    <td><input type="text" name="idUser2" required></td>             
                </tr>

            </table>
                <div class="row gtr-uniform">
                <div class="col-4 col-12-xsmall"></div>
                
                <div><span style="color: red">${error}</span></div>
                </div>
            <button type = "submit">Gửi yêu cầu đổi phòng</button>  
        </form>

        <%
            }
        %> 



    </div>



</section>


</div></div>


<%@ include file="/includes/column_left_home.jsp" %> 
<%@ include file="/includes/footer.jsp" %> 
