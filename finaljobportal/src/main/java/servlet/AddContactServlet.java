/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet;
import dao.ContactDAO;
import entity.ContactUs;
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

@WebServlet("/contact_us")
public class AddContactServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phoneno = request.getParameter("phone");
            String message = request.getParameter("desc");
            
            ContactUs c = new ContactUs();
            c.setName(name);
            c.setEmail(email);
            c.setPhoneno(phoneno);
            c.setMessage(message);
            
            HttpSession session = request.getSession();
            ContactDAO dao = new ContactDAO(DB.DBConnect.getConn());
            boolean f = dao.addContact(c);
            if(f){
                session.setAttribute("succMsg", "Feedback sent Successfully..");
                response.sendRedirect("contactus.jsp");
            }else{
                  session.setAttribute("succMsg", "Something went wrong..");
                response.sendRedirect("contactus.jsp");
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }

}