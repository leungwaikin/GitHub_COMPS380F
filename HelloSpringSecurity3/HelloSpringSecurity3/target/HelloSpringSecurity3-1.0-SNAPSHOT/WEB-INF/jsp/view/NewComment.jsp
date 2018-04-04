<!DOCTYPE html>
<html>
    <head>
        <title>New Comment</title>
    </head>
    <body>
    <h1>Add New Comment</h1>
    <form:form method="post" modelAttribute="entry">
        <form:label path="comment">Comment:</form:label>
        <form:textarea type="text" path="comment" /> <br />
        <input type="submit" name="add" value="Add" />
    </form:form>
    </body>
</html>