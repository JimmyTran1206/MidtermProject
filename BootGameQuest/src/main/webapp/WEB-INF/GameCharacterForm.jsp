<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Game Character Form</title>
</head>
<body>
	<c:if test="${empty character}">
		<div class="container-fluid">
			<div class="row mx-4 my-4">
				<div class="col-12">
					<form action="addCharacter.do" method="POST">
						<h2 class="text-center mb-4">Add New Character</h2>

						<div class="form-group">
							<label for="name">Name:</label> <input type="text" id="name"
								name="name" class="form-control" required>
						</div>
						<div class="form-group">
							<label for="name">Description:</label> <input type="text"
								id="description" name="description" class="form-control"
								required>
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
				</div>
			</div>
		</div>
	</c:if>

	<c:if test="${not empty character}">
		<div class="container-fluid">
			<div class="row mx-4 my-4">
				<div class="col-12">
					<form action="saveCharacter.do" method="POST">
						<h2 class="text-center mb-4">Update Character</h2>
						<div class="form-group">
							<label for="name">Name:</label> <input type="text" id="name"
								value="${character.name}" name="name" class="form-control"
								required>
						</div>
						<div class="form-group">
							<label for="name">Description:</label> <input type="text"
								value="${character.description}" id="description"
								name="description" class="form-control" required>
						</div>
						<div class="form-group">
							<label for="name">AvatarUrl:</label> <input type="text"
								value="${character.avatarUrl}" id="avatarUrl" name="avatarUrl"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label for="name">Game Id:</label> <input type="text" id="gameId"
								value="${character.gameId}" name="gameId" class="form-control"
								required>
						</div>
						<button value="${character.id}" name="charId" type="submit"
							class="btn btn-success btn-block">Update Character</button>
					</form>
				</div>
			</div>
		</div>
	</c:if>


	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>