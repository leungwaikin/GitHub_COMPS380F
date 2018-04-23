<!DOCTYPE html>
<html>
    <head>
        <title>Edit users</title>
    </head>
    <link rel="stylesheet" href="<c:url value="/resources/static/css/item-list.css" />">
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href="<c:url value="/item" />">BidderLand</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
              
                    <li class="nav-item ">
                        <a class="nav-link" href="<c:url value="/item/create" />">Create Item<span class="sr-only">(current)</span></a>
                    </li>
                    <security:authorize access="hasRole('ADMIN')">
                        <li class="nav-item active">
                            <a class="nav-link" href="<c:url value="/user" />">Manage</a>
                        </li>
                    </security:authorize>
                </ul>
                <security:authorize access = "isAnonymous()">
                    <button class="btn btn-secondary" type="button" onclick="window.location.href = '<c:url value="/login" />'">Login</button>
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
         <h1 class="display-4">Update ${username}'s information</h1>
                <form:form method="POST" enctype="multipart/form-data" modelAttribute="UserForm">
                    <div class="form-group">
                                              
                       <br/><br/>
               
                    </div>
                    <div class="form-group">
                        <form:label path="password">password</form:label><br/>
                          <input type="password" id="password" name="password" required/><br/><br/><br/><br/>
                    </div>
                    <div class="form-group">
                         <form:label path="roles">Roles</form:label><br/>
                        <form:checkbox path="roles" value="ROLE_USER" />ROLE_USER
                        <form:checkbox path="roles" value="ROLE_ADMIN" />ROLE_ADMIN
                    </div>
                          <br/><br/>
                    <input type="submit"class="btn btn-primary" value="Save"/>
                </form:form>
                 
            </div>      
        </div>  
    </body>
</html>
