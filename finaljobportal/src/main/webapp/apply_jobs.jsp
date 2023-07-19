<%-- 
    Document   : apply_jobs
    Created on : 10-Jun-2023, 7:00:51 pm
    Author     : KUSH
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Apply Jobs</title>
        <%@include file="all_component/all_css.jsp" %>
    </head>
    <body style="background-color: #f0f1f2;">
        <%@include file="all_component/navbar.jsp" %>

        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <div class="container p-2">
            <div class="col-md-10 offset-md-1">

                <div class="card">
                    <div class="card-body">
                        <div class="text-center text-success">
                            <i class="fas fa-user-friends fa-3x"></i>
                            <c:if test="${not empty succMsg}">
                                <h4 class="alert alert-success" role="alert">${succMsg}</h4>
                                <c:remove var="succMsg"/>
                            </c:if>
                            <h5>Apply Jobs</h5>

                        </div>

                        <form action="apply_job" method="post">
                            <div class="form-group">
                                <label>Enter Name</label>
                                <input type="text" required="required" class="form-control" name="name">
                            </div>
                            <div class="form-group">
                                <label>Enter Qualification</label>
                                <input type="text" required="required" class="form-control" name="qual">
                            </div>
                            <div class="form-group">
                                <label>Enter MobileNo</label>
                                <input type="text" required="required" class="form-control" name="mobile">
                            </div>
                            <div class="form-group">
                                <label>Enter Skills</label>
                                <input type="text" required="required" class="form-control" name="skills">
                            </div>

                            <div class="form-group">
                                <label>Enter Experience</label>
                                <input type="text" required="required" class="form-control" name="exp">
                            </div>

                            <div class="form-group">
                                <label>Enter Current Job</label>
                                <input type="text" required="required" class="form-control" name="currjob">
                            </div>

                            <div class="form-group">
                                <label>Notice Period</label>
                                <input type="text" required="required" class="form-control" name="notice">
                            </div>

                            <div class="form-group">
                                <label>Enter Message</label>
                                <textarea rows="4" cols="" name="message" class="form-control"></textarea>
                            </div>

                            <div class="form-group">
                                <label>Resume</label>
                                <input type="file" required="required" class="form-control" name="resume">
                            </div>

                            <button type="submit" class="btn btn-primary ">Apply</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </form>
                    </div>
                </div>
            </div>
    </body>
</html>
