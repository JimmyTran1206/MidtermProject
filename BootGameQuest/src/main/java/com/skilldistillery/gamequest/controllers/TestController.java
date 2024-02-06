//package com.skilldistillery.gamequest.controllers;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.skilldistillery.gamequest.entities.Game;
//import com.skilldistillery.service.GameService;
//
//@Controller
//@RequestMapping("/test")
//public class TestController {
//
//    @Autowired
//    private GameService gameService;
//
//    @GetMapping("/games")
//    public String testGameService(Model model) {
//        // Retrieve the game data from the IGDB API
//        String gameData = gameService.getGameData();
//
//        // You need to parse the JSON response and extract relevant information here
//        // For simplicity, let's assume you have a method to parse the response and get a list of games
//        // Replace this line with the actual logic to parse the JSON response and get a List<Game>
//        // List<Game> games = parseGameData(gameData);
//
//        // For demonstration purposes, let's assume you have a dummy list of games
//        // Replace this line with the actual list of games obtained from parsing
//        java.util.List<Game> games = getDummyGames();
//
//        model.addAttribute("games", games);
//
//        // Return the Thymeleaf template name
//        return "index";
//    }
//
//    private java.util.List<Game> getDummyGames() {
//        // This is a dummy method to simulate having a list of games
//        // In a real scenario, you need to parse the JSON response from the IGDB API
//        // and create a List<Game> with the relevant information
//        // Replace this with the actual logic to parse the JSON response
//
//        // Here, we're just creating a list of three dummy games for demonstration purposes
//        List<Game> dummyGames = new ArrayList<>();
//
//        return dummyGames;
//    }
//}
