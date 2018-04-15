<!DOCTYPE html>
<html>
    <head>
        <title>Bidding web</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href="#">Bid You Like</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/item" />">Home</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="<c:url value="/item/create" />">Create Item<span class="sr-only">(current)</span></a>
                    </li>
                </ul>
                <security:authorize access = "isAnonymous()">
                    <button class="btn btn-dark" type="button" onclick="window.location.href = '<c:url value="/login" />'">Login</button>
                </security:authorize>
                <security:authorize access = "!isAnonymous()">
                    <c:url var="logoutUrl" value="/logout"/>
                    <form action="${logoutUrl}" method="post">
                        <input class="btn btn-dark" type="submit" value="Log out" />
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                </security:authorize>
            </div>
        </nav>
        <div class="container">
            <div class="jumbotron">   
                <h1 class="display-4">Item #${itemId}</h1>
                <form:form method="POST" enctype="multipart/form-data" modelAttribute="itemForm">
                    <div class="form-group">
                    <form:label path="subject">Subject</form:label><br/>
                    <form:input type="text" path="subject" /><br/><br/>
                    </div>
                   
                    <c:if test="${item.numberOfAttachments > 0}">
                        <b>Attachments:</b><br/>
                        <ul>
                            <c:forEach items="${item.attachments}" var="attachment">
                                <li>
                                    <c:out value="${attachment.name}" />
                                    [<a href="<c:url value="/item/${itemId}/delete/${attachment.name}" />">Delete</a>]
                                </li>
                                
                            </c:forEach>
                        </ul>
                    </c:if>
                    <b>Add attachments</b><br />
                    <input type="file" name="attachments" multiple="multiple"/><br/><br/>
                    
                    
                    <div class="form-group">
                    <form:label path="description">Description</form:label><br/>
                    <form:textarea path="description" rows="5" cols="30" /><br/><br/>
                    </div>
                    
                    <div class="form-group">
                    <form:label path="price">Price</form:label><br/>
                    </div>
                    <form:input type="text" path="price" /><br/><br/>
                    
                     <div class="form-group">
                     <form:input type="hidden" path="numberofbid" value="0" /><br/><br/>
                    </div>
                     <div class="form-group">
                     <form:input type="hidden" path="status" value="available" /><br/><br/>
                    </div>
                     <div class="form-group">
                    <form:label path="comment">Comment</form:label><br/>
                    <form:textarea path="comment" rows="5" cols="30" /><br/><br/>
                    </div>
                    
                    <input type="submit" value="Save"/>
                </form:form>
                    
            </div>      
        </div>  
    </body>
</html>
