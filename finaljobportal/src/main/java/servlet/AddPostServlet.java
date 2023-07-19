/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.JobDAO;
import entity.Jobs;
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

@WebServlet("/add_job")
public class AddPostServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            String title = request.getParameter("title");
            String cname = request.getParameter("cname");
            String description = request.getParameter("desc");
            String category = request.getParameter("category");
            String location = request.getParameter("location");
            String salary = request.getParameter("salary");
            String experience = request.getParameter("experience");
            String status = request.getParameter("status");
            String website = request.getParameter("weblink");
            
            Jobs j = new Jobs();
            j.setTitle(title);
            j.setCname(cname);
            j.setDescription(description);
            j.setCategory(category);
            j.setLocation(location);
            j.setSalary(salary);
            j.setExperience(experience);
            j.setStatus(status);
            j.setWebsite(website);
            
            HttpSession session = request.getSession();
            JobDAO dao = new JobDAO(DB.DBConnect.getConn());
            boolean f = dao.addJobs(j);
            if(f){
                session.setAttribute("succMsg", "Job Post Successfully..");
                response.sendRedirect("add_job.jsp");
            }else{
                  session.setAttribute("succMsg", "Something went wrong..");
                response.sendRedirect("add_job.jsp");
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }

}
