<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Character List</title>
</head>
<body>

	<header>
		<jsp:include page="nav.jsp" />
	</header>

	<c:forEach items="${characterList}" var="character">
		<div class="card" style="width: 18rem;">
			<img src="..." class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">${character.name}</h5>
				<p class="card-text">${character.description}</p>
			</div>
		</div>
	</c:forEach>












	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>