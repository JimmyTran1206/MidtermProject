<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>New Game Details</title>
    <!-- Add your CSS links or styles here -->
</head>
<body>
    <h1>New Game Details</h1>
    
    <!-- Form for adding new game details -->
    <form action="addGame.do" method="post">
        <!-- Input fields for game title, trailer URL, and description -->
        <label for="title">Title:</label><br>
        <input type="text" id="title" name="title"><br>
        
        <label for="trailerUrl">Trailer URL:</label><br>
        <input type="text" id="trailerUrl" name="trailerUrl"><br>
        
        <label for="description">Description:</label><br>
        <textarea id="description" name="description"></textarea><br>
        
        <!-- Submit button -->
        <input type="submit" value="Submit">
    </form>

</body>
</html>
