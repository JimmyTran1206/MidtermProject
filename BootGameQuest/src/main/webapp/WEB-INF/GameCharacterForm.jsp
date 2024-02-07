<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Game Character Form</title>
</head>
<body>
	<c:if test="${empty character}">
		<form action="addCharacter.do" method="POST">
			<h2 class="text-center mb-4">Add New Character</h2>

			<div class="form-group">
				<label for="name">Name:</label> <input type="text" id="name"
					name="name" class="form-control" required>
			</div>
			<div class="form-group">
				<label for="name">Description:</label> <input type="text"
					id="description" name="description" class="form-control" required>
			</div>
			<div class="form-group">
				<label for="name">AvatarUrl:</label> <input type="text"
					id="avatarUrl" name="avatarUrl" class="form-control" required>
			</div>
			<div class="form-group">
				<label for="name">Game Id:</label> <input type="text" id="gameId"
					name="gameId" class="form-control" required>
			</div>
			<button type="submit" class="btn btn-success btn-block">Add
				Character</button>
		</form>
	</c:if>

	<c:if test="${not empty character}">
		<form action="saveCharacter.do" method="POST">
			<h2 class="text-center mb-4">Update Character</h2>
			<div class="form-group">
				<label for="name">Name:</label> <input type="text" id="name"
					value="${character.name}" name="name" class="form-control" required>
			</div>
			<div class="form-group">
				<label for="name">Description:</label> <input type="text"
					value="${character.description}" id="description" name="description" class="form-control" required>
			</div>
			<div class="form-group">
				<label for="name">AvatarUrl:</label> <input type="text"
					value="${character.avatarUrl}" id="avatarUrl" name="avatarUrl" class="form-control" required>
			</div>
			<div class="form-group">
				<label for="name">Game Id:</label> <input type="text" id="gameId"
					value="${character.gameId}" name="gameId" class="form-control" required>
			</div>
			<button value="${character.id}" name="charId" type="submit" class="btn btn-success btn-block">Update
				Character</button>
		</form>
	</c:if>



</body>
</html>