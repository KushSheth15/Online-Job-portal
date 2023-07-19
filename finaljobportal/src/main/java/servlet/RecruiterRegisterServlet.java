/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet;

import dao.RecruiterDAO;
import entity.Recruiter;
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

@WebServlet("/add_recruiter")
public class RecruiterRegisterServlet extends HttpServlet{
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String cname = req.getParameter("cname");
            String rname = req.getParameter("rname");
            String address = req.getParameter("address");
            String mobile = req.getParameter("mobileno");
            String email = req.getParameter("email");
            String password = req.getParameter("ps");            
            String city = req.getParameter("city");
            String state = req.getParameter("state");

            RecruiterDAO dao = new RecruiterDAO(DB.DBConnect.getConn());

            Recruiter u = new Recruiter(cname, rname, address, mobile, email, password, city, state,"recruiter");
            boolean f = dao.register(u);
            
            HttpSession session = req.getSession();
            if (f) {
                session.setAttribute("succMsg", "Registration Successfully");
                resp.sendRedirect("register.jsp");
            } else {
                session.setAttribute("succMsg", "Something went wrong..");
                resp.sendRedirect("register.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
