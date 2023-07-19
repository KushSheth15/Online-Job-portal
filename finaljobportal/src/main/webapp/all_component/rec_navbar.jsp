<%-- 
    Document   : rec_navbar
    Created on : 27-May-2023, 5:35:33 pm
    Author     : KUSH
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recruiter Navbar</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-custom">
            <a class="navbar-brand" href="index.jsp"><img src="img\4.png" width="140" height="70" alt=""/></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">


                    <c:if test="${recobj.role eq 'recruiter'}">
                        <li class="nav-item">
                            <a class="nav-link" href="add_job.jsp"><i class="fa fa-plus-circle"></i>Post Job</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="view_jobs.jsp"><i class="fas fa-eye"></i>View Job</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="view_user.jsp"><i class="fas fa-eye"></i>View User</a>
                        </li>
                    </c:if>


                </ul>
                <form class="d-flex">
                    <div class="dropdown">
                        <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton1"
                                data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-user-circle"></i> ${recobj.rname}
                        </button>
                        <a href="recLogout" class="btn btn-light"><i class="fas fa-sign-in-alt"></i>Logout</a>
                    </div>
                </form>

            </div>
        </nav>



    </body>
</html>

