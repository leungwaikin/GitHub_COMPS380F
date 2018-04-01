<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring Register Form</title>
</head>
<body>
    <form:form name="registersubmitForm" method="POST">
   
            <table>
                <tr>
                    <td>User Name</td>
                    <td><input type="text" name="userName" /></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" /></td>
                </tr>
                <tr>
                    <td>Re enter-Password</td>
                    <td><input type="password" name="password2" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Submit" /></td>
                </tr>
            </table>
            <div style="color: red">${error}</div>
 
    </form:form>
<a href="/HelloSpring/login">Login</a>
</body>
</html>