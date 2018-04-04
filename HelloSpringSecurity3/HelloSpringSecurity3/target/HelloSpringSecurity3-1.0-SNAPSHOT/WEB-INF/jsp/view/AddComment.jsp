<!DOCTYPE html>
<html>
    <head>
        <title>Add Item</title>
    </head>
    <body>
    <h1>Add Item</h1>
    <form:form method="post">
        <form:label path="name">Name:</form:label> 
        <form:input type="text" path="name" /> <br />
        <form:textarea path="message"></form:textarea> <br />
        ********Required item in below<br/>
        Missing Owner Name,Photo<br/>
        <form:input type="hidden" value ="0" path="numberofbid" />
        <form:input type="hidden" value ="available" path="status" />
        <form:label path="description">Description:</form:label>
        <form:input type="text" path="description" /> <br />
        <form:label path="price">Price:</form:label>
        <form:input type="text" path="price" /> <br />
        <form:label path="comment">Comment:</form:label>
        <form:textarea type="text" path="comment" /> <br />
        <input type="submit" name="add" value="Add" />
    </form:form>
    </body>
</html>
