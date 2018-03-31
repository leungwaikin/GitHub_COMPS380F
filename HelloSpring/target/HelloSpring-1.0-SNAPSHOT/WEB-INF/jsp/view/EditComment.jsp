<!DOCTYPE html>
<html>
    <head>
        <title>Edit Comment</title>
    </head>
    <body>
        <h1>Edit Comment</h1>
        <form:form method="POST" modelAttribute="entry">
            <form:label path="name">Name:</form:label> 
            <form:input type="text" path="name" /> <br />
            <form:textarea path="message"></form:textarea> <br />
            <input type="submit" name="add" value="Add" />
        </form:form>
    </body>
</html>
