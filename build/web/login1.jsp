<%-- 
    Document   : login1
    Created on : May 3, 2015, 7:05:43 PM
    Author     : Akhil Bhai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Login Model Attribute</h1>
        <form method="post" action="/SpringMvc/loginSubmit1">
            <input type="text" placeholder="Username" required="" id="username"  name="studentName"/>
            <input type="text" placeholder="Email" required="" id="email"  name="studentHobby"/>
            <input type="submit" value="Log in" />
        </form>
    </body>
</html>
