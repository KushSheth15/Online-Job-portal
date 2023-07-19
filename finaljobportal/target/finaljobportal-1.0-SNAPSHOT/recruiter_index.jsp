<%-- 
    Document   : index
    Created on : 26-May-2023, 5:37:24 pm
    Author     : KUSH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recruiter Page</title>
        <%@include file="all_component/all_css.jsp" %>
        
        <style type="text/css">
            .back-img{
                background: url("img/recruitment.jpeg");
                width: 100%;
                height: 80vh;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <%@include file="all_component/rec_navbar.jsp" %>
        <div class="container-fluid back-img">
            <div class="text-center">
            </div>
        </div>
        <%@include file="all_component/footer.jsp" %>
    </body>
</html>
