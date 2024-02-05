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

<title>Insert title here</title>
</head>
<body>

	<header>
		<jsp:include page="../nav.jsp" />

	</header>

	<main
		style="display: flex; flex-direction: column; height: 100vh; justify-content: center;">
		<div class="container p-4 border"
			style="max-width: 600px; margin-top: -10rem;">
			<div class="row">
				<div class="col my-4">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
								<button class="nav-link active" id="login-tab"
									data-bs-toggle="tab" data-bs-target="#login" type="button"
									role="tab" aria-controls="login" aria-selected="true"
									style="font-size: 1.5rem;">Log In</button>
						</li>
					</ul>
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active border p-4" id="login"
							role="tabpanel" aria-labelledby="login-tab">
							<p class="mt-3">Please enter your username and password to
								log in</p>
							<form action="userLogin.do" method="POST">
								<div class="mb-3">
									<label for="username" class="form-label">Username</label> <input
										type="text" class="form-control" id="username"
										aria-describedby="usernameHelp" name="username" required>
								</div>
								<div class="mb-3">
									<label for="password" class="form-label">Password</label> <input
										type="password" class="form-control" id="password"
										name="password" required>
								</div>
								<button type="submit" class="btn btn-primary">Log In</button>
							</form>
							<p id="announcement" class="mt-3 text-primary">
								Congratuation ${username}! You have successfully register an account. Please
								log in using your registered username and password.</p>
						</div>
					</div>

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