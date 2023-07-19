<%-- 
    Document   : view
    Created on : 25-May-2023, 6:12:34 pm
    Author     : KUSH
--%>

<%@page import="entity.Recruiter"%>
<%@page import="java.util.List"%>
<%@page import="dao.RecruiterDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Recruiters</title>
        <%@include file="all_component/all_css.jsp" %>
    </head>
    <body style="background-color: #f0f1f2;">

        <%@include file="all_component/navbar.jsp" %>

        <div class="col-md-12">
            <div class="card paint-card">
                <div class="card-body">
                    <p class="fs-3 text-center">Recruiter Details</p>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Company Name</th>
                                <th scope="col">Recruiter Name</th>
                                <th scope="col">Address</th>
                                <th scope="col">Mobile No</th>
                                <th scope="col">Email ID</th>
                                <th scope="col">City</th>
                                <th scope="col">State</th>
                                
                            </tr>
                        </thead>

                        <tbody>
                            <%
                                RecruiterDAO dao = new RecruiterDAO(DB.DBConnect.getConn());
                                List<Recruiter> list = dao.getAllRecruiter();
                                for (Recruiter r : list) {%>
                            <tr>
                                <td><%= r.getCname()%></td>
                                <td><%= r.getRname()%></td>
                                <td><%= r.getAddress()%></td>
                                <td><%= r.getMobileno()%></td>
                                <td><%= r.getEmailid()%></td>
                                <td><%= r.getCity()%></td>
                                <td><%= r.getState()%></td>
                                
                            </tr>
                            <% }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
