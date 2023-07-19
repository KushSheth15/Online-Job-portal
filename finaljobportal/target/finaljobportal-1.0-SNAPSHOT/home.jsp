<%-- 
    Document   : home
    Created on : 19-May-2023, 12:16:52 pm
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
        <title>User : Home</title>
        <%@include file="all_component/all_css.jsp" %>
    </head>
    <body style="background-color: #f0f1f2;">
        <%@include file="all_component/navbar.jsp" %>

        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>  

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h5 class="text-center text-primary">All Jobs</h5>

                    <c:if test="${not empty succMsg}">
                        <h4 class="alert alert-success" role="alert">${succMsg}</h4>
                        <c:remove var="succMsg"/>
                    </c:if>   

                    <div class="card">
                        <div class="card-body">
                            <form class="form-inline" action="more_view.jsp" method="get">
                                <div class="form-group col-md-5 mt-1">
                                    <h5>Location</h5>
                                </div>
                                <div class="form-group col-md-4 mt-1">
                                    <h5>Category</h5>
                                </div>

                                <div class="form-group col-md-5">

                                    <select name="loc" class="custom-select" id="inlineFormCustomSelectPref">
                                        <option selected value="lo">-- Select Location --</option>
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
                                <div class="form-group col-md-5">

                                    <select name="cat" class="custom-select" id="inlineFormCustomSelectPref">
                                        <option selected value="ca">-- Select Category --</option>
                                        <option value="IT">IT</option>
                                        <option value="Developer">Developer</option>
                                        <option value="Banking">Banking</option>
                                        <option value="Accounting / Auditing / Tax">Accounting
                                            / Auditing / Tax</option>
                                        <option value="Marketing / Sales">Marketing / Sales</option>
                                        <option value="Administration / Secretary / Front Office">Administration
                                            / Secretary / Front Office</option>
                                        <option value="Architecture / Civil Engineering">Architecture
                                            / Civil Engineering</option>
                                        <option value="HR / Recruitment">HR / Recruitment</option>
                                        <option value="Logistics / Purchase / Supply Chain / Procurement">Logistics
                                            / Purchase / Supply Chain / Procurement</option>
                                        <option value="Teacher">Teacher</option>
                                    </select>
                                </div>

                                <button class="btn btn-success">Submit</button>
                            </form>
                        </div>
                    </div>

                    <%
                        JobDAO dao = new JobDAO(DB.DBConnect.getConn());
                        List<Jobs> list = dao.getAllJobsForUser();
                        for (Jobs j : list) {
                    %>

                    <div class="card mt-2">
                        <div class="card-body">
                            <div class="text-center text-primary">
                                <i class="far fa-clipboard fa-2x"></i>
                            </div>

                            <h6><%= j.getTitle()%></h6>

                            <h5><%= j.getCname()%></h5>

                            <%
                                if (j.getDescription().length() > 0 && j.getDescription().length() < 120) {
                            %>
                            <p><%= j.getDescription()%>.</p>

                            <%
                            } else {
                            %>
                            <p><%= j.getDescription().substring(0, 120)%>...</p>
                            <%
                                }
                            %>

                            <br>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm" 
                                           value="Location: <%= j.getLocation()%>" readonly>
                                </div>
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm" 
                                           value="Category: <%= j.getCategory()%>" readonly>
                                </div>
                            </div>



                            <h6>Publish Date : <%= j.getPdate().toString()%></h6>
                            <div class="text-center">
                                <a href="one_view.jsp?jid=<%=j.getJid()%>"
                                   class="btn btn-sm bg-success text-white">View More</a>
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
