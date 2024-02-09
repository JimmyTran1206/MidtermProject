package com.skilldistillery.gamequest.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

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

	@GetMapping("addNewGame")
	public String addNewGame() {
		return "NewGameForm";
	}

	@PostMapping({ "/NewGameDetails" })
	public String addCharacter(@ModelAttribute("game") Game game, Model model) {
		Game newGame = gameDAO.createGame(game);

		int gameId = newGame.getId();
		String trailerUrl = newGame.getTrailerUrl();
		String description = newGame.getDescription();

		model.addAttribute("game", newGame);
		model.addAttribute("gameId", gameId);
		model.addAttribute("trailerUrl", trailerUrl);
		model.addAttribute("description", description);

		return "NewGameDetails";
	}

}