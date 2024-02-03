package com.skilldistillery.gamequest.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.skilldistillery.gamequest.data.UserDAO;
import com.skilldistillery.gamequest.entities.User;


@Controller
public class UserController {
	@Autowired
	private UserDAO userDAO;
	
	@GetMapping(value={"/", "home.do", ""})
	public String home(Model model) {
		User u = userDAO.authenticateUser("admin", "admin");
		model.addAttribute("loggedIn", u);
		return "home";
	}
}
