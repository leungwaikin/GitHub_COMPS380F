<!DOCTYPE html>
<html>
    <head>
        <title>Bidding web</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href="#">Bidding web</a>
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
                <h1 class="display-4">Item #${itemId}: <c:out value="${item.subject}" /></h1>
                <security:authorize access = "!isAnonymous()">
                    <p class="lead">
                        <security:authorize access="hasRole('ADMIN') or principal.username=='${item.customerName}'">
                            [<a href="<c:url value="/item/edit/${itemId}" />">Edit</a>]
                        </security:authorize>
                        <security:authorize access="hasRole('ADMIN')">
                            [<a href="<c:url value="/item/delete/${itemId}" />">Delete</a>]
                        </security:authorize>
                        <security:authorize access="hasRole('USER') and principal.username!='${item.customerName}'">
                            [<a href="<c:url value="/item/bid/${itemId}" />">Bid</a>]
                        </security:authorize>
                            <security:authorize access="hasRole('ADMIN') or (principal.username=='${item.customerName}' && '${item.status}'!='No Winner')">
                            [<a href="<c:url value="/item/endOfbid/${itemId}" />">End the bid</a>]
                            </security:authorize>
                    </p>
                </security:authorize>
                <br /><br />
                <p class="lead">
                    <i>Owner Name - <c:out value="${item.customerName}" /></i><br /><br />
                  
                   
                    Description:<c:out value="${item.description}" /><br /><br /> </p>
<<<<<<< HEAD
                    Expected Price:<c:out value="${item.price}" /><br /><br /> </p>
=======
                    Price:$<c:out value="${item.price}" /><br /><br /> </p>
>>>>>>> a6d008b8fb9e4b0f48ffe5499b14b921345b5903
                    Number of bid:<c:out value="${item.numberofbid}" /><br /><br /> </p>
                    Status:<c:out value="${item.status}" /><br /><br /> </p>
                    Comment:<c:out value="${item.comment}" /><br /><br /> </p>
                    <c:if test="${item.numberOfAttachments > 0}">
                    <p class="lead"> Attachments:</p>
                    <c:forEach items="${item.attachments}" var="attachment" varStatus="status">
                        <c:if test="${!status.first}">, </c:if>
                            <p class="lead"> 
                                <a href="<c:url value="/item/${itemId}/attachment/${attachment.name}" />">                    
                                <c:out value="${attachment.name}" /></a></p>
                            <img src="<c:url value="/item/${itemId}/attachment/${attachment.name}"/>"alt="Attachment photo" width="250" height="250">
                      
                    </c:forEach><br /><br />
                </c:if>
                <p class="lead">  <a href="<c:url value="/item" />">Return to list items</a></p>
            </div>      
        </div>  
    </body>
</html>
