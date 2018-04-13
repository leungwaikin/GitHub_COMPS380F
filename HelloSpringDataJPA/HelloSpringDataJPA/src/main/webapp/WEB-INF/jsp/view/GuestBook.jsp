<!DOCTYPE html>
<html>
    <head>
        <title>Bidding Main Page</title>
    </head>
    <body>
    <c:url var="logoutUrl" value="/logout"/>
    <form action="${logoutUrl}" method="post">
      <input type="submit" value="Log out" />
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>    

    <h1>Bidding Main Page</h1>
    <p>Hello <security:authentication property="principal.username" />!</p>

    <c:if test="${fn:length(entries) == 0}">
        <p>There is no item yet.</p>
    </c:if>
    <c:if test="${fn:length(entries) > 0}">
        <ul>
        <c:forEach var="entry" items="${entries}">
            <li>
                ${entry.name} (<fmt:formatDate value="${entry.date}" pattern="yyyy-MM-dd" />): 
                <security:authorize access="hasRole('ADMIN')">
                    [<a href="<c:url value="/guestbook/edit?id=${entry.id}" />">Edit</a>] 
                    [<a href="<c:url value="/guestbook/delete?id=${entry.id}" />">Delete</a>]
                    [<a href="<c:url value="/guestbook/bid?id=${entry.id}" />">Bid</a>]
                </security:authorize>
                <br />
            <c:out value="${entry.message}" escapeXml="true" /><br />
            </li>
        </c:forEach>
        </ul>
    </c:if>
    <p><a href="<c:url value="/guestbook/add" />">Add Item</a></p>
    </body>
</html>
