<%@page import="com.learn.mycart.entities.User"%>
<%
    User user = (User)session.getAttribute("current-user");
    if(user == null){
        session.setAttribute("message", "You are not login!! Login first");
        response.sendRedirect("login.jsp");
        return;
    }else{
        if(user.getUserType().equals("admin")){
            session.setAttribute("message", "You are not normal !!");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
