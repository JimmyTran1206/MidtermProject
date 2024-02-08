<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<title>Document</title>
<style>
.user-profile {
	display: flex;
	flex-direction: column;
	width: 220px;
	height: 300px;
	border-radius: 10px;
	margin: 20px;
	padding: 10px;
}

.user-profile:hover {
	cursor: pointer;
	position: relative;
	top: -3px;
	left: -3px;
}

.user-name {
	height: 60px;
	padding-top: 10px;
	overflow-wrap: break-word;
	overflow: hidden;
}

.user-profile-picture {
	padding-top: 10px;
}

.user-container {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	max-width: 1200px;
	margin: 1.5rem auto;
}

.search-area {
	max-width: 600px;
	margin: 1.5rem auto;
	text-align: center;
}

.body {
	display: flex;
	flex-direction: column;
	width: 100vw;
}

.game-tab {
	background: rgb(131, 58, 180);
	background: linear-gradient(90deg, rgba(131, 58, 180, 1) 9%,
		rgba(187, 20, 20, 1) 54%, rgba(252, 176, 69, 1) 89%);
}
</style>
</head>
<body>
	<div class="body">
		<header>
			<jsp:include page="../nav.jsp" />
		</header>
		<!-- Control session -->
		<main>
			<div class="container">
				<div class="row">
					<div class="col text-center my-4">
						<h1>Welcome to your favorite game list</h1>
					</div>
				</div>
				
				<div class="row">
					<div class="col-1"></div>

					<div class="col-2 text-center my-4">
						<a href="home.do" class="btn btn-primary my-2 mx-2">
							Home </a>
					</div>
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
					
					<div class="col-2 text-center my-4">
						<a href="viewProfile.do" class="btn btn-primary my-2 mx-2">
						 Profile  </a>
					</div>
					<div class="col-1"></div>
				</div>
			</div>
		</main>
		<main>
			<div class="container user-container">

				<c:choose>

					<c:when test="${empty gameList}">
						<h3>There is no game in your list</h3>
					</c:when>


					<c:otherwise>
						<c:forEach var="game" items="${gameList}">
							<section class="user-profile text-center game-tab">
								<div class="game-title">
									<h5>${game.title}</h5>
								</div>
								<div>
									<a href="viewGameDetails.do?id=${game.id}"><img src="${game.avatarUrl}" alt="" width="100%"
										height="200px" style="display: inline-block" /></a>
								</div>
								<div>
									<a href="removeGameFromUserList.do?id=${game.id}" class="btn btn-warning my-2 mx-2">Remove this game</a>
								</div>
							</section>
						</c:forEach>
					</c:otherwise>
				</c:choose>




			</div>
		</main>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>
