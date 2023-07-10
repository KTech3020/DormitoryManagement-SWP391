/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dao.DormDAO;
import entity.Account;
import entity.Person;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;

/**
 *
 * @author LENOVO
 */
public class SendChangeRoomServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SendChangeRoomServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendChangeRoomServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DormDAO dao = new DormDAO();
        String idUser1 = request.getParameter("idUser1");
        String idUser2 = request.getParameter("idUser2");
        String option = "changeRoom";
        Person person1 = dao.getPersonProfile(idUser1);
        Person person2 = dao.getPersonProfile(idUser2);
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("accountS");

        Person p = dao.checkIdPersonExist(idUser2);
        LocalDateTime dateIn4Months = LocalDateTime.now().plusMonths(4);
        int month = dateIn4Months.getMonth().getValue();
        String semester = "";
        if (month >= 1 && month <= 4) {
            semester = semester.concat("SP");
        } else if (month >= 5 && month <= 8) {
            semester = semester.concat("SU");
        } else if (month >= 9 && month <= 12) {
            semester = semester.concat("FA");
        }

        String year = Integer.toString(dateIn4Months.getYear());
        year = year.substring(year.length() - 2);
        semester = semester.concat(year);

        if (p == null) {
            request.setAttribute("profile", dao.getPersonProfile(account.getUserid()));
            request.setAttribute("error", "Bạn không thể đổi phòng này! Lý do: Sinh viên không tồn tại.");
            request.setAttribute("option", option);
            request.getRequestDispatcher("sendRequest.jsp").forward(request, response);
        } else if (p.getIdPerson().equals(account.getUserid())) {
            request.setAttribute("profile", dao.getPersonProfile(account.getUserid()));
            request.setAttribute("error", "Bạn không thể đổi phòng này! Lý do: Bạn không thể dổi phòng với chính mình!");
            request.setAttribute("option", option);
            request.getRequestDispatcher("sendRequest.jsp").forward(request, response);
        } else if (p.getIdPerson().contains("MA")) {
            request.setAttribute("profile", dao.getPersonProfile(account.getUserid()));
            request.setAttribute("error", "Bạn không thể đổi phòng này! Lý do: Bạn không thể dổi phòng với quản lý!");
            request.setAttribute("option", option);
            request.getRequestDispatcher("sendRequest.jsp").forward(request, response);
        } else if (dao.checkStudentAlreadyRegisteredRoom(idUser2, semester)) {
            request.setAttribute("profile", dao.getPersonProfile(account.getUserid()));
            request.setAttribute("error", "Bạn không thể đổi phòng này! Lý do: Sinh viên chưa đăng ký phòng kỳ này.");
            request.setAttribute("option", option);
            request.getRequestDispatcher("sendRequest.jsp").forward(request, response);
        } else if (person1.getGender().equals(person2.getGender())) {
            LocalDateTime currentDate = LocalDateTime.now();
            dao.createChangeRoomRequest(idUser1, idUser2, currentDate);
            request.setAttribute("profile", dao.getPersonProfile(account.getUserid()));
            request.setAttribute("error", "Bạn đã gửi yêu cầu đổi phòng thành công.");
            request.setAttribute("option", option);
            request.getRequestDispatcher("sendRequest.jsp").forward(request, response);
        } else {
            request.setAttribute("profile", dao.getPersonProfile(account.getUserid()));
            request.setAttribute("error", "Bạn không thể đổi phòng này! Lý do: Giới tính sinh viên không trùng khớp.");
            request.setAttribute("option", option);
            request.getRequestDispatcher("sendRequest.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
