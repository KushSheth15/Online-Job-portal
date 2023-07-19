/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet;

import dao.UserDAO;
import entity.User;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author KUSH
 */
@WebServlet("/add_user")
@MultipartConfig
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String name = req.getParameter("name");
            String email = req.getParameter("em");
            String password = req.getParameter("ps");
            String mobile = req.getParameter("mobileno");
//            Part p = req.getPart("resume");
//            String filename = p.getSubmittedFileName();
//            
//            String path = getServletContext().getRealPath("")+"pdfs";
//            
//            File file = new File(path);
//            p.write(path + File.separator+filename);
//            System.out.println(path);
            
            UserDAO dao = new UserDAO(DB.DBConnect.getConn());

            User u = new User(name, email, password, mobile, "User");
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
