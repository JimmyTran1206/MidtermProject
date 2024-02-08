package com.skilldistillery.gamequest.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.skilldistillery.gamequest.data.GameDAO;
import com.skilldistillery.gamequest.entities.Game;

@Controller
public class GameController {

	@Autowired
	private GameDAO gameDAO;

    @GetMapping("/OffCanvas")
    public String getAllGames(Model model) {
        List<Game> gameList = gameDAO.getAllGames();
        model.addAttribute("gameList", gameList);
        return "OffCanvas"; 
    }
}