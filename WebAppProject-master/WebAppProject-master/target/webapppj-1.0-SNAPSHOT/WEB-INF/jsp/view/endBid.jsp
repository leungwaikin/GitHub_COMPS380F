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
                            [<a href="<c:url value="/item/endWithNoWinner/${itemId}" />">End the bid with no winner</a>]
                            </security:authorize>
                    </p>
                </security:authorize>
                <br /><br />
                <p class="lead">
                   <c:if test="${!empty item.bid}" >
                       Bidder: <br/></br>
                    <c:forEach var="bidderItem" items="${item.bid}">
                    <i> ${bidderItem}   [<a href="<c:url value="/item/${itemId}/endWithWinner/${bidderItem}" />">End the bid with this winner</a>]</i>  
                    <br /><br />
                  </c:forEach>
                   </c:if>
                   
                <p class="lead">  <a href="<c:url value="/item" />">Return to list items</a></p>
            </div>      
        </div>  
    </body>
</html>
