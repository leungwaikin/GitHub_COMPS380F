<html>
<head>
<title>Register</title>
</head>
<body>
    <h1>Register</h1>
    <form action="register" method="POST">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
            <table>
                <tr>
                    <td>User Name</td>
                    <td><input type="text" name="name" /></td>
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
 
    </form>

</body>
</html>