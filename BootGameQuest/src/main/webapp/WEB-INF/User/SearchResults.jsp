<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
</head>
<body>
    <h1>Search Results</h1>
    <%-- Check if there is a result to display --%>
    <c:if test="${not empty result}">
        <div>
            <h2>Game Details</h2>
            <p>ID: ${game.id}</p>
            <p>Title: ${game.title}</p>
            <p>Description: ${game.description}</p>
            <p>Genre: ${game.genre}</p>
            <p>Release Year: ${game.releaseYear}</p>
        </div>
    </c:if>
    
    <%-- If no result found, display appropriate message --%>
    <c:if test="${empty result}">
        <p>No game found with the provided ID.</p>
    </c:if>
    
</body>
</html>