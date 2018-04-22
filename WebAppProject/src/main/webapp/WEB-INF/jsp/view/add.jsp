<!DOCTYPE html>
<html>
    <head>
        <title>Create a item</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href="#">BidderLand</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                 
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Create Item<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                          <security:authorize access="hasRole('ADMIN')">
                     <a class="nav-link" href="<c:url value="/user" />">Manage<span class="sr-only">(current)</span></a>
                       </security:authorize>
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
                 <h1 class="display-4">Create a Item</h1>
                <form:form method="POST" enctype="multipart/form-data" modelAttribute="itemForm">
                    <div class="form-group">
                    <form:label path="subject">Name of item</form:label><br/>
                    </div>
                    <form:input type="text" path="subject" required="required"/><br/><br/>
                    <div class="form-group">
                    <form:label path="description">Description</form:label><br/>
                    <form:textarea path="description" rows="5" cols="30" /><br/><br/>
                    </div>
                    <div class="form-group">
                    <form:label path="price">Expected price (HKD)</form:label><br/>
                    <form:input path="price" type="number" min="0" required="required"  /><br/>
                    <form:label path="bidprice">Minimun bid price (HKD)</form:label><br/>
                    <form:input path="bidprice" type="number" min="0" required="required" /><br/><br/>
                    </div>
                    <form:input path="status" type="hidden" value="1"/>
                    <form:input path="bidusername" type="hidden" value="NULL"/>
                    <div class="form-group">
                    <b>Photo</b><br/>
                    <input type="file" name="attachments" multiple="multiple"/><br/><br/>
                    </div>
                    <input type="submit" class="btn btn-primary" value="Submit"/>
                </form:form>
            </div>      
        </div>      
    </body>
</html>
