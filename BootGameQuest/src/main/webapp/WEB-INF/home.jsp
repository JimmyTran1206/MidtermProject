<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Featured Games</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<style>
#navbar {
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 1000; /* Ensure it's above other content */
}

body {
	background-color: #8d99ae;
	color: #2b2d42; /* Text color */
}

#carouselExampleInterval {
	width: 60%;
	margin: auto;
}

.carousel-item img {
	border: 5px solid #2b2d42;
}

/* Offcanvas Styles */
.offcanvas-header {
	background-color: #6094c3; /* Header background color */
	color: #153d62 /* Header text color */
}

.offcanvas-body {
	background-color: #9fc5e8; /* Body background color */
	color: #153d62; /* Body text color */
}

/* Card Styles */
.card {
	margin-bottom: 20px;
}

.card-title {
	font-weight: bold;
	margin-top: 10px;
}

.card-description {
	color: #666;
}

.card iframe {
	width: 100%;
	height: 400px;
}
</style>
</head>
<body>

	<header>
		<jsp:include page="nav.jsp" />
	</header>

	<!-- Backdrop Button -->
	<div class="container-fluid"
		style="position: fixed; top: calc(50px + 0.1cm);">
		<div class="row">
			<div class="col-md-12 text-left mt-3">
				<button class="btn btn-primary" type="button"
					data-bs-toggle="offcanvas"
					data-bs-target="#offcanvasWithBothOptions"
					aria-controls="offcanvasWithBothOptions"
					style="background-color: #153d62;">List of Games</button>
			</div>
		</div>
	</div>

	<!-- Carousel -->
	<div class="mt-5" style="margin-top: 5rem !important;">
		<!-- Adjust margin-top value as needed -->
		<div id="carouselExampleInterval" class="carousel slide"
			data-bs-ride="carousel">
			<!-- Carousel items -->
			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="5000">
					<img
						src="https://wallpapers.com/images/hd/minecraft-background-cfljc4haleghnajo.jpg"
						class="d-block w-100" alt="Minecraft">
				</div>
				<div class="carousel-item" data-bs-interval="5000">
					<img
						src="https://wallpapercosmos.com/w/full/a/a/9/358-1920x1080-desktop-full-hd-world-of-warcraft-background-photo.jpg"
						class="d-block w-100" alt="WoWarcraft">
				</div>
				<div class="carousel-item" data-bs-interval="5000">
					<img
						src="https://w0.peakpx.com/wallpaper/948/534/HD-wallpaper-mortal-kombat-cool.jpg"
						class="d-block w-100" alt="Mortal Kombat">
				</div>
				<div class="carousel-item" data-bs-interval="5000">
					<img
						src="https://c4.wallpaperflare.com/wallpaper/656/869/201/call-of-duty-wallpaper-preview.jpg"
						class="d-block w-100" alt="CoDuty">
				</div>
			</div>
			<!-- Carousel navigation buttons -->
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleInterval" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
<!-- Add Game button -->
<div class="text-center mb-5">
    <a href="NewGameDetails.jsp" class="btn btn-primary">Add Game</a>
</div>
<!-- End of Add Game button -->


	<!-- Main Container -->
	<div class="container mt-5">
		<h1 class="text-center p-5 mb-5 mt-5">Top 10 games</h1>

			<!-- Cards Section -->
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div id="trailerCarousel" class="carousel slide"
							data-bs-ride="carousel">
							<div class="carousel-inner">
								<div class="carousel-item active">
									<div class="row">
										<!-- Cards 1, 2, and 3 -->
										<div class="col-md-4">
											<div class="card">
												<!-- Card 1 content goes here -->
												<div class="embed-responsive embed-responsive-16by9">
													<iframe class="embed-responsive-item"
														src="https://www.youtube.com/embed/MmB9b5njVbA?si=sz02RuXEalqudse8"
														frameborder="0" allowfullscreen></iframe>
												</div>
												<div class="card-body">
													<h5 class="card-title">Minecraft</h5>
													<p class="card-text"></p>
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<!-- Card 2 content goes here -->
											<div class="card">
												<div class="embed-responsive embed-responsive-16by9">
													<iframe class="embed-responsive-item"
														src="https://www.youtube.com/embed/vlVSJ0AvZe0?si=d1dva5nzU07IPTGe"
														frameborder="0" allowfullscreen></iframe>
												</div>
												<div class="card-body">
													<h5 class="card-title">World of Warcraft</h5>
													<p class="card-text"></p>
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<!-- Card 3 content goes here -->
											<div class="card">
												<div class="embed-responsive embed-responsive-16by9">
													<iframe class="embed-responsive-item"
														src="https://www.youtube.com/embed/UZ6eFEjFfJ0?si=qWoI4cGL_-aAl5TX"
														frameborder="0" allowfullscreen></iframe>
												</div>
												<div class="card-body">
													<h5 class="card-title">Mortal Kombat</h5>
													<p class="card-text"></p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- Repeat this structure for each set of three trailers -->
								<div class="carousel-item">
									<div class="row">
										<!-- Cards 4, 5, and 6 -->
										<div class="col-md-4">
											<div class="card">
												<!-- Card 4 content goes here -->
												<div class="embed-responsive embed-responsive-16by9">
													<iframe class="embed-responsive-item"
														src="https://www.youtube.com/embed/ztjfwecrY8E?si=RVG2lOfS9DDjNOt1"
														frameborder="0" allowfullscreen></iframe>
												</div>
												<div class="card-body">
													<h5 class="card-title">Call of Duty</h5>
													<p class="card-text"></p>
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<!-- Card 5 content goes here -->
											<div class="card">
												<div class="embed-responsive embed-responsive-16by9">
													<iframe class="embed-responsive-item"
														src="https://www.youtube.com/embed/uHGShqcAHlQ?si=d2z0sX8yaJZAZy5F"
														frameborder="0" allowfullscreen></iframe>
												</div>
												<div class="card-body">
													<h5 class="card-title">Zelda</h5>
													<p class="card-text"> </p>
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<!-- Card 6 content goes here -->
											<div class="card">
												<div class="embed-responsive embed-responsive-16by9">
													<iframe class="embed-responsive-item"
														src="https://www.youtube.com/embed/arEdruKxrQ8?si=QVZABL5KEuYH0r8x"
														frameborder="0" allowfullscreen></iframe>
												</div>
												<div class="card-body">
													<h5 class="card-title">Resident Evil</h5>
													<p class="card-text"></p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="carousel-item">
									<div class="row">
										<!-- Cards 7, 8, and 9 -->
										<div class="col-md-4">
											<div class="card">
												<!-- Card 7 content goes here -->
												<div class="embed-responsive embed-responsive-16by9">
													<iframe class="embed-responsive-item"
														src="https://www.youtube.com/embed/Ovt7d34_hRA?si=AptYuOCxS412bgMo"
														frameborder="0" allowfullscreen></iframe>
												</div>
												<div class="card-body">
													<h5 class="card-title">Age of Empires</h5>
													<p class="card-text"></p>
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<!-- Card 8 content goes here -->
											<div class="card">
												<div class="embed-responsive embed-responsive-16by9">
													<iframe class="embed-responsive-item"
														src="https://www.youtube.com/embed/QdBZY2fkU-0?si=CJ3wCDq9yjMOp2Up"
														frameborder="0" allowfullscreen></iframe>
												</div>
												<div class="card-body">
													<h5 class="card-title">GTA</h5>
													<p class="card-text"></p>
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<!-- Card 9 content goes here -->
											<div class="card">
												<div class="embed-responsive embed-responsive-16by9">
													<iframe class="embed-responsive-item"
														src="https://www.youtube.com/embed/ZcYdoEju54c?si=1IcAb5EfcfmWjNBL"
														frameborder="0" allowfullscreen></iframe>
												</div>
												<div class="card-body">
													<h5 class="card-title">Yakuza</h5>
													<p class="card-text"></p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="carousel-item">
								 <div class="row justify-content-center">
									
										<!-- Card 10 -->
										<div class="col-md-4">
											<div class="card">
												<!-- Card 1 content goes here -->
												<div class="embed-responsive embed-responsive-16by9">
													<iframe class="embed-responsive-item"
														src="https://www.youtube.com/embed/K0u_kAWLJOA?si=IuG9szqZ4Rl0KhzN"
														frameborder="0" allowfullscreen></iframe>
												</div>
												<div class="card-body">
													<h5 class="card-title">God of War</h5>
													<p class="card-text"></p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- Add more carousel items as needed -->
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#trailerCarousel" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#trailerCarousel" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					</div>
				</div>
			</div>
			<!-- End of Cards Section -->


		<!-- Offcanvas for backdrop button -->
			<%@ include file="OffCanvas.jsp"%>
			<div class="offcanvas offcanvas-start" data-bs-scroll="true"
				tabindex="-1" id="offcanvasWithBothOptions"
				aria-labelledby="offcanvasWithBothOptionsLabel">
				<div class="offcanvas-header">
					<h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">List
						of all games</h5>
					<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
						aria-label="Close"></button>
				</div>
				<div class="offcanvas-body">
					<ul>
						<!-- Iterate over the list of games and display id, title, and description -->
						<c:forEach var="game" items="${gameList}">
							<li>ID: ${game.id}</li>
							<li>Title: ${game.title}</li>
							<li>Description: ${game.description}</li>
						</c:forEach>
					</ul>
				</div>
			</div>

			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
				crossorigin="anonymous"></script>
</body>
</html>
