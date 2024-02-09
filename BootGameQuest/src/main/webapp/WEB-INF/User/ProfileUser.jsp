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
<style>
body {
	background-color: #8d99ae;
	color: #2b2d42; /* Text color */
}
</style>
</head>
<body>

	<header>
		<jsp:include page="../nav.jsp" />

	</header>
	<main>
		<div class="container">
			<div class="row">
				<div class="col-12 text-center my-4">
					<h1>${user.username}'sProfile</h1>
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

				<div class="col-4 text-center my-4">
					<a href="updateProfile.do" class="btn btn-primary my-2 mx-2">
						Update Profile </a>
				</div>
				<div class="col-4 text-center my-4">
					<a href="userSelfDeactivate.do" class="btn btn-primary my-2 mx-2">
						Deactivate account </a>
				</div>
				<div class="col-2"></div>
			</div>

			<div class="row">
				<div class="col-12 text-center my-4">
					<h3>You currently have ${numberOfGames} games in your list</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-3"></div>
				<div class="col-6 text-center my-4">
					<section>
						<div class="accordion" id="accordionAddNewGame">
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingTwo">
									<button class="accordion-button collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo">
										Add a game to your list</button>
								</h2>
								<div id="collapseTwo" class="accordion-collapse collapse"
									aria-labelledby="headingTwo"
									data-bs-parent="#accordionAddNewGame">
									<div class="accordion-body">
										<div class="container form-containter">
											<form action="userAddGame.do" method="GET">
												<div class="row text-center">
													<div class="col-3">
														<label for="game-title" class="form-label">Game
															Title</label>
													</div>
													<div class="col-6">
														<input type="text" min="2" class="form-control"
															id="game-title" name="gameTitle" required />
													</div>
													<div class="col-3">
														<button type="submit" class="btn btn-primary">
															Add game</button>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
				<div class="col-3"></div>
			</div>
			<div class="row">
				<div class="col-12 text-center my-2">
					<a href="viewUserGameList.do" class="btn btn-primary my-2 mx-2">
						View my game list </a>

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