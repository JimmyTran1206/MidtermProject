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
        }

        .card {
            border: none;
            transition: transform 0.3s;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card img {
            height: 200px;
            object-fit: cover;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }

        .card-title {
            font-size: 1.5rem;
            color: #fff;
        }

        .card-text {
            color: #f8f9fa; /* Light gray text color */
        }

        .btn-primary {
            background-color: #dc3545;
            border: none;
        }

        .btn-primary:hover {
            background-color: #c82333;
        }

        /* Custom class for the smaller character ID input */
        .small-input {
            width: 150px; /* Adjust the width as needed */
        }
    </style>
</head>
<body>
    <header>
        <jsp:include page="nav.jsp" />
    </header>

    <div class="container my-5">
        <h1 class="text-center mb-5">Featured Games</h1>
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <c:forEach items="${games}" var="game">
                <div class="col">
                    <div class="card h-100 shadow">
                        <img src="${game.trailerUrl}" class="card-img-top" alt="${game.title}">
                        <div class="card-body">
                            <h5 class="card-title">${game.title}</h5>
                            <p class="card-text">${game.description}</p>
                            <a href="#" class="btn btn-primary btn-block">View Details</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <form action="gerCharacter.do" method="GET" class="text-center my-5">
        <div class="row justify-content-center"> <!-- Center the row -->
            <div class="col-auto"> <!-- Use auto layout for centering -->
                <label for="charId" style="color: #fff;">Character ID:</label>
            </div>
        </div>
        <div class="row justify-content-center"> <!-- Center the row -->
            <div class="col-auto"> <!-- Use auto layout for centering -->
                <!-- Adding the small-input class to make the input field smaller -->
                <input type="text" name="charId" id="charId" class="form-control mb-3 small-input">
            </div>
        </div>
        <div class="row justify-content-center"> <!-- Center the row -->
            <div class="col-auto"> <!-- Use auto layout for centering -->
                <input type="submit" value="Show Character" class="btn btn-primary">
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
