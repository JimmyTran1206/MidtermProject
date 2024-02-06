<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
</head>
<body>
    <header>
   <jsp:include page="nav.jsp" />
    </header>


    <div class="container">
        <div class="row mx-2 my-4">
            <div class="col-4">
                <h1>Game Info</h1>
            </div>
            <div class="col-8">
                <h2>Game Title</h2>
                <p>${game.title}</p>
            </div>
        </div>

        <div class="row my-2 mx-2">
            <div class="col-4">
                <img class="img-fluid" alt=""
                    src="https://imageio.forbes.com/specials-images/imageserve/65166fdaa6a52a71706371d4/Game-On--The-Top-10-Video-Game-Trends-In-2024/960x0.jpg?height=399&width=711&fit=bounds">
                <div class="d-flex justify-content-evenly">
                    <button type="button" class="btn btn-primary my-2 mx-2">Update
                        Game</button>
                    <button type="button" class="btn btn-primary my-2 mx-2">Delete
                        Game</button>
                    <button type="button" class="btn btn-primary my-2 mx-2">View
                        Game Characters</button>
                </div>
            </div>
            <div class="container">
                <h4>Description</h4>
                <p>${game.description}</p>
                <h4>Genre:</h4>
                <p>${game.genres}</p>
                <h4>Platforms:</h4>
                <p>${game.gamePlatforms}</p>
            </div>
        </div>
        <div class="row p-0 m-0">
            <div class="col-4"></div>
            <div class="col-8 d-flex align-items-left justify-content-evenly">
                <img class="img-fluid mini-img" alt=""
                    src="https://img.20mn.fr/qSH045cDT0uUvlUoWe10qA/1200x768_minecraft-s-est-vendu-a-plus-de-200-millions-d-exemplaires">
                <img class="img-fluid mini-img" alt=""
                    src="https://img.20mn.fr/qSH045cDT0uUvlUoWe10qA/1200x768_minecraft-s-est-vendu-a-plus-de-200-millions-d-exemplaires">
                <img class="img-fluid mini-img" alt=""
                    src="https://img.20mn.fr/qSH045cDT0uUvlUoWe10qA/1200x768_minecraft-s-est-vendu-a-plus-de-200-millions-d-exemplaires">
            </div>
        </div>
    </div>


    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>

<style>
    .mini-img {
        height: 150px;
        width: 150px;
    }
</style>
</html>