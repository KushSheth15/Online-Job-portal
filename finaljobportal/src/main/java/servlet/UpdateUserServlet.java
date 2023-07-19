/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet;

import dao.UserDAO;
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
@WebServlet("/update_profile")
public class UpdateUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String ps = req.getParameter("ps");
            String mobile = req.getParameter("mobile");
            

            UserDAO dao = new UserDAO(DB.DBConnect.getConn());

            User u = new User();
            u.setId(id);
            u.setName(name);
            u.setEmail(email);
            u.setPassword(ps);
            u.setMobileno(mobile);
            
            
            boolean f = dao.updateUser(u);
            HttpSession session = req.getSession();

            if (f) {
                session.setAttribute("succMsg", "Profile Update Sucessfully");
                resp.sendRedirect("home.jsp");
            } else {
                session.setAttribute("succMsg", "Something wrong on server");
                resp.sendRedirect("home.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
