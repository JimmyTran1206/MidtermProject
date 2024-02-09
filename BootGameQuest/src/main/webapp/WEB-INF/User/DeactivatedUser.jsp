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

<title>User Account Deactivated</title>
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

	<main
		style="display: flex; flex-direction: column; height: 100vh; justify-content: center;">
		<div class="container p-4 border"
			style="max-wdth: 800px; margin-top: -10rem;">
			<div class="row">
				<div class="col my-4">
					<p style="color: firebrick;" id="announcement" class="mt-3">
						Your account has been deactivated. Please contact the
						administrator for more details. You can return <a href="home.do"
							class="text-primary text-decoration-none">home</a> or <a
							href="login.do" class="text-primary text-decoration-none">log
							in </a> using annother account, or <a href="register.do"
							class="text-primary text-decoration-none">register</a> a new
						account.
					</p>
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