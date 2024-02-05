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
</style>
</head>
<body>
	<div class="body">
		<header>
			<jsp:include page="../nav.jsp" />

		</header>
		<header>
			<div class="text-center">
				<h1>List of Users</h1>
			</div>
		</header>
		<main>
			<div class="container search-area">
				<div class="accordion" id="accordionSearch">
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingOne">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseOne"
								aria-expanded="false" aria-controls="collapseOne">
								Search User by Id</button>
						</h2>
						<div id="collapseOne" class="accordion-collapse collapse"
							aria-labelledby="headingOne" data-bs-parent="#accordionSearch">
							<div class="accordion-body">
								<div class="container form-containter">
									<form action="adminSearchUserById.do" method="GET">
										<div class="row text-center">
											<div class="col-1"></div>
											<div class="col-3">
												<label for="user-id" class="form-label">User Id</label>
											</div>
											<div class="col-4">
												<input type="number" min="2" class="form-control" id="user-id"
													name="searchId" required />
											</div>
											<div class="col-3">
												<button type="submit" class="btn btn-primary">Find
													user</button>
											</div>
											<div class="col-1"></div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingTwo">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseTwo"
								aria-expanded="false" aria-controls="collapseTwo">
								Search Users by Name</button>
						</h2>
						<div id="collapseTwo" class="accordion-collapse collapse"
							aria-labelledby="headingTwo" data-bs-parent="#accordionSearch">
							<div class="accordion-body">
								<div class="container form-containter">
									<form action="adminSearchUserByName.do" method="GET">
										<div class="row text-center">
											<div class="col-1"></div>
											<div class="col-3">
												<label for="user-name" class="form-label">Username</label>
											</div>
											<div class="col-4">
												<input type="text" class="form-control" id="user-name"
													name="searchName" required />
											</div>
											<div class="col-3">
												<button type="submit" class="btn btn-primary">Find
													users</button>
											</div>
											<div class="col-1"></div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>

		<main>
			<div class="container">
				<div class="row">
					<div class="col text-center">
						<a href="viewProfile.do" class="btn btn-success my-2 mx-2">
							Back to Admin Profile </a>
					</div>
				</div>
			</div>
		</main>

		<main>
			<div class="container user-container">
				<c:forEach var="user" items="${userList}">
					<c:if test="${user.enabled == true}">
						<section class="user-profile text-center bg-primary">
							<div class="user-name">
								<h5>${user.username}#${user.id}</h5>
							</div>
							<div>
								<a href="viewSingleUser.do?id=${user.id}"><img
									src="${user.profilePicture }" alt="" width="100%"
									height="200px"
									style="display: inline-block; border-radius: 50%" /></a>
							</div>
						</section>
					</c:if>

					<c:if test="${user.enabled == false}">
						<section class="user-profile text-center bg-danger">
							<div class="user-name">
								<h5>${user.username}#${user.id}</h5>
							</div>
							<div>
								<a href="viewSingleUser.do?id=${user.id}"><img
									src="${user.profilePicture }" alt="" width="100%"
									height="200px"
									style="display: inline-block; border-radius: 50%" /></a>
							</div>
						</section>
					</c:if>

				</c:forEach>

			</div>
		</main>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>