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
            background-image: url('https://images.hdqwalls.com/download/synthwave-cityscape-4k-6x-1366x768.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            color: #fff; /* Text color */
      
    </style>
</head>
<body>
    <header>
        <jsp:include page="nav.jsp" />
    </header>

<!-- Carousel -->

<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="2000">
      <img src="https://wallpapers.com/images/hd/minecraft-background-cfljc4haleghnajo.jpg" class="d-block w-100" alt="Minecraft">
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="https://external-preview.redd.it/KuFlan1EiSzWIb_X_GvL23PK9zBZK7GGJV6XDRCEQlQ.jpg?auto=webp&s=d9399f3fffa4a4c8707371b9f84d3f085a013c98" class="d-block w-100" alt="WoWarcraft">
    </div>
    <div class="carousel-item">
      <img src="https://w0.peakpx.com/wallpaper/948/534/HD-wallpaper-mortal-kombat-cool.jpg" class="d-block w-100" alt="Mortal Kombat">
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
