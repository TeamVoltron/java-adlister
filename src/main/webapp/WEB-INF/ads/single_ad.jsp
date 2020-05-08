<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="View an Ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="../partials/navbar.jsp" />
<div class="container">
    <h1>Check out this popular listing!</h1>
    <br>
    <br>
    <div class="col-sm-12" style="text-align: center;">
        <h1><c:out value="${ad.title}"/></h1>
        <h4>By <c:out value="${user.username}"/></h4>
        <p><c:out value="${ad.description}"/></p>
        <h5>Categories: <c:out value="${categories}"/></h5>
    </div>
    <%--    <% if--%>
</div>
<br>
<br>
<a href="/ads"><h4>Return to All Ads Page</h4></a>
</body>
</html>