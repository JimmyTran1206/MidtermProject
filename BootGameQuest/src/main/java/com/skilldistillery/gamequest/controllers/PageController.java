package com.skilldistillery.gamequest.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.skilldistillery.gamequest.data.UserDAO;
import com.skilldistillery.gamequest.entities.User;

@Controller
public class PageController {
	
	@Autowired
	private UserDAO userDAO;	
	
	@GetMapping("/GameDetails")
	public String GameDetails() {
		return "GameDetails";
	}
	
	@GetMapping("CharacterDetails")
	public String CharacterDeails() {
		return "CharacterDetails";
	}
	
	@GetMapping("GameList")
	public String GameList() {
		return "GameList";
	}
	
	@GetMapping("Profile")
	public String ProfilePage() {
		return "Profile";
	}
	

}
