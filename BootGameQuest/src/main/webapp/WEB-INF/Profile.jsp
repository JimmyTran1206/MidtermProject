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
				<div class="col-12 my-4">
					<div class="text-center">
						<h1>User Dashboard</h1>
					</div>
					<div class="text-center">
						<h3>Welcome User Name</h3>
					</div>
					<div class="text-center my-4">
						<h4>Insert Profile Picture</h4>
					</div>
				</div>
				<div class="col-12 text-center">
					<button type="button" class="btn btn-primary my-2 mx-2">Update
						Profile</button>
					<button type="button" class="btn btn-primary my-2 mx-2">Delete
						Profile</button>
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