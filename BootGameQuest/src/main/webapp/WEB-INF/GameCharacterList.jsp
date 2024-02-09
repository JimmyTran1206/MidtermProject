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

<style>
body {
	background-color: #8d99ae;
}
</style>
</head>
<body>

	<header>
		<jsp:include page="nav.jsp" />
	</header>
	<h1 class="text-center">${game.title} Characters</h1>

	<div class="row justify-content-between mx-2">
		<c:forEach items="${characterList}" var="character">
			<div class="card px-0 py-0 col-2">
				<img src="${character.avatarUrl}"
					class="card-img-top" alt="" />
				<div class="card-body">
				<a href="getCharacter.do?charId=${character.id}"><b>${character.name}</b></a>
				</div>
			</div>
		</c:forEach>
	</div>

<style>
.card-img-top {
    width: 100%;
    height: 15vw;
    object-fit: cover;
}
a{
text-decoration: none;
color: black;
}
</style>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>