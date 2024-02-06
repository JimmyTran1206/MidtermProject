//package com.skilldistillery.gamequest.controllers;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.stereotype.Service;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//
//import com.skilldistillery.service.ExternalApiService;
//
//
//@Controller
//public class GameController {
//
//    @Autowired
//    private ExternalApiService externalApiService;
//    @GetMapping("/index")
//    public String index(Model model) {
//        // Fetch games from the external API
//        String gamesJson = externalApiService.fetchData();
//
//        // Process the JSON data (you may need a JSON parsing library like Jackson or Gson)
//        // For simplicity, assuming gamesJson is a JSON array of games
//
//        // Add the games to the model
//        model.addAttribute("games", gamesJson);
//
//        // Return the name of the JSP page for your homepage
//        return "index";
//    }
//}
