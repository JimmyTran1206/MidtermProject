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
			<!-- Disable for guest -->
			<!-- End of row 1 -->

			<!-- Row 2 Game title -->
			<div class="row my-4">
				<div class="col-2"></div>
				<div class="col-8 text-center">
					<h1 style="display: inline-block; width: 100%; text-align: center;">${game.title}</h1>
				</div>
				<div class="col-2"></div>
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
				</div>
				<div class="col-1"></div>
			</div>
			<!-- End Row 4 Game description -->




			<!-- Row 5 page control only show for loggedIn!=null -->
			<!-- Disable this option for guest user -->
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

	

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>
