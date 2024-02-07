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
						<h1>Similar games as your input title</h1>
					</div>
				</div>
				
				<div class="row">
					<div class="col-2"></div>

					<div class="col-4 text-center my-4">
						<a href="viewUserAddGameForm.do?title=${gameTitle}" class="btn btn-primary my-2 mx-2">
							Proceed to add a new game anyway </a>
					</div>
					
					<div class="col-4 text-center my-4">
						<a href="viewUserGameList.do" class="btn btn-primary my-2 mx-2">
							Back to my favorite game list </a>
					</div>
					
					<div class="col-2"></div>
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
									<a href=""><img src="${game.avatarUrl}" alt="" width="100%"
										height="200px" style="display: inline-block" /></a>
								</div>
								<div>
									<a href="" class="btn btn-primary my-2 mx-2">View Details</a>
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
