<%-- 
    Document   : register
    Created on : 2018年3月14日, 下午09:29:50
    Author     : Kin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login Page</title>
    </head>
    <body>
        <h1>User Register Page</h1>
        <form name="register" method="post" action="authentication_register.jsp">
            Username:<input type="text" name="username" value=""/><br>
            Password:<input type="text" name="password" value=""/><br>
            <input type="submit" value="Register"/>
        </form>
    </body>
</html>
