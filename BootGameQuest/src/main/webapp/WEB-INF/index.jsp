<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IGDB Games</title>
</head>
<body>

<h1>Top 10 Games from IGDB</h1>

<div th:each="game, iterStat : ${games}">
    <h2 th:text="${iterStat.index + 1 + '. ' + game.name}"></h2>
    <p th:text="${game.summary}"></p>
    <hr>
</div>

</body>
</html>
