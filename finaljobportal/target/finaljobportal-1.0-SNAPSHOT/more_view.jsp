<%-- 
    Document   : more_view
    Created on : 20-May-2023, 4:56:17 pm
    Author     : KUSH
--%>

<%@page import="java.util.ArrayList"%>
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
        <title>User : View Jobs</title>
        <%@include file="all_component/all_css.jsp" %>
    </head>
    <body style="background-color: #f0f1f2;">
        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>  

        <%@include file="all_component/navbar.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h5 class="text-center text-primary">All Jobs</h5>
                    <%
                        String loc = request.getParameter("loc");
                        String cat = request.getParameter("cat");
                        String msg = "";

                        JobDAO dao = new JobDAO(DB.DBConnect.getConn());
                        List<Jobs> list = null;
                        if ("lo".equals(loc) && "ca".equals(cat)) {
                            list = new ArrayList<Jobs>();
                            msg = "Job Not Available ";
                        } else if ("lo".equals(loc) || "ca".equals(cat)) {
                            list = dao.getJobsORLocationAndCate(cat, loc);
                        } else {
                            list = dao.getJobsAndLocationAndCate(cat, loc);
                        }
                        if (list.isEmpty()) {
                    %>

                    <h4 class="text-center text-danger">Job Not Available</h4>

                    <%
                        }
                        if (list != null) {

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
                            <p> Website : <a href="<%= j.getWebsite()%>"><%= j.getWebsite()%></a> </p>
                            <h6>Publish Date : <%= j.getPdate().toString()%></h6>
                            <div class="text-center">
                                <a href="one_view.jsp?jid=<%= j.getJid()%>" class="btn btn-sm bg-success text-white">View</a>
                            </div>

                        </div>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <h4 class="text-center text-danger"><%= msg%></h4>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
