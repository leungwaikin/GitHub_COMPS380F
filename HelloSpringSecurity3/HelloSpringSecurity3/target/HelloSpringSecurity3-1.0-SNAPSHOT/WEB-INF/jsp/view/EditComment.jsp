<!DOCTYPE html>
<html>
    <head>
        <title>Edit Comment</title>
    </head>
    <body>
        <h1>Edit Comment</h1>
        <form:form method="post" modelAttribute="entry">
            <form:label path="name">Name:</form:label> 
            <form:input type="text" path="name"/> <br />
            <form:textarea path="message" /> <br />
              ********Required item in below<br/>
        Missing Owner Name,number of bid, status<br/>
        <form:label path="description">Description:</form:label>
        <form:input type="text" path="description" /> <br />
        <form:label path="price">Price:</form:label>
        <form:input type="text" path="price" /> <br />
        <form:label path="comment">Comment:</form:label>
        <form:textarea type="text" path="comment" /> <br />
            <input type="submit" name="save" value="Save" />
        </form:form>
    </body>
</html>
