<%-- 
    Document   : view_jobs
    Created on : 16-May-2023, 6:49:00 pm
    Author     : KUSH
--%>

<%@page import="entity.Jobs"%>
<%@page import="java.util.List"%>
<%@page import="dao.JobDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Jobs</title>
        <%@include file="all_component/all_css.jsp" %>
    </head>
    <body style="background-color: #f0f1f2;">

        <c:if test="${userobj.role eq 'admin'}">
            <%@include file="all_component/navbar.jsp" %>            
        </c:if>

        <c:if test="${recobj.role eq 'recruiter'}">
            <%@include file="all_component/rec_navbar.jsp" %>
        </c:if>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h5 class="text-center text-primary">All Jobs</h5>
                    <c:if test="${not empty succMsg}">
                        <h4 class="alert alert-success" role="alert">${succMsg}</h4>
                        <c:remove var="succMsg"/>
                    </c:if>

                    <%
                        JobDAO dao = new JobDAO(DB.DBConnect.getConn());
                        List<Jobs> list = dao.getAllJobs();
                        for (Jobs j : list) {
                    %>    

                    <div class="card mt-2">
                        <div class="card-body">
                            <div class="text-center text-primary">
                                <i class="far fa-clipboard fa-2x"></i>
                            </div>


                            <h6>Job Title : <%= j.getTitle()%></h6>
                            <h5>Company Name : <%= j.getCname()%></h5>
                            <p>Description : <%= j.getDescription()%></p>
                            <br>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm" value="Location:<%= j.getLocation()%> " readonly> 
                                </div>
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm" value="Category:<%= j.getCategory()%>" readonly> 
                                </div>
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm" value="Salary:<%= j.getSalary()%>" readonly> 
                                </div>
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm" value="Experience:<%= j.getExperience()%>" readonly> 
                                </div>
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm" value="Status:<%= j.getStatus()%>" readonly> 
                                </div>
                            </div>

                            <br>
                            <p>For More Details Visit Website : <a href="<%= j.getWebsite()%>"><%= j.getWebsite()%></a> </p>
                            
                            <br>
                            <h6>Publish Date : <%= j.getPdate()%></h6>
                            <div class="text-center">
                                <a href="edit_job.jsp?jid=<%=j.getJid()%>" class="btn btn-sm bg-success text-white">Edit</a>
                                <a href="delete?jid=<%=j.getJid()%>" class="btn btn-sm bg-danger text-white">Delete</a>
                            </div>
                        </div>
                    </div>

                    <%
                        }
                    %>

                </div>
            </div>
        </div>
    </body>
</html>
