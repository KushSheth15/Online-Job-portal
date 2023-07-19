/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Recruiter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author KUSH
 */
public class RecruiterDAO {

    private Connection conn;

    public RecruiterDAO(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean register(Recruiter r) {
        boolean f = false;
        try {
            String sql = "insert into recruiter(cname,rname,address,mobileno,emailid,password,city,state,role) values(?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, r.getCname());
            ps.setString(2, r.getRname());
            ps.setString(3, r.getAddress());
            ps.setString(4, r.getMobileno());
            ps.setString(5, r.getEmailid());
            ps.setString(6, r.getPassword());
            ps.setString(7, r.getCity());
            ps.setString(8, r.getState());
            ps.setString(9, "recruiter");

            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Recruiter> getAllRecruiter() {
        List<Recruiter> list = new ArrayList<Recruiter>();
        Recruiter r = null;
        try {
            String sql = "select *from recruiter order by rid desc";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                r = new Recruiter();
                r.setRid(rs.getInt(1));
                r.setCname(rs.getString(2));
                r.setRname(rs.getString(3));
                r.setAddress(rs.getString(4));
                r.setMobileno(rs.getString(5));
                r.setEmailid(rs.getString(6));
                r.setPassword(rs.getString(7));
                r.setCity(rs.getString(8));
                r.setState(rs.getString(9));
                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Recruiter login(String email, String psw) {
        Recruiter r = null;

        try {

            String sql = "select *from recruiter where emailid=? and password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, psw);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                r = new Recruiter();
                r.setRid(rs.getInt(1));
                r.setCname(rs.getString(2));
                r.setRname(rs.getString(3));
                r.setAddress(rs.getString(4));
                r.setMobileno(rs.getString(5));
                r.setEmailid(rs.getString(6));
                r.setPassword(rs.getString(7));
                r.setCity(rs.getString(8));
                r.setState(rs.getString(9));
                r.setRole(rs.getString(10));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return r;
    }
}
