<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg bg-body-tertiary">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">GameQuest</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="/">Home</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="CharacterDetails">Characters</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="GameList">GameList</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> Dropdown </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">Action</a></li>
								<li><a class="dropdown-item" href="#">Another action</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="#">Something else
										here</a></li>
							</ul></li>
					</ul>
					<form class="d-flex" role="search">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
			</div>
		</nav>
	</header>


	<div class="row mx-2 my-4">
		<div class="col-4">
			<h1>Game Info</h1>
		</div>
		<div class="col-8">
			<h2>Game Title</h2>
		</div>
	</div>

	<div class="row my-2 mx-2">
		<div class="col-4">
			<img class="img-fluid" alt=""
				src="https://imageio.forbes.com/specials-images/imageserve/65166fdaa6a52a71706371d4/Game-On--The-Top-10-Video-Game-Trends-In-2024/960x0.jpg?height=399&width=711&fit=bounds">
			<div class="d-flex justify-content-evenly">
			<button type="button" class="btn btn-primary my-2 mx-2">Update
				Game</button>
			<button type="button" class="btn btn-primary my-2 mx-2">Delete
				Game</button>
			<button type="button" class="btn btn-primary my-2 mx-2">View
				Game Characters</button>
			</div>
		</div>
		<div class="col-8">
			<h4>Description</h4>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
				do eiusmod tempor incididunt ut labore et dolore magna aliqua.
				Imperdiet nulla malesuada pellentesque elit. Sagittis vitae et leo
				duis ut diam. Et malesuada fames ac turpis egestas integer eget.</p>
			<h4>Genre:</h4>
			<p>Enter Game Genre(s)</p>
			<h4>Platforms:</h4>
			<p>Enter Game Platforms</p>
		</div>
	</div>
	<div class="row p-0 m-0">
		<div class="col-4"></div>
		<div class="col-8 d-flex align-items-left justify-content-evenly">
			<img class="img-fluid mini-img" alt=""
				src="https://img.20mn.fr/qSH045cDT0uUvlUoWe10qA/1200x768_minecraft-s-est-vendu-a-plus-de-200-millions-d-exemplaires">
			<img class="img-fluid mini-img" alt=""
				src="https://img.20mn.fr/qSH045cDT0uUvlUoWe10qA/1200x768_minecraft-s-est-vendu-a-plus-de-200-millions-d-exemplaires">
			<img class="img-fluid mini-img" alt=""
				src="https://img.20mn.fr/qSH045cDT0uUvlUoWe10qA/1200x768_minecraft-s-est-vendu-a-plus-de-200-millions-d-exemplaires">
		</div>
	</div>









	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>

<style>
.mini-img {
	height: 150px;
	width: 150px;
}
</style>
</html>