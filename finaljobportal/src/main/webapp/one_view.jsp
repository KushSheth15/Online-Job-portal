<%-- 
    Document   : one_view
    Created on : 19-May-2023, 6:47:07 pm
    Author     : KUSH
--%>

<%@page import="dao.ApplyDAO"%>
<%@page import="entity.Jobs"%>
<%@page import="dao.JobDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Single Jobs</title>
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


                    <%
                        int id = Integer.parseInt(request.getParameter("jid"));
                        JobDAO dao = new JobDAO(DB.DBConnect.getConn());
                        Jobs j = dao.getJobById(id);
                    %>    

                    <div class="card mt-5">
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
                            <h6>Publish Date : <%= j.getPdate().toString()%></h6>
                            <div>
                                <a href="apply_jobs.jsp">
                                    <button type="button" class="btn btn-primary">Apply</button>
                                </a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
