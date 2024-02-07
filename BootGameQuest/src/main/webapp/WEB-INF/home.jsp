<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Featured Games</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        body {
            background-color: #000; /* Black background */
            color: #fff; /* Text color */
        }
        #carouselExampleInterval {
            width: 60%; 
            margin: auto; 
        }
    </style>
</head>
<body>
    <header>
        <jsp:include page="nav.jsp" />
    </header>

    <!-- Carousel -->
    <div class="mt-5">
    <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
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
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <!-- Main Container -->
    <div class="container">
        <h1 class="text-center p-5 mb-5 mt-5"> Top 10 games</h1>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
