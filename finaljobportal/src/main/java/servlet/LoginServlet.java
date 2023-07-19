/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.RecruiterDAO;
import dao.UserDAO;
import entity.Recruiter;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author KUSH
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String em = request.getParameter("email");
            String ps = request.getParameter("password");
            User u = new User();
            HttpSession session = request.getSession();

            if ("admin@gmail.com".equals(em) && "admin@123".equals(ps)) {
                session.setAttribute("userobj", u);
                u.setRole("admin");
                response.sendRedirect("admin.jsp");
            }else{
                UserDAO dao = new UserDAO(DB.DBConnect.getConn());
                User user = dao.login(em, ps);

                if (user != null) {
                    session.setAttribute("userobj", user);
                    response.sendRedirect("home.jsp");
                } else {
                    session.setAttribute("succMsg", "Invalid Email & Password");
                    response.sendRedirect("login.jsp");
                }
            }
            
                
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
