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

.game-card {
	margin-bottom: 20px;
}

.first-card {
	margin-top: 20px;
}

.last-card {
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="nav.jsp" />
		<!-- Backdrop Button -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12 text-left mt-3">
					<button class="btn btn-primary" type="button"
						data-bs-toggle="offcanvas"
						data-bs-target="#offcanvasWithBothOptions"
						aria-controls="offcanvasWithBothOptions">List of Games</button>
				</div>
			</div>
		</div>
	</header>

	<!-- Carousel -->
	<div class="mt-5">
		<div id="carouselExampleInterval" class="carousel slide"
			data-bs-ride="carousel">
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

		<!-- Main Container -->
		<div class="container mt-5">
			<h1 class="text-center p-5 mb-5 mt-5">Top 10 games</h1>
			<div class="row">
				<!-- Game cards start here -->
				<div class="col-md-2">
					<!-- Game card 1 -->
					<div class="card game-card">
						<img
							src="https://wallpapers.com/images/hd/minecraft-background-cfljc4haleghnajo.jpg"
							class="card-img-top" alt="Minecraft">
						<div class="card-body">
							<h5 class="card-title">Game 1</h5>
							<p class="card-text">Description of Game 1.</p>
							<!-- Add any additional information or buttons here -->
						</div>
					</div>
				</div>
				<!-- Repeat the above card structure for up to 10 games -->
				<!-- Example for Game card 2 -->
				<div class="col-md-2">
					<div class="card game-card">
						<img
							src="https://wallpapercosmos.com/w/full/a/a/9/358-1920x1080-desktop-full-hd-world-of-warcraft-background-photo.jpg"
							class="card-img-top" alt="WoWarcraft">
						<div class="card-body">
							<h5 class="card-title">Game 2</h5>
							<p class="card-text">Description of Game 2.</p>
						</div>
					</div>
				</div>
				<!-- Repeat the above card structure for up to 10 games -->
				<div class="col-md-2">
					<div class="card game-card">
						<img
							src="https://wallpapercosmos.com/w/full/a/a/9/358-1920x1080-desktop-full-hd-world-of-warcraft-background-photo.jpg"
							class="card-img-top" alt="WoWarcraft">
						<div class="card-body">
							<h5 class="card-title">Game 3</h5>
							<p class="card-text">Description of Game 3.</p>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="card game-card">
						<img
							src="https://wallpapercosmos.com/w/full/a/a/9/358-1920x1080-desktop-full-hd-world-of-warcraft-background-photo.jpg"
							class="card-img-top" alt="WoWarcraft">
						<div class="card-body">
							<h5 class="card-title">Game 4</h5>
							<p class="card-text">Description of Game 4.</p>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="card game-card">
						<img
							src="https://wallpapercosmos.com/w/full/a/a/9/358-1920x1080-desktop-full-hd-world-of-warcraft-background-photo.jpg"
							class="card-img-top" alt="WoWarcraft">
						<div class="card-body">
							<h5 class="card-title">Game 5</h5>
							<p class="card-text">Description of Game 5.</p>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="card game-card">
						<img
							src="https://wallpapercosmos.com/w/full/a/a/9/358-1920x1080-desktop-full-hd-world-of-warcraft-background-photo.jpg"
							class="card-img-top" alt="WoWarcraft">
						<div class="card-body">
							<h5 class="card-title">Game 6</h5>
							<p class="card-text">Description of Game 6.</p>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="card game-card">
						<img
							src="https://wallpapercosmos.com/w/full/a/a/9/358-1920x1080-desktop-full-hd-world-of-warcraft-background-photo.jpg"
							class="card-img-top" alt="WoWarcraft">
						<div class="card-body">
							<h5 class="card-title">Game 7</h5>
							<p class="card-text">Description of Game 7.</p>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="card game-card">
						<img
							src="https://wallpapercosmos.com/w/full/a/a/9/358-1920x1080-desktop-full-hd-world-of-warcraft-background-photo.jpg"
							class="card-img-top" alt="WoWarcraft">
						<div class="card-body">
							<h5 class="card-title">Game 8</h5>
							<p class="card-text">Description of Game 8.</p>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="card game-card">
						<img
							src="https://wallpapercosmos.com/w/full/a/a/9/358-1920x1080-desktop-full-hd-world-of-warcraft-background-photo.jpg"
							class="card-img-top" alt="WoWarcraft">
						<div class="card-body">
							<h5 class="card-title">Game 9</h5>
							<p class="card-text">Description of Game 9.</p>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="card game-card">
						<img
							src="https://wallpapercosmos.com/w/full/a/a/9/358-1920x1080-desktop-full-hd-world-of-warcraft-background-photo.jpg"
							class="card-img-top" alt="WoWarcraft">
						<div class="card-body">
							<h5 class="card-title">Game 10</h5>
							<p class="card-text">Description of Game 10.</p>
						</div>
					</div>
				</div>



				<!-- Offcanvas for backdrop button -->
				<div class="offcanvas offcanvas-start" data-bs-scroll="true"
					tabindex="-1" id="offcanvasWithBothOptions"
					aria-labelledby="offcanvasWithBothOptionsLabel">
					<div class="offcanvas-header">
						<h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">List
							of all games</h5>
						<button type="button" class="btn-close"
							data-bs-dismiss="offcanvas" aria-label="Close"></button>
					</div>
					<div class="offcanvas-body">
						<p>**Games List**</p>
					</div>
				</div>



			</div>
		</div>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
			crossorigin="anonymous"></script>
</body>
</html>
