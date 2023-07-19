/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author KUSH
 */
public class ApplyJobs {

    private int appid;
    private String name;
    private String qualification;
    private String mobileno;
    private String skills;
    private String experience;
    private String curr_job;
    private String Notice_period;
    private String Message;
    private String resume;

    public ApplyJobs() {
        super();
    }

    public ApplyJobs(String name,String qualification,String mobileno,String skills, String experience, String curr_job, String Notice_period, String Message, String resume) {
        this.name = name;
        this.qualification = qualification;
        this.mobileno = mobileno;
        this.skills = skills;
        this.experience = experience;
        this.curr_job = curr_job;
        this.Notice_period = Notice_period;
        this.Message = Message;
        this.resume = resume;
    }

    public int getAppid() {
        return appid;
    }

    public void setAppid(int appid) {
        this.appid = appid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getMobileno() {
        return mobileno;
    }

    public void setMobileno(String mobileno) {
        this.mobileno = mobileno;
    }
    
    

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getCurr_job() {
        return curr_job;
    }

    public void setCurr_job(String curr_job) {
        this.curr_job = curr_job;
    }

    public String getNotice_period() {
        return Notice_period;
    }

    public void setNotice_period(String Notice_period) {
        this.Notice_period = Notice_period;
    }

    public String getMessage() {
        return Message;
    }

    public void setMessage(String Message) {
        this.Message = Message;
    }

    public String getResume() {
        return resume;
    }

    public void setResume(String resume) {
        this.resume = resume;
    }

}
