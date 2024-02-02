<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<nav class="navbar navbar-expand-lg bg-body-tertiary">
	<div class="container-fluid">

		<!-- Home Icon -->
		<a class="navbar-brand" href="#">GameQuest</a>
		<!-- Home Icon -->


		<!-- Search form -->
		<form class="d-flex" role="search">
			<input class="form-control me-2" type="search" placeholder="Search"
				aria-label="Search">
			<button class="btn btn-outline-success" type="submit">Search</button>
		</form>
		<!-- Search form -->


		<!-- Nav content menu -->
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">

				<!-- Link View top 10 -->
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#">View top 10 games</a></li>
				<!-- Link View top 10 -->

				<!--BEGIN: LOGIN LOGIC -->
				<!-- GUEST NAV VIEW -->
				<c:if test="${empty loggedIn|| loggedIn.enabled==false}">
					<!-- Link log-in -->
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="login.do">Login/Register</a></li>
					<!-- Link log-in -->
				</c:if>

				<!-- USER NAV VIEW -->
				<c:if
					test="${!empty loggedIn && loggedIn.role=='user' && loggedIn.enabled==true}">
					<!-- Link user game list -->
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="">Your game list</a></li>
					<!-- Link user game list -->

					<!-- Link log out -->
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="logout.do">Sign out</a></li>
					<!-- Link log out -->
				</c:if>

				<!-- ADMIN NAV VIEW -->
				<c:if test="${!empty loggedIn && loggedIn.role=='admin'}">

					<!-- Link view all users -->
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="">View all users</a></li>
					<!-- Link view all users -->

					<!-- Link log out -->
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="logout.do">Sign out</a></li>
					<!-- Link log out -->
				</c:if>

				<!--END: LOGIN LOGIC -->


				<!-- Drop-down menu -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> Dropdown </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">Action</a></li>
						<li><a class="dropdown-item" href="#">Another action</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">Something else here</a></li>
					</ul></li>
				<!-- Drop-down menu -->

				<!-- Profile picture -->
				<c:if test="${!empty loggedIn && loggedIn.enabled==true}">
					<li class="nav-item">
						<div style="display: flex;">
							<div>
								<img src="${loggedIn.profilePicture}" alt="profile-picture" height="50px">
							</div>
							<div>${loggedIn.username}</div>
						</div>
					</li>
				</c:if>
				<!-- Profile picture -->
			</ul>
		</div>
		<!-- Nav content menu -->

		<!-- Hamburger button -->
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<!-- Hamburger button -->
	</div>
</nav>

