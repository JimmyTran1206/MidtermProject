package com.skilldistillery.gamequest.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.skilldistillery.gamequest.data.GameDAO;
import com.skilldistillery.gamequest.data.UserDAO;
import com.skilldistillery.gamequest.entities.Game;

@Controller
public class PageController {

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private GameDAO gameDAO;

	@GetMapping("/GameDetails")
	public String GameDetails() {
		return "GameDetails";
	}

	@GetMapping("GameList")
	public String GameList() {
		return "GameList";
	}

	@GetMapping("Profile")
	public String ProfilePage() {
		return "Profile";
	}

	@GetMapping(path = { "/", "home.do", "" })
	public String index(Model model) {
		List<Game> games = gameDAO.getAllGames();
		model.addAttribute("gameList", games);
		return "home";
	}

}
