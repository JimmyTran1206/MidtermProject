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

#navbar {
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 1000; /* Ensure it's above other content */
}

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
       
     /* Mini Carousel Styles */
    .mini-carousel {
        position: relative;
        overflow: hidden;
    }

   .mini-carousel .carousel-inner {
    display: flex;
    flex-wrap: nowrap; /* Ensure items don't wrap to the next line */
}

.mini-carousel .carousel-item {
    flex: 0 0 auto;
    width: 20%; /* Each carousel item occupies 20% width */
}

.mini-carousel .carousel-item img {
    max-width: 100%; /* Adjust the width of mini carousel images */
    height: auto; /* Maintain aspect ratio */
}


/* Offcanvas Styles */
.offcanvas-header {
    background-color: #6094c3; /* Header background color */
    color: #153d62 /* Header text color */
}

.offcanvas-body {
    background-color: #9fc5e8; /* Body background color */
    color: #153d62; /* Body text color */
}



    @keyframes scroll {
        0% {
            transform: translateX(0%);
        }
        100% {
            transform: translateX(-100%);
        }
    }
</style>
</head>
<body>
    <header>
        <jsp:include page="nav.jsp" />
    </header>
 <!-- Backdrop Button -->
    <div class="container-fluid" style="position: fixed; top: calc(50px + 0.1cm);">
        <div class="row">
            <div class="col-md-12 text-left mt-3">
                <button class="btn btn-primary" type="button"
                    data-bs-toggle="offcanvas"
                    data-bs-target="#offcanvasWithBothOptions"
                    aria-controls="offcanvasWithBothOptions"
                    style="background-color: #153d62;">List of Games</button>
            </div>
        </div>
    </div>

    </header>

	<!-- Carousel -->
<div class="mt-5" style="margin-top: 5rem !important;"> <!-- Adjust margin-top value as needed -->
    <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
        <!-- Carousel items -->
        <div class="carousel-inner">
            <div class="carousel-item active" data-bs-interval="5000">
                <img src="https://wallpapers.com/images/hd/minecraft-background-cfljc4haleghnajo.jpg" class="d-block w-100" alt="Minecraft">
            </div>
            <div class="carousel-item" data-bs-interval="5000">
                <img src="https://wallpapercosmos.com/w/full/a/a/9/358-1920x1080-desktop-full-hd-world-of-warcraft-background-photo.jpg" class="d-block w-100" alt="WoWarcraft">
            </div>
            <div class="carousel-item" data-bs-interval="5000">
                <img src="https://w0.peakpx.com/wallpaper/948/534/HD-wallpaper-mortal-kombat-cool.jpg" class="d-block w-100" alt="Mortal Kombat">
            </div>
            <div class="carousel-item" data-bs-interval="5000">
                <img src="https://c4.wallpaperflare.com/wallpaper/656/869/201/call-of-duty-wallpaper-preview.jpg" class="d-block w-100" alt="CoDuty">
            </div>
        </div>
        <!-- Carousel navigation buttons -->
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>
		<!-- Main Container -->
		<div class="container mt-5">
			<h1 class="text-center p-5 mb-5 mt-5">Top 10 games</h1>
			<div class="row">
			
			
		<!-- Mini Carousel -->
<div class="container mt-5">
    <div class="row">
        <div class="col-md-12 mt-5">
            <div id="miniCarousel" class="carousel mini-carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="https://wallpapers.com/images/hd/minecraft-background-cfljc4haleghnajo.jpg" class="d-block w-20" alt="Minecraft">
                        <img src="https://via.placeholder.com/200" class="d-block w-20" alt="Game 2">
                        <img src="https://via.placeholder.com/200" class="d-block w-20" alt="Game 3">
                        <img src="https://via.placeholder.com/200" class="d-block w-20" alt="Game 4">
                        <img src="https://via.placeholder.com/200" class="d-block w-20" alt="Game 5">
                    </div>
                    <div class="carousel-item">
                        <img src="https://wallpapercosmos.com/w/full/a/a/9/358-1920x1080-desktop-full-hd-world-of-warcraft-background-photo.jpg" class="d-block w-20" alt="WoWarcraft">
                        <img src="https://via.placeholder.com/200" class="d-block w-20" alt="Game 7">
                        <img src="https://via.placeholder.com/200" class="d-block w-20" alt="Game 8">
                        <img src="https://via.placeholder.com/200" class="d-block w-20" alt="Game 9">
                        <img src="https://via.placeholder.com/200" class="d-block w-20" alt="Game 10">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Offcanvas for backdrop button -->
  <%@ include file="OffCanvas.jsp" %>
<div class="offcanvas offcanvas-start" data-bs-scroll="true"
    tabindex="-1" id="offcanvasWithBothOptions"
    aria-labelledby="offcanvasWithBothOptionsLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">List of all games</h5>
        <button type="button" class="btn-close"
            data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <ul>
            <!-- Iterate over the list of games and display id, title, and description -->
            <c:forEach var="game" items="${gameList}">
                <li>ID: ${game.id}</li>
                <li>Title: ${game.title}</li>
                <li>Description: ${game.description}</li>
            </c:forEach>
        </ul>
    </div>
</div>


		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
			crossorigin="anonymous"></script>
			<script>
      // Activate carousel
    var miniCarousel = document.getElementById('miniCarousel');
    var carousel = new bootstrap.Carousel(miniCarousel, {
        interval: 3000, // Set interval to 3 seconds
        wrap: true // Enable looping
    });
</script>
</body>
</html>
