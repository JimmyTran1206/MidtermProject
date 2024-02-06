package com.skilldistillery.gamequest.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.gamequest.data.GameDAO;
import com.skilldistillery.gamequest.entities.Game;

@Controller
public class SearchController {

	@Autowired
	private GameDAO gameDAO;

	@GetMapping("/searchById")
	public String searchGameById(@RequestParam("id") int id, Model model) {
		Game game = gameDAO.searchGameById(id);
		model.addAttribute("game", game);
		return "User/SearchResults";
	}
}
