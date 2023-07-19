<%-- 
    Document   : view_applyjob
    Created on : 29-May-2023, 6:11:57 pm
    Author     : KUSH
--%>

<%@page import="entity.User"%>
<%@page import="entity.Jobs"%>
<%@page import="dao.JobDAO"%>
<%@page import="dao.UserDAO"%>
<%@page import="java.util.List"%>
<%@page import="entity.ApplyJobs"%>
<%@page import="dao.ApplyDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="all_component/all_css.jsp" %>
    </head>
    <body style="background-color: #f0f1f2;">
        <%@include file="all_component/rec_navbar.jsp" %>
        
        <div class="text-center"><h4>User List</h4></div>
        <section class="intro">
            <div class="bg-image h-100" style="background-color: #f5f7fa;">
                <div class="mask d-flex align-items-center h-100">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body p-0">
                                        <div class="table-responsive table-scroll" data-mdb-perfect-scrollbar="true" style="position: relative; height: 700px">
                                            <table class="table table-striped mb-0">
                                                <thead style="background-color: #6c7ae0;">

                                                    <tr>
                                                        <th scope="col">Name</th>
                                                        <th scope="col">Qualification</th>
                                                        <th scope="col">Mobile No</th>
                                                        <th scope="col">Skills</th>
                                                        <th scope="col">Experience</th>
                                                        <th scope="col">Current Job</th>
                                                        <th scope="col">Notice Period</th>
                                                        <th scope="col">Message</th>
                                                        <th scope="col">Resume</th>
                                                    </tr>
                                                </thead>
                                                <tbody>       

                                                    <%
                                                        ApplyDAO dao = new ApplyDAO(DB.DBConnect.getConn());
                                                        List<ApplyJobs> list = dao.getAllJobApplication();
                                                        for (ApplyJobs aj : list) {%>
                                                    <tr>

                                                        <td><%= aj.getName()%></td>
                                                        <td><%= aj.getQualification()%></td>
                                                        <td><%= aj.getMobileno()%></td>
                                                        <td><%= aj.getSkills()%></td>
                                                        <td><%= aj.getExperience()%></td>
                                                        <td><%= aj.getCurr_job()%></td>
                                                        <td><%= aj.getNotice_period()%></td>
                                                        <td><%= aj.getMessage()%></td>
                                                        <td><%= aj.getResume()%></td>
                                                    </tr>
                                                    <%
                                                        }
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
