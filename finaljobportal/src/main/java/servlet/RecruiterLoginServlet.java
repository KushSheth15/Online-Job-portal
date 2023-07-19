/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet;

import dao.RecruiterDAO;
import entity.Recruiter;
import entity.User;
import java.io.IOException;
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

@WebServlet("/recruiterlogin")
public class RecruiterLoginServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try {
            String em = req.getParameter("email");
            String ps = req.getParameter("password");
            
            HttpSession session = req.getSession();


                RecruiterDAO dao = new RecruiterDAO(DB.DBConnect.getConn());
                Recruiter recruiter = dao.login(em, ps);

                if (recruiter != null) {
                    session.setAttribute("recobj", recruiter);
                    resp.sendRedirect("recruiter_index.jsp");
                } else {
                    session.setAttribute("succMsg", "Invalid Email & Password");
                    resp.sendRedirect("recruiter_login.jsp");
                }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
}
