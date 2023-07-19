/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.ContactUs;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author KUSH
 */
public class ContactDAO {
    
    private Connection conn;

    public ContactDAO(Connection conn) {
        super();
        this.conn = conn;
    }
    
    public boolean addContact(ContactUs c){
        
        boolean f = false;
        try{
            String sql = "insert into contact(name,email,phoneno,message) values(?,?,?,?)";
            
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,c.getName());
            ps.setString(2,c.getEmail());
            ps.setString(3,c.getPhoneno());
            ps.setString(4,c.getMessage());
            
            int i = ps.executeUpdate();
            
            if(i==1){
                f = true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
}
