/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet;

import dao.ApplyDAO;
import entity.ApplyJobs;
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

@WebServlet("/apply_job")
public class ApplyJobServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            String name = request.getParameter("name");
            String qualification = request.getParameter("qual");
            String mobileno = request.getParameter("mobile");
            String skills = request.getParameter("skills");
            String experience = request.getParameter("exp");
            String currjob = request.getParameter("currjob");
            String notice = request.getParameter("notice");
            String message = request.getParameter("message");
            String resume = request.getParameter("resume");
            
            ApplyJobs aj = new ApplyJobs();
            aj.setName(name);
            aj.setQualification(qualification);
            aj.setMobileno(mobileno);
            aj.setSkills(skills);
            aj.setExperience(experience);
            aj.setCurr_job(currjob);
            aj.setNotice_period(notice);
            aj.setMessage(message);
            aj.setResume(resume);
            
            HttpSession session = request.getSession();
            ApplyDAO dao = new ApplyDAO(DB.DBConnect.getConn());
            boolean f = dao.applyjobs(aj);
            if(f){
                session.setAttribute("succMsg", "Applied Successfully..");
                response.sendRedirect("apply_jobs.jsp");
            }else{
                  session.setAttribute("succMsg", "Something went wrong..");
                response.sendRedirect("apply_jobs.jsp");
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }

}
