<%-- 
    Document   : contactus
    Created on : 05-Jun-2023, 7:54:55 pm
    Author     : KUSH
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us</title>
        <%@include file="all_component/all_css.jsp" %>
    </head>
    <body style="background-color: #f0f1f2;">
        <%@include file="all_component/navbar.jsp" %>
        <!--<h1>Its Contact Us</h1>-->

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
                            <h5>Contact Us</h5>

                        </div>

                        <form action="contact_us" method="post">

                            <div class="form-row">

                                <label>Enter Name</label>
                                <input type="text" required="required" class="form-control" name="name">

                                <label>Enter Email</label>
                                <input type="email" required="required" class="form-control" name="email">

                                <label>Enter Phone No</label>
                                <input type="text" required="required" class="form-control" name="phone">

                                <label>Enter Message</label>
                                <textarea required rows="6" cols="" name="desc" class="form-control"></textarea>
                            </div><br>

                            <div>
                                <center><button type="submit" class="btn btn-success ">Submit</button></center></div>
                        </form>
                    </div>
                </div>
            </div>

    </body>
</html>
