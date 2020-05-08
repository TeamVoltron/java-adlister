<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing Some of The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container">
    <h1>Here are the results!</h1>
    <c:forEach var="ad" items="${ads}" varStatus="status">
        <div class="col-md-6">
            <h2><a href="/ads/view?id=${ad.id}"><c:out value="${ad.title}"/></a></h2>
            <h4>By <c:out value="${users[status.index]}"/></h4>
            <p><c:out value="${ad.description}"/></p>
            <h5>Categories: <c:out value="${categories[status.index]}"/></h5>
        </div>
    </c:forEach>
</div>
<br>
<a href="/ads"><h4>Return to All Ads Page</h4></a>
</body>
</html>