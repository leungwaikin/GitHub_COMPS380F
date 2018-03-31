<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <form:form method="POST" action="/HelloSpring/formhandle" >
        <form:label path="name">Enter a name</form:label>
        <form:input path="name"/><br />
        <form:label path="num">Enter a number </form:label>
        <form:input path="num"/> <br />  
        <input type="submit" value="Submit" />
    </form:form>
    </body>
</html>
