<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">

<title>User Profile</title>
</head>
<body>

	<header>
		<jsp:include page="nav.jsp" />

	</header>
	<main>
		<div class="container">
			<div class="row">
				<div class="col-12 text-center my-4">
					<h1>Admin's Profile</h1>
				</div>
			</div>

			<div class="row">
				<div class="col-12 text-center my-4">
					<h2>Welcome to your personal dashboard</h2>
				</div>
			</div>

			<div class="row">
				<div class="col-12 text-center my-4">
					<img src="${user.profilePicture}" width="512px" height="512px"
						style="border-radius: 50%" alt="profile picture" />
				</div>
			</div>

			<div class="row">
				<div class="col-2"></div>

				<div class="col-8 text-center my-4">
					<a href="updateProfile.do" class="btn btn-primary my-2 mx-2">
						Update Profile </a>
				</div>

				<div class="col-2"></div>
			</div>

			<div class="row">
				<div class="col-12 text-center my-4">
					<h3>You currently have XXX users in GameQuest</h3>
					<form action="">
						<button type="button" class="btn btn-primary my-2 mx-2">
							View your user list</button>
					</form>
				</div>
			</div>
		</div>
	</main>








	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>