package com.skilldistillery.gamequest.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.gamequest.data.CharacterDAO;
import com.skilldistillery.gamequest.data.GameDAO;
import com.skilldistillery.gamequest.entities.GameCharacter;
import com.skilldistillery.gamequest.entities.GameCharacterImage;

@Controller
public class CharacterController {

	@Autowired
	private CharacterDAO charDAO;

	@Autowired
	private GameDAO gameDAO;

	@GetMapping("CharacterDetails")
	public String CharacterDetails() {
		return "CharacterDetails";
	}

	@GetMapping(path = "getCharacter.do", params = "charId")
	public String getCharacterbyId(@RequestParam("charId") int charId, Model model) {
		GameCharacter gameChar = charDAO.getCharacterById(charId);
		List<GameCharacterImage> charImages = gameChar.getCharImages();

		model.addAttribute("character", gameChar);
		model.addAttribute("characterImgs", charImages);

		return "CharacterDetails";
	}

	@PostMapping({ "addCharacter.do" })
	public String addCharacter(@ModelAttribute("character") GameCharacter character, Model model) {
		GameCharacter newCharacter = charDAO.createGameChar(character);

		int charId = newCharacter.getId();

		model.addAttribute("character", newCharacter);
		model.addAttribute("charId", charId);

		return "CharacterDetails";
	}

	@GetMapping("addNewCharacter")
	public String addNewCharacter() {
		return "GameCharacterForm";
	}

	@GetMapping("updateCharacter")
	public String updateCharacter(@ModelAttribute("charId") int charId, Model model) {
		GameCharacter characterToUpdate = charDAO.getCharacterById(charId);
		model.addAttribute("character", characterToUpdate);
		model.addAttribute("charId", characterToUpdate.getId());
		return "GameCharacterForm";
	}

	@RequestMapping(path = { "deleteCharacter.do" }, params = "charId")
	public String deleteCharacter(Model model, @RequestParam("charId") int characterId) {
		GameCharacter characterToDelete = charDAO.getCharacterById(characterId);
		String charToDelete = charDAO.deleteCharacter(characterId);
		return "CharacterDeletion";
	}

	
	@PostMapping({ "saveCharacter.do" })
	public String updateCard(@RequestParam("charId") int charId, GameCharacter character, Model model) {
		GameCharacter updatedCharacter = charDAO.updateCharacter(charId, character);
		model.addAttribute("charId", charId);
		model.addAttribute("character", updatedCharacter);
		return "CharacterDetails";
	}

}
