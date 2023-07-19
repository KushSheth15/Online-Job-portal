<%-- 
    Document   : register
    Created on : 25-May-2023, 5:08:34 pm
    Author     : KUSH
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <%@include file="all_component/all_css.jsp" %>
        <script>
            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            })
        </script>
    </head>
    <body style="background-color: #f0f1f2;">
        <%@include file="all_component/navbar.jsp" %>

        <div class="container py-5">
            <!-- For demo purpose -->
            <div class="row mb-4">
                <div class="col-lg-8 mx-auto text-center">
                    <h1 class="display-6">Registration Forms</h1>
                </div>
            </div> <!-- End -->

            <div class="row">
                <div class="col-lg-6 mx-auto">
                    <div class="card ">
                        <div class="card-header">
                            <div class="bg-white shadow-sm pt-4 pl-2 pr-2 pb-2">

                                <ul role="tablist" class="nav bg-light nav-pills rounded nav-fill mb-3">
                                    <li class="nav-item"> <a data-toggle="pill" href="#credit-card" class="nav-link active "> <i class="fas fa-credit-card mr-2"></i> User </a> </li>
                                    <li class="nav-item"> <a data-toggle="pill" href="#paypal" class="nav-link "> <i class="fab fa-paypal mr-2"></i> Recruiter </a> </li>

                                </ul>
                            </div> <!-- End -->

                            <c:if test="${not empty succMsg}">
                                <h4 class="text-center text-success">${succMsg}</h4>
                                <c:remove var="succMsg"/>
                            </c:if>

                            <div class="tab-content">

                                <div id="credit-card" class="tab-pane fade show active pt-3">
                                    <form action="add_user" method="post">
                                        <div class="form-group">
                                            <label>Enter Full Name</label>
                                            <input type="text" required="required" class="form-control" 
                                                   id="exampleInputEmail1" aria-describedby="emailHelp" name="name">
                                        </div>
                                        <div class="form-group">
                                            <label>Enter Email</label>
                                            <input type="email" required="required" class="form-control" 
                                                   id="exampleInputEmail1" aria-describedby="emailHelp" name="em">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Enter Password</label>
                                            <input type="password" required="required" class="form-control" 
                                                   id="exampleInputPassword1" name="ps">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Enter Mobile No</label>
                                            <input type="text" required="required" class="form-control" 
                                                   id="exampleInputPassword1" name="mobileno">
                                        </div>
                                        <button type="submit" class="btn btn-primary badge-pill btn-block">Register</button>
                                    </form>
                                </div> <!-- End -->


                                
                                <div id="paypal" class="tab-pane fade pt-3">
                                    
                                    <form action="add_recruiter" method="post">
                                <div class="form-group">
                                    <label>Enter Company Name</label>
                                    <input type="text" required="required" class="form-control" 
                                           id="exampleInputEmail1" aria-describedby="emailHelp" name="cname">
                                </div>
                                <div class="form-group">
                                    <label>Enter Recruiter Name</label>
                                    <input type="text" required="required" class="form-control" 
                                           id="exampleInputPassword1" name="rname">
                                </div>
                                <div class="form-group">
                                    <label>Enter Address</label>
                                    <input type="text" required="required" class="form-control" 
                                           id="exampleInputEmail1" aria-describedby="emailHelp" name="address">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Enter Mobile No</label>
                                    <input type="text" required="required" class="form-control" 
                                           id="exampleInputPassword1" name="mobileno">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Enter Email</label>
                                    <input type="email" required="required" class="form-control" 
                                           id="exampleInputPassword1" name="email">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Enter Password</label>
                                    <input type="password" required="required" class="form-control" 
                                           id="exampleInputPassword1" name="ps">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Enter City</label>
                                    <input type="text" required="required" class="form-control" 
                                           id="exampleInputPassword1" name="city">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Enter State</label>
                                    <input type="text" required="required" class="form-control" 
                                           id="exampleInputPassword1" name="state">
                                </div>
                                <button type="submit" class="btn btn-primary badge-pill btn-block">Register</button>
                            </form>
                                    
                                </div> <!-- End -->

                            </div>
                        </div>
                    </div>
                </div>                        
                </body>
                </html>
