<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<header id="navbar">
	<nav class="navbar navbar-expand-lg"
		style="background-color: rgba(159, 197, 232, 0.6); border-bottom: 3px solid #2b2d42;">
		<div class="container-fluid">
			<!-- Home Icon -->
			<div>
				<a href="home.do" class="navbar-brand gamequest-text" href="#"
					style="color: #edf2f4;">GameQuest</a>
			</div>
			<!-- Home Icon -->

			<!-- Search form -->
			<div class="d-flex">
				<form class="d-flex" action="ShowGameDetails" method="GET">
					<input class="form-control me-2" type="search" name="id"
						placeholder="Search by ID" aria-label="Search"
						style="background-color: #edf2f4; color: #2b2d42;">
					<button class="btn btn-outline-success" type="submit"
						style="background-color: #edf2f4; color: #2b2d42; border-color: #2b2d42;">Search</button>
				</form>
			</div>
			<!-- Search form -->

			<!-- Nav content menu -->
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<!-- View all games -->
					<li class="nav-item"><a
						class="nav-link active login-register-text" aria-current="page"
						href="viewAllGames.do" style="color: #edf2f4;">View all games</a></li>
					<!-- View all games -->


					<!--BEGIN: LOGIN LOGIC -->
					<!-- GUEST NAV VIEW -->
					<c:if test="${empty loggedIn|| loggedIn.enabled==false}">
						<!-- Link log-in -->
						<li class="nav-item"><a
							class="nav-link active login-register-text" aria-current="page"
							href="login.do" style="color: #edf2f4;">Login/Register</a></li>
						<!-- Link log-in -->
					</c:if>

					<!-- USER NAV VIEW -->
					<c:if
						test="${!empty loggedIn && loggedIn.role=='user' && loggedIn.enabled==true}">
						<!-- Link user game list -->
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="viewUserGameList.do"
							style="color: #edf2f4;">Your game list</a></li>
						<!-- Link user game list -->
					</c:if>

					<!-- ADMIN NAV VIEW -->
					<c:if test="${!empty loggedIn && loggedIn.role=='admin'}">
						<!-- Link view all users -->
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="viewAllUsers.do"
							style="color: #edf2f4;">View all users</a></li>
						<!-- Link view all users -->
					</c:if>

					<!--END: LOGIN LOGIC -->

					<!-- Profile picture and Drop-down menu -->
					<c:if test="${!empty loggedIn && loggedIn.enabled==true}">
						<li class="nav-item dropdown" style="height: 35px;"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"
							style="display: inline-block; margin: auto; color: #edf2f4;">
								<div style="display: flex;">
									<div>
										<img src="${loggedIn.profilePicture}" alt="profile-picture"
											height="35px" style="border-radius: 50%">
									</div>
									<div>${loggedIn.username}</div>
									<div>
										<img
											src="https://static.thenounproject.com/png/335867-200.png"
											alt="setting-wheel" height="35px">
									</div>
								</div>
						</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="viewProfile.do"
									style="color: #2b2d42;">Profile</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="logout.do"
									style="color: #2b2d42;">Sign out</a></li>
							</ul></li>
					</c:if>
					<!-- Profile picture and Drop-down menu -->
				</ul>
			</div>
			<!-- Nav content menu -->

			<!-- Hamburger button -->
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- Hamburger button -->
		</div>
	</nav>
</header>