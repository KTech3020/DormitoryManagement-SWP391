/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dao.DormDAO;
import entity.Account;
import entity.Person;
import entity.Room;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import context.SendMailContext;
/**
 *
 * @author HP
 */
public class RegisterRoomServlet extends HttpServlet {

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
            out.println("<title>Servlet RegisterRoomServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterRoomServlet at " + request.getContextPath() + "</h1>");
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

        DormDAO dao = new DormDAO();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("accountS");
        Person person = dao.getPersonProfile(account.getUserid());
        Room room = dao.getRoomById(Integer.parseInt(request.getParameter("roomID")));
        if (person.getGender().equals(room.getGender())) {

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
            request.setAttribute("roomID", request.getParameter("roomID"));
            request.setAttribute("price", request.getParameter("price"));
            request.setAttribute("semester", semester);
            request.getRequestDispatcher("registerRoom.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Bạn không thể đăng ký phòng này! Lý do: Giới tính không trùng với giới tính phòng.");
            request.getRequestDispatcher("registerRoom.jsp").forward(request, response);
        }
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
        String userID = request.getParameter("userID");
        String roomID = request.getParameter("roomID");
        DormDAO dao = new DormDAO();
        LocalDateTime currentDate = LocalDateTime.now();
        String semester = request.getParameter("semester");        
        dao.createRegisterRoomRequest(roomID, userID, currentDate, semester);
        SendMailContext send = new SendMailContext();
        send.sendMailToStudentRegister(dao.getPersonProfile(userID));
        request.getRequestDispatcher("StudentViewRegistrationServlet").forward(request, response);
        
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
