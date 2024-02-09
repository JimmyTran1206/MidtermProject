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
<title>Game details</title>

<link rel="stylesheet" href="gameDetailStyle.css" />
</head>
<body>
	<!-- Game detail video background -->
	<video autoplay muted loop id="background-video">
		<source src="GameDetailVideoBackground.mp4" type="video/mp4" />
	</video>
	<!-- End game detail video background -->
	<header>
		<jsp:include page="nav.jsp" />
	</header>
	<main>
		<div class="container-xl game-detail-container">
			<!-- Row 1: Screenshot carousel -->
			<div class="row my-4">

				<div class="col-3"></div>
				<!-- Screenshot carousel -->
				<div class="col-6 text-center">
					<div id="screenshot-carousel" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-inner">
							<c:forEach var="screenshot" items="${screenshots}">
								<div class="carousel-item active">
									<img src="${screenshot.imageUrl }" class="d-block w-100"
										alt="..." />
								</div>
							</c:forEach>
						</div>
						<!-- Button trigger modal -->
						<button type="button" class="btn align-top" data-bs-toggle="modal"
							data-bs-target="#exampleModal"
							style="margin-top: -40px; padding: 0; color: firebrick; font-size: 48px;">
							...</button>
						<!-- End button trigger model -->

						<button class="carousel-control-prev" type="button"
							data-bs-target="#screenshot-carousel" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#screenshot-carousel" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>
				<!-- End screenshot carousel -->
				<div class="col-3"></div>
			</div>
			<!-- End of row 1 -->

			<!-- Row 2 Game title -->
			<div class="row my-4">
				<div class="col-1"></div>
				<div class="col-10 text-center">
					<h1>${game.title}</h1>
				</div>
				<div class="col-1"></div>
			</div>
			<!-- End Row 2 -->

			<!-- Row 3 Game Avatar -->
			<div class="row my-4">
				<div class="col-3"></div>

				<!-- Game avatar -->
				<div class="col-6 text-center">
					<img src="${game.avatarUrl}" alt="game avatar" width="100%" />
				</div>
				<!-- End Game Avatar -->

				<div class="col-3"></div>
			</div>
			<!-- End Row 3 -->



			<!-- Row 4 Game description -->
			<div class="row my-4">
				<div class="col-1"></div>
				<div class="col">
					<p
						style="font-size: 24px; text-align: justify; text-justify: inter-word;">
						${game.description}</p>
					<c:if test="${isOriginalPost == false }">
						<p style="font-size: 12px; text-align: center;">Originally
							posted by ${originalAuthor}</p>
					</c:if>
				</div>
				<div class="col-1"></div>
			</div>
			<!-- End Row 4 Game description -->




			<!-- Row 5 page control only show for loggedIn!=null -->
			<c:if test="${not empty loggedIn}">
				<div class="row my-4">
					<div class="col-1"></div>
					<c:if test="${gameInCurrentUserList == false }">
						<div class="col text-start">
							<a href="addGameToUserList.do?gameId=${game.id}"
								class="btn btn-primary">🩶 Add to List</a>
						</div>
					</c:if>
					<c:if test="${gameInCurrentUserList == true }">
						<div class="col text-start">
							<a href="" class="btn btn-primary">❤️</a>
						</div>
					</c:if>

					<c:if test="${allowGameDetailUpdate == true }">
						<div class="col text-center">
							<a href="viewModifyGameInfoForm.do?id=${game.id}"
								class="btn btn-primary">Modify Game Info</a>
						</div>
					</c:if>


					<div class="col text-center">
						<a href="getGameCharacters.do?gameId=${game.id}" class="btn btn-primary">View game character</a>
					</div>

					<div class="col text-end">
						<a href="viewUserGameList.do" class="btn btn-primary">My game
							list</a>
					</div>
					<div class="col-1"></div>
				</div>
			</c:if>

			<!-- End Row 5 Page control -->

			<!-- Row 6 Game trailer -->
			<div class="row my-4">
				<div class="col text-center">
					<div class="video-container">
						<iframe width="800" height="450"
							src="https://www.youtube.com/embed/${game.trailerUrl}"
							style="border-radius: 20px"> </iframe>
					</div>
				</div>
			</div>
			<!-- Row 6 game trailer -->
		</div>
	</main>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog text-center">
			<div class="modal-content"
				style="width: 800px; background: rgb(173, 14, 108); background: linear-gradient(90deg, rgba(173, 14, 108, 1) 13%, rgba(77, 9, 148, 1) 56%);">
				<div class="modal-header text-center">
					<h1 class="modal-title fs-5" id="exampleModalLabel">${game.title}</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div id="model-carousel" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-inner">
							<c:forEach var="screenshot" items="${screenshots}">
								<div class="carousel-item active">
									<img src="${screenshot.imageUrl }" class="d-block w-100"
										alt="..." />
								</div>
							</c:forEach>
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#model-carousel" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#model-carousel" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>