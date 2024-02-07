<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Character Details</title>
</head>
<body>

	<header>
		<jsp:include page="nav.jsp" />
	</header>

	<div class="container-fluid">
		<div class="row">
			<div class="col-12 text-center">
				<h1>GAME TITLE Characters</h1>
				<h3>${character.name}</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-2">
				<button type="button" class="btn btn-primary my-2">Character
					List</button>

				<form action="addNewCharacter" method="GET">
					<button type="submit" class="btn btn-primary my-2">Add New
						Character</button>
				</form>
				<form action="updateCharacter" method="GET">
				<button type="submit" name="charId" value="${character.id}" class="btn btn-primary my-2">Update
					This Character</button>
				</form>
				<button type="button" class="btn btn-primary my-2">Delete
					This Character</button>
			</div>
			<div class="col-8 text-center">
				<div>
					<img class="img-fluid" alt="" src="${character.avatarUrl}">
				</div>
				<div>
					<button type="button" class="btn btn-primary my-2">Previous
						Character</button>
					<button type="button" class="btn btn-primary my-2">Next
						Character</button>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12 text-center">
				<p>${character.description}</p>
			</div>
		</div>

		<div class="row">
			<c:forEach items="${characterImgs}" var="img">
				<div class="col-4 text-center">
					<img class="img-fluid" alt="" src="${img.imageUrl}">
				</div>
			</c:forEach>
		</div>




	</div>


















	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>