/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.Student;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Paths;

/**
 *
 * @author MSI GL63
 */
@MultipartConfig(
  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
  maxFileSize = 1024 * 1024 * 10,      // 10 MB
  maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class UpdateStudentServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet UpdateStudentServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateStudentServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String num = request.getParameter("num");
        try {
            Model.StudentDB s = new Model.StudentDB();
            Student student = s.getStudentByID(num);
            switch (student.getGender()) {
                case "Male":
                    request.setAttribute("male", "selected");
                    break;
                case "Female":
                    request.setAttribute("female", "selected");
                    break;
                case "LGBT":
                    request.setAttribute("lgbt", "selected");
                    break; 
                default:
                    break;
            }
            request.setAttribute("std", student);           
            request.getRequestDispatcher("update.jsp").forward(request, response);
        } catch (Exception ex) {
            System.out.println("Error: " + ex);
        }
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {  
        String num = request.getParameter("num");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String username = request.getParameter("username");
        String pass = request.getParameter("pass");
        Part filePart = request.getPart("img");
        String realpath = request.getServletContext().getRealPath("/images");
        String img = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        try {
            Model.StudentDB s = new Model.StudentDB();
            if (img.equals("")) {
                Student student = s.getStudentByID(num);
                img = student.getImg();
            }  
            else {
                filePart.write(realpath + "/" + img);
            }
            s.updateStudent(num, name, gender, dob,username,pass, id, img);
            response.sendRedirect("list");
        } catch (Exception ex) {
            System.out.println("Error: " + ex);
        }
    }
    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
