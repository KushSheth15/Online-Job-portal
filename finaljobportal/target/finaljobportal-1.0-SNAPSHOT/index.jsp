<%-- 
    Document   : index.jsp
    Created on : 16-May-2023, 11:13:15 am
    Author     : KUSH
--%>

<%@page import="DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        
        <%@include file="all_component/all_css.jsp" %>
        
        <style type="text/css">
            .back-img{
                background: url("img/jobs_back.jpg");
                width: 100%;
                height: 80vh;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
        
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
                
        <div class="container-fluid back-img">
            <div class="text-center">
            </div>
        </div>
        
        <%@include file="all_component/footer.jsp" %>
    </body>
</html>
