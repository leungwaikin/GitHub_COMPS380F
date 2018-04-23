<!DOCTYPE html>
<html>
    <title>User management</title>
    <body>
    <link rel="stylesheet" href="<c:url value="/resources/static/css/item-list.css" />">        
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href="<c:url value="/item" />">BidderLand</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                   
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/item/create" />">Create Item</a>
                    </li>
                    <security:authorize access="hasRole('ADMIN')">
                        <li class="item active">
                            <a class="nav-link" href="<c:url value="/user" />">Manage<span class="sr-only">(current)</span></a>
                        </li>
                    </security:authorize>

                </ul>
                <security:authorize access = "isAnonymous()">
                    <button class="btn btn-secondary" type="button" onclick="window.location.href = '<c:url value="/login" />'">Login</button>
                    <button class="btn btn-secondary" type="button" onclick="window.location.href = '<c:url value="/user/create" />'">Registration</button>
                </security:authorize>
                <security:authorize access = "!isAnonymous()">
                    <c:url var="logoutUrl" value="/logout"/>
                    <form action="${logoutUrl}" method="post">
                        <input class="btn btn-secondary" type="submit" value="Log out" />
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                </security:authorize>
            </div>
        </nav>
        <div class="container">
            <div class="jumbotron">
                <h2>Users management</h2>
                 
                <c:choose>
                    <c:when test="${fn:length(bidUsers) == 0}">
                        <i>There are no users .</i>
                    </c:when>
                    <c:otherwise>
                        <div class="user-table">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Username</th><th>Password</th><th>Role</th><th>Actions</th>
                                </tr>
                            </thead>
                            <c:forEach items="${bidUsers}" var="user">
                                <tbody>
                                    <tr>
                                        <td>${user.username}</td><td><text type="password">${user.password}</text></td>
                                        <td>
                                            <c:forEach items="${user.roles}" var="role" varStatus="status">
                                                <c:if test="${!status.first}">, </c:if>
                                                ${role.role}
                                            </c:forEach>
                                        </td>
                                        <td>               
                                  
                                               <c:forEach items="${user.roles}" var="role" varStatus="status">
                                            <security:authorize access = "principal.username!='${user.username}'">
                                                <c:if test="${role.role=='ROLE_USER'}">
                                                <button type="button" class="btn btn-primary" onclick="window.location.href = '<c:url value="/user/edit/${user.username}" />'">Update</button>
                                                <button type="button" class="btn btn-primary" onclick="window.location.href = '<c:url value="/user/delete/${user.username}" />'">Delete</button>
                                                </c:if>
                                            </security:authorize>
                                       </c:forEach>
                                        </td>
                                    </tr>
                                </tbody>
                            </c:forEach>
                        </table>
                                               <button class="btn btn-dark" type="button" onclick="window.location.href = '<c:url value="/user/addUserbyAdmin" />'">Add user</button>
                    </div> 
                    </c:otherwise>
                </c:choose>

            </div> </div> 

    </body>
</html>