package com.skilldistillery.gamequest.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.gamequest.data.CharacterDAO;
import com.skilldistillery.gamequest.entities.GameCharacter;

@Controller
public class CharacterController {
	
	@Autowired
	private CharacterDAO charDAO;
	
	@GetMapping("CharacterDetails")
	public String CharacterDetails() {
		return "CharacterDetails";
	}
	
	@GetMapping(path="getCharacter.do", params="charId")
	public String getCharacterbyId(@RequestParam("charId") int charId, Model model) {
		GameCharacter gameChar = charDAO.getCharacterById(charId);
		model.addAttribute("character", gameChar);
		return "CharacterDetails";
	}
	
	

}
