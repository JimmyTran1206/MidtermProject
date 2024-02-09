<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">

<title>User Profile Update</title>
<style>
body {
	background-color: #8d99ae;
	color: #2b2d42; /* Text color */
}
</style>
</head>
<body>

	<header>
		<jsp:include page="../nav.jsp" />

	</header>

	<main>
		<div class="container">
			<div class="row">
				<div class="col-12 text-center my-4">
					<h1>Updating your profile</h1>
					<progress id="progress-bar" aria-label="Content loading…"></progress>
				</div>
			</div>

			<div class="row">
				<div class="col-12 text-center my-4">
					<img src="${user.profilePicture}" width="512px" height="512px"
						style="border-radius: 50%" alt="profile picture"
						id="profile-image" />
				</div>
			</div>

			<div class="row">
				<div class="col-4"></div>

				<div class="col-4 text-center my-4">
					<form action="updateProfileConfirm.do" method="POST">
						<div class="mb-3">
							<label for="profile-URL" class="form-label">Profile image
								URL</label> <input type="text" class="form-control" id="profile-URL"
								name="profilePicture" value="${user.profilePicture}" required />
						</div>

						<div class="mb-3" style="display: none">
							<label for="id" class="form-label">id</label> <input
								type="number" class="form-control" id="id" name="id"
								value="${user.id}" />
						</div>


						<div class="mb-3">
							<label for="username" class="form-label">Username</label> <input
								type="text" class="form-control" id="username" name="username"
								value="${user.username}" required />
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">Password</label> <input
								type="password" class="form-control" id="password"
								name="password" value="${user.password}" required />
						</div>

						<div class="mb-3"
							style="display: flex; justify-content: space-between">
							<div>
								<button type="submit" class="btn btn-primary">Confirm</button>
							</div>
							<div>
								<a href="viewProfile.do" class="btn btn-primary">Cancel</a>
							</div>
						</div>
					</form>
				</div>
				<div class="col-4"></div>
			</div>
		</div>
	</main>



	<script>
      let profileImage = document.getElementById("profile-image");
      let profileURL = document.getElementById("profile-URL");
      profileURL.addEventListener("input", (e) => {
        if (e.target.value == "") {
          profileImage.setAttribute(
            "src",
            "https://cdn-icons-png.flaticon.com/512/149/149071.png"
          );
        } else {
          profileImage.setAttribute("src", e.target.value);
        }
      });
    </script>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>