/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Jobs;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;

/**
 *
 * @author KUSH
 */
public class JobDAO {

    private Connection conn;

    public JobDAO(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean addJobs(Jobs j) {

        boolean f = false;
        try {
            String sql = "insert into jobs(title,cname,description,category,location,salary,experience,status,website) values(?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, j.getTitle());
            ps.setString(2, j.getCname());
            ps.setString(3, j.getDescription());
            ps.setString(4, j.getCategory());
            ps.setString(5, j.getLocation());
            ps.setString(6, j.getSalary());
            ps.setString(7, j.getExperience());
            ps.setString(8, j.getStatus());
            ps.setString(9, j.getWebsite());

            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Jobs> getAllJobs() {
        List<Jobs> list = new ArrayList<Jobs>();
        Jobs j = null;

        try {
            String sql = "select *from jobs order by jid desc";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                j = new Jobs();
                j.setJid(rs.getInt(1));
                j.setTitle(rs.getString(2));
                j.setCname(rs.getString(3));
                j.setDescription(rs.getString(4));
                j.setCategory(rs.getString(5));
                j.setLocation(rs.getString(6));
                j.setSalary(rs.getString(7));
                j.setExperience(rs.getString(8));
                j.setStatus(rs.getString(9));
                j.setWebsite(rs.getString(10));
                j.setPdate(rs.getTimestamp(11) + "");
                list.add(j);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Jobs> getAllJobsForUser() {
        List<Jobs> list = new ArrayList<Jobs>();
        Jobs j = null;

        try {
            String sql = "select *from jobs where status=? order by jid desc";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Active");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                j = new Jobs();
                j.setJid(rs.getInt(1));
                j.setTitle(rs.getString(2));
                j.setCname(rs.getString(3));
                j.setDescription(rs.getString(4));
                j.setCategory(rs.getString(5));
                j.setLocation(rs.getString(6));
                j.setSalary(rs.getString(7));
                j.setExperience(rs.getString(8));
                j.setStatus(rs.getString(9));
                j.setWebsite(rs.getString(10));
                j.setPdate(rs.getTimestamp(11) + "");
                list.add(j);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Jobs getJobById(int id) {

        Jobs j = null;

        try {
            String sql = "select *from jobs where jid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                j = new Jobs();
                j.setJid(rs.getInt(1));
                j.setTitle(rs.getString(2));
                j.setCname(rs.getString(3));
                j.setDescription(rs.getString(4));
                j.setCategory(rs.getString(5));
                j.setLocation(rs.getString(6));
                j.setSalary(rs.getString(7));
                j.setExperience(rs.getString(8));
                j.setStatus(rs.getString(9));
                j.setWebsite(rs.getString(10));
                j.setPdate(rs.getTimestamp(11) + "");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return j;
    }

    public boolean updateJob(Jobs j) {
        boolean f = false;
        try {
            String sql = "update jobs set title=?,cname=?,description=?,category=?,location=?,salary=?,experience=?,status=?,website=? where jid=?";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, j.getTitle());
            ps.setString(2, j.getCname());
            ps.setString(3, j.getDescription());
            ps.setString(4, j.getCategory());
            ps.setString(5, j.getLocation());
            ps.setString(6, j.getSalary());
            ps.setString(7, j.getExperience());
            ps.setString(8, j.getStatus());
            ps.setString(9, j.getWebsite());
            ps.setInt(10, j.getJid());

            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean deleteJobs(int id) {
        boolean f = false;
        try {
            String sql = "delete from jobs where jid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Jobs> getJobsORLocationAndCate(String category, String location) {
        List<Jobs> list = new ArrayList<Jobs>();

        Jobs j = null;
        try {
            String sql = "select *from jobs where category=? or location=? order by jid desc";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, category);
            ps.setString(2, location);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                j = new Jobs();
                j.setJid(rs.getInt(1));
                j.setTitle(rs.getString(2));
                j.setCname(rs.getString(3));
                j.setDescription(rs.getString(4));
                j.setCategory(rs.getString(5));
                j.setLocation(rs.getString(6));
                j.setSalary(rs.getString(7));
                j.setExperience(rs.getString(8));
                j.setStatus(rs.getString(9));
                j.setWebsite(rs.getString(10));
                j.setPdate(rs.getString(11));
                list.add(j);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Jobs> getJobsAndLocationAndCate(String category, String location) {
        List<Jobs> list = new ArrayList<Jobs>();

        Jobs j = null;
        try {
            String sql = "select *from jobs where category=? and location=? order by jid desc";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, category);
            ps.setString(2, location);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                j = new Jobs();
                j.setJid(rs.getInt(1));
                j.setTitle(rs.getString(2));
                j.setCname(rs.getString(3));
                j.setDescription(rs.getString(4));
                j.setCategory(rs.getString(5));
                j.setLocation(rs.getString(6));
                j.setSalary(rs.getString(7));
                j.setExperience(rs.getString(8));
                j.setStatus(rs.getString(9));
                j.setWebsite(rs.getString(10));
                j.setPdate(rs.getString(11));
                list.add(j);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
