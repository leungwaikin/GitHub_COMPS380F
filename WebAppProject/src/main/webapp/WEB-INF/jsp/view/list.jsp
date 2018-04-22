<!DOCTYPE html>
<html>
    <head>
        <title>Bidding list</title>
    </head>
    <link rel="stylesheet" href="<c:url value="/resources/static/css/item-list.css" />">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.js"></script>
    <script>
        baguetteBox.run('.item-gallery');
    </script>
    <body>
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
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value="/user" />">Manage</a>
                        </li>
                    </security:authorize>

                </ul>
                      

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
            <div class="jumbotron jumbotron-fluid">
                <div class="container itemlist-container">
                    <div class="item-header">
                    <h1 class="display-3">Welcome to BidderLand!</h1>
                    <security:authorize access = "isAnonymous()">
                    <button class="btn btn-dark" type="button" onclick="window.location.href = '<c:url value="/login" />'">Login</button>
                    <button class="btn btn-dark" type="button" onclick="window.location.href = '<c:url value="/user/create" />'">Register</button>
                </security:authorize>
                    </div>
                    </br></br></br>
                    <c:choose>
                        <c:when test="${fn:length(itemDatabase) == 0}">
                            <p class="lead"><i>No bidding items.</i></p> 
                        </c:when>
                        <c:otherwise>
                            <div class="item-gallery">
                            <div class="row">
                                <c:forEach items="${itemDatabase}" var="item">
                                    <div class="col-sm-4 col-md-4">
                                        <div class="thumbnail">
                                            <a class="lightbox" href="<c:url value="/item/view/${item.id}" />">
                                                <c:choose>
                                                    <c:when test="${fn:length(item.attachments) > 0}">
                                                        <img src="<c:url value="/item/${item.id}/attachment/${item.attachments[0].name}" />" style="width:100%"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="<c:url value="/resources/images/upload-empty.png" />" style="width:100%"/>  
                                                    </c:otherwise>
                                                </c:choose>
                                                <div class="caption">
                                                    <h2><c:out value="${item.subject}" /></h2>                                              
                                                    <h3>Number of bid(s): <c:out value="${fn:length(item.bidRecord)}"/></h3>                                                 
                                                </div>
                                            </a>
                                            <security:authorize access = "!isAnonymous()">
                                                <security:authorize access="hasRole('ADMIN')">
                                                    <button type="button" class="btn btn-primary" onclick="window.location.href = '<c:url value="/item/delete/${item.id}" />'">Delete</button>
                                                </security:authorize>
                                            </security:authorize>
                                        </div>
                                    </div>
                                    <br /><br />
                                </c:forEach>
                                    </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            </div>
    </body>
</html>
