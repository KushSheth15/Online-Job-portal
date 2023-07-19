/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet;

import dao.JobDAO;
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

@WebServlet("/delete")
public class DeleteJobServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("jid"));
            
            JobDAO dao = new JobDAO(DB.DBConnect.getConn());
            boolean f = dao.deleteJobs(id);
            
            HttpSession session = req.getSession();
    
            if(f){
                session.setAttribute("succMsg", "Job Deleted Successfully..");
                resp.sendRedirect("view_jobs.jsp");
            }else{
                  session.setAttribute("succMsg", "Something went wrong..");
                resp.sendRedirect("view_jobs.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
}
