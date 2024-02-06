<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Game Character Form</title>
</head>
<body>
	<form action="addCharacter.do" method="POST">
		<h2 class="text-center mb-4">Add New Character</h2>

		<div class="form-group">
			<label for="name">Name:</label> <input type="text" id="name"
				name="name" class="form-control" required>
		</div>
		<div class="form-group">
			<label for="name">Description:</label> <input type="text" id="description"
				name="name" class="form-control" required>
		</div>
		<div class="form-group">
			<label for="name">AvatarUrl:</label> <input type="text" id="avatarUrl"
				name="name" class="form-control" required>
		</div>
		<div class="form-group">
			<label for="name">Game Id:</label> <input type="text" id="gameId"
				name="name" class="form-control" required>
		</div>
		<div class="form-group">
			<label for="name">Character Images:</label> <input type="text" id="characterImgs"
				name="name" class="form-control">
		</div>
		<div class="form-group">
			<label for="name">Character Images:</label> <input type="text" id="characterImgs"
				name="name" class="form-control">
		</div>
		<div class="form-group">
			<label for="name">Character Images:</label> <input type="text" id="characterImgs"
				name="name" class="form-control">
		</div>	
		<button type="submit" class="btn btn-success btn-block">Add
			Character</button>
	</form>



</body>
</html>