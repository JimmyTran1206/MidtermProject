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

<title>Deactivated User</title>
</head>
<body>

	<header>
		<jsp:include page="../nav.jsp" />

	</header>

	<main
		style="display: flex; flex-direction: column; height: 100vh; justify-content: center;">
		<div class="container p-4 border"
			style="max-wdth: 800px; margin-top: -10rem;">
			<div class="row">
				<div class="col my-4">
					<h3 class="text-warning">Confirm deactivation</h3>
					<p style="color: firebrick;" id="announcement" class="mt-3">
						This will deactivate your account and you can no longer log-in
						using this account. Do you want to continue?</p>
				</div>
				<div class="row">

				<div class="col-6 text-center my-4">
					<a href="userSelfDeactivateConfirmed.do" class="btn btn-primary my-2 mx-2">
							Yes, continue with deactivation.
					</a>
				</div>
				
				<div class="col-6 text-center my-4">
					<a href="viewProfile.do" class="btn btn-primary my-2 mx-2">
							No, not right now.
					</a>
				</div>
			</div>
			</div>

		</div>
	</main>

	<script>
    let registerTab=document.getElementById("register-tab");
    let announcement=document.getElementById("announcement");
    registerTab.addEventListener("click", ()=>announcement.classList.add("hidden"));
</script>










	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>