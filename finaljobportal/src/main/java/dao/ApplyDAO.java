/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.ApplyJobs;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author KUSH
 */
public class ApplyDAO {
    
    private Connection conn;

    public ApplyDAO(Connection conn) {
        super();
        this.conn = conn;
    }
    
    public boolean applyjobs(ApplyJobs j){
        
        boolean f = false;
        try{
            String sql = "insert into jobapply(name,qualification,mobileno,skills,experience,curr_job,Notice_period,Message,resume) values(?,?,?,?,?,?,?,?,?)";
            
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,j.getName());
            ps.setString(2,j.getQualification());
            ps.setString(3,j.getMobileno());
            ps.setString(4,j.getSkills());
            ps.setString(5,j.getExperience());
            ps.setString(6,j.getCurr_job());
            ps.setString(7,j.getNotice_period());
            ps.setString(8,j.getMessage());
            ps.setString(9,j.getResume());
            
            int i = ps.executeUpdate();
            
            if(i==1){
                f = true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    public List<ApplyJobs> getAllJobApplication(){
        List<ApplyJobs> list = new ArrayList<ApplyJobs>();
        
        ApplyJobs aj = null;
//        int RE_ID =(int) session.getAttribute("recru_id");
        try {
            String sql = "select *from jobapply order by appid desc";
            
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                aj = new ApplyJobs();
                aj.setAppid(rs.getInt(1));
                aj.setName(rs.getString(2));
                aj.setQualification(rs.getString(3));
                aj.setMobileno(rs.getString(4));
                aj.setSkills(rs.getString(5));
                aj.setExperience(rs.getString(6));
                aj.setCurr_job(rs.getString(7));
                aj.setNotice_period(rs.getString(8));
                aj.setMessage(rs.getString(9));
                aj.setResume(rs.getString(10));

                list.add(aj);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}


//select u.name,u.email,u.qualification,u.resume from jobapply ja join recruiter re using(rid) join jobs job using(jid) join user u using(id) where ja.rid="+RE_ID"