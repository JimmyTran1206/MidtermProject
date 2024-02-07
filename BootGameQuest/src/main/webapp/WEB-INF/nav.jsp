<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<nav class="navbar navbar-expand-lg bg-body-tertiary">
	<div class="container-fluid"
		style="display: flex; justify-content: space-between;">

		<!-- Home Icon -->
		<div>
			<a href="home.do" class="navbar-brand" href="#">GameQuest</a>
		</div>
		<!-- Home Icon -->


		<!-- Search form -->
        <div>
            <form class="d-flex" action="ShowGameDetails" method="GET">
                <input class="form-control me-2" type="search" name="id" placeholder="Search by ID" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
        <!-- Search form -->


		<!-- Nav content menu -->
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">

				<!-- Link View top 10 -->
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#">View all games</a></li>
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
						aria-current="page" href="viewUserGameList.do">My game list</a></li>
					<!-- Link user game list -->


				</c:if>

				<!-- ADMIN NAV VIEW -->
				<c:if test="${!empty loggedIn && loggedIn.role=='admin'}">

					<!-- Link view all users -->
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="viewAllUsers.do">View all users</a></li>
					<!-- Link view all users -->

				</c:if>

				<!--END: LOGIN LOGIC -->


				<!-- Profile picture and Drop-down menu -->
				<c:if test="${!empty loggedIn && loggedIn.enabled==true}">

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"
						style="display: inline-block; margin: auto">
							<div style="display: flex;">
								<div>
									<img src="${loggedIn.profilePicture}" alt="profile-picture"
										height="50px">
								</div>
								<div>${loggedIn.username}</div>
								<div>
									<img src="https://static.thenounproject.com/png/335867-200.png"
										alt="setting-wheel" height="50px">
								</div>
							</div>
					</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="viewProfile.do">Profile</a></li>
							<li><a class="dropdown-item" href="logout.do">Sign out</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>

				</c:if>

				<!-- Profile picture and Drop-down menu -->

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
