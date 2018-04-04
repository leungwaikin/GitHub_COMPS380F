<!DOCTYPE html>
<html>
    <head>
        <title>Bid</title>
    </head>
    <body>
        <h1>Bid</h1>
        <form:form method="post" modelAttribute="entry">
        <form:label path="name">Name:</form:label> 
        <form:input type="text"  readOnly="readOnly" path="name"/> <br />
         <form:textarea  readOnly="readOnly" path="message" /> <br />
         Missing Owner name, current bid
        <form:input type="hidden" value ="available" path="status" />
        <form:label path="description">Description:</form:label>
        <form:input type="text" readOnly="readOnly" path="description" /> <br />
        <form:label path="price">Price:</form:label>
        <form:input type="text" path="price" />(Please enter a price greater than current) <br />
        <form:label path="comment">Comment:</form:label>
        <form:textarea readOnly="readOnly" type="text" path="comment" /> <br />
          <input type="submit" name="save" value="Save" />
        </form:form>
    </body>
</html>
