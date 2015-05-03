<%-- 
    Document   : login
    Created on : May 3, 2015, 12:58:41 PM
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
        <h1>Login</h1>
        <form method="post" action="/SpringMvc/loginSubmit">
            <input type="text" placeholder="Username" required="" id="username"  name="username"/>
            <input type="text" placeholder="Email" required="" id="email"  name="email"/>
            <input type="submit" value="Log in" />
        </form>
    </body>
</html>
