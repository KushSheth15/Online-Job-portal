<%-- 
    Document   : add_job
    Created on : 16-May-2023, 5:48:39 pm
    Author     : KUSH
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Jobs</title>
        <%@include file="all_component/all_css.jsp" %>
    </head>
    <body style="background-color: #f0f1f2;">
        <%--  <c:if test="${userobj.role ne 'admin'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if> --%>

        <c:if test="${userobj.role eq 'admin'}">
            <%@include file="all_component/navbar.jsp" %>            
        </c:if>

        <c:if test="${recobj.role eq 'recruiter'}">
            <%@include file="all_component/rec_navbar.jsp" %>
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

                            <h5>Add Jobs</h5>

                        </div>

                        <form action="add_job" method="post">
                            <div class="form-group">
                                <label>Enter Title</label>
                                <input type="text" required="required" class="form-control" name="title">
                            </div>
                            <div class="form-group">
                                <label>Enter Company Name</label>
                                <input type="text" required="required" class="form-control" name="cname">
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label>Location</label> 
                                    <select name="location" class="custom-select" id="inlineFormCustomSelectPref">
                                        <option selected>-- Select Location --</option>
                                        <option value="Surat">Surat</option>
                                        <option value="Ahmedabad">Ahmedabad</option>
                                        <option value="Mumbai">Mumbai</option>
                                        <option value="Chennai">Chennai</option>
                                        <option value="Banglore">Bangalore</option>
                                        <option value="Hyderabad">Hyderabad</option>
                                        <option value="Pune">Pune</option>
                                        <option value="Delhi">Delhi</option>
                                        <option value="Noida">Noida</option>
                                        <option value="Gurugram">Gurugram</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label>Category</label> 
                                    <select name="category" class="custom-select" id="inlineFormCustomSelectPref">
                                        <option selected>-- Select Category --</option>
                                        <option value="IT">IT</option>
                                        <option value="Developer">Developer</option>
                                        <option value="Banking">Banking</option>
                                        <option value="Accounting / Auditing / Tax">Accounting
                                            / Auditing / Tax</option>
                                        <option value="Marketing / Sales">Marketing / Sales</option>
                                        <option value="Administration / Secretary / Front Office">Administration
                                            / Secretary / Front Office</option>
                                        <option value="Architecture / Engineering">Architecture
                                            / Engineering</option>
                                        <option value="HR / Recruitment">HR / Recruitment</option>
                                        <option value="Logistics / Purchase / Supply Chain / Procurement">Logistics
                                            / Purchase / Supply Chain / Procurement</option>
                                        <option value="Teacher">Teacher</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label>Salary</label> 
                                    <select name="salary" class="custom-select" id="inlineFormCustomSelectPref">
                                        <option selected>-- Select Salary Range --</option>
                                        <option value="no bar">No bar for right candidate</option>
                                        <option value="1 To 3 Lakhs">1-3 Lakhs</option>
                                        <option value="3 To 6 Lakhs">3-6 Lakhs</option>
                                        <option value="6 To 10 Lakhs">6-10 Lakhs</option>
                                        <option value="10 To 12 Lakhs">10-12 Lakhs</option>
                                        <option value="12 To 15 Lakhs">12-15 Lakhs</option>
                                        <option value="More than 15 Lakhs">15+ Lakhs</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label>Experience</label> 
                                    <select name="experience" class="custom-select" id="inlineFormCustomSelectPref">
                                        <option selected>-- Select Experience --</option>
                                        <option value="Fresher">Fresher</option>
                                        <option value="1 to 3 years">1-3 years</option>
                                        <option value="3 to 5 years">3-5 years</option>
                                        <option value="5 to 7 years">5-7 years</option>
                                        <option value="7 to 10 years">7-10 years</option>
                                        <option value="10 to 12 years">10-12 years</option>
                                        <option value="More than 12 years">12+ years</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label>Status</label>
                                    <select class="form-control" name="status">
                                        <option class="Active" value="Active">Active</option>
                                        <option class="Inactive" value="Inactive">Inactive</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Website Link</label>
                                <input type="text" required="required" class="form-control" name="weblink">
                            </div>

                            <div class="form-group">
                                <label>Enter Description</label>
                                <textarea required rows="6" cols="" name="desc" class="form-control"></textarea>
                            </div>

                            <button type="submit" class="btn btn-success">Publish Job</button>
                        </form>
                    </div>
                </div>
            </div>


    </body>
</html>
