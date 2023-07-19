<%-- 
    Document   : navbar
    Created on : 16-May-2023, 10:59:08 am
    Author     : KUSH
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Navbar</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-custom">
            <a class="navbar-brand" href="index.jsp"><img src="img\4.png" width="140" height="70" alt=""/></a>
            <!--<div class="navbar-header"><a class="navbar-brand text-capitalize" href="index.jsp" style="font-size:28px;color:whitesmoke;">Getjob</a><button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button></div>-->

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">

                    <li class="nav-item active">
                        <a class="nav-link" href="review.jsp">Companies Review</a>
                    </li>

                    <li class="nav-item active">
                        <a class="nav-link" href="aboutus.jsp">AboutUs</a>
                    </li>

                    <li class="nav-item active">
                        <a class="nav-link" href="contactus.jsp">ContactUs</a>
                    </li>

                    <c:if test="${userobj.role eq 'user'}">
                        <li class="nav-item">
                            <a class="nav-link" href="view_recruiters.jsp"><i class="fas fa-eye"></i>View Recruiters</a>
                        </li>
                    </c:if>

                    <c:if test="${userobj.role eq 'admin'}">
                        <li class="nav-item">
                            <a class="nav-link" href="add_job.jsp"><i class="fa fa-plus-circle"></i>Post Job</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="view_jobs.jsp"><i class="fas fa-eye"></i>View Job</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="view_user.jsp"><i class="fas fa-eye"></i>View User</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="view_recruiters.jsp"><i class="fas fa-eye"></i>View Recruiters</a>
                        </li>
                    </c:if>


                </ul>
                <form class="form-inline my-2 my-lg-0">

                    <c:if test="${userobj.role eq 'admin'}">
                        <a href="#" class="btn btn-light mr-2"><i class="fas fa-user"></i>Admin</a>
                        <a href="logout" class="btn btn-light"><i class="fas fa-sign-in-alt"></i>Logout</a>
                    </c:if>

                    <c:if test="${userobj.role eq 'user'}">
                        <a href="#" class="btn btn-light mr-2" data-toggle="modal" data-target="#exampleModal"><i class="fas fa-user"></i>${userobj.name}</a>                        
                        <a href="logout" class="btn btn-light"><i class="fas fa-sign-in-alt"></i>Logout</a>
                    </c:if>


                    <c:if test="${empty userobj}">
                        <a href="login.jsp" class="btn btn-light mr-2"><i class="fas fa-sign-in-alt"></i>Login</a>
                        <a href="recruiter_login.jsp" class="btn btn-light mr-2"><i class="fas fa-sign-in-alt"></i>Recruiter Login</a>
                        <a href="register.jsp" class="btn btn-light"><i class="fa-solid fa-user"></i>SignUp</a>
                    </c:if>



                    <%--              <c:if test="${recobj.role eq 'recruiter'}">
                <a href="#" class="btn btn-light mr-2" data-toggle="modal" data-target="#"><i class="fas fa-user"></i>${recobj.rname}</a>
                <a href="logout" class="btn btn-light"><i class="fas fa-sign-in-alt"></i>Logout</a>
            </c:if>  --%>
                </form>

            </div>
        </nav>


        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">User Profile</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="card">
                            <div class="card-body">
                                <div class="text-center text-primary">
                                    <i class="fas fa-user-circle fa-3x"></i>
                                </div>
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th scope="row">Name</th>
                                            <th>${userobj.name}</th>
                                        </tr>
                                        <tr>
                                            <th scope="row">Email</th>
                                            <th>${userobj.email}</th>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <a href="edit_profile.jsp" class="btn btn-primary">Edit</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
