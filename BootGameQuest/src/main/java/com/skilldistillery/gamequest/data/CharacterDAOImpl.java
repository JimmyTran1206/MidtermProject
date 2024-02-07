package com.skilldistillery.gamequest.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.gamequest.entities.GameCharacter;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Transactional
@Service
public class CharacterDAOImpl implements CharacterDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<GameCharacter> getAllCharacters() {
		String jpql = "SELECT character FROM GameCharacter character";
		List<GameCharacter> characters = em.createQuery(jpql, GameCharacter.class).getResultList();
		return characters;
	}

	@Override
	public List<GameCharacter> getCharactersByGameId() {
		return null;
	}

	@Override
	public GameCharacter getCharacterById(int id) {
		GameCharacter gameChar = em.find(GameCharacter.class, id);
		return gameChar;
	}

	@Override
	public GameCharacter createGameChar(GameCharacter character) {
		em.persist(character);
		return character;
	}

	@Override
	public String deleteCharacter(int characterId) {
		
		GameCharacter foundCharacter = em.find(GameCharacter.class, characterId);
		
		em.remove(foundCharacter);
		em.flush();
		return "Character Deleted";
	}

	@Override
	public GameCharacter updateCharacter(int charId, GameCharacter character) {
		GameCharacter updateCharacter = em.find(GameCharacter.class, charId);
		if(updateCharacter != null) {
			updateCharacter.setName(character.getName());
			updateCharacter.setDescription(character.getDescription());
			updateCharacter.setAvatarUrl(character.getAvatarUrl());
			updateCharacter.setGameId(character.getGameId());	
		}
		return updateCharacter;
	}
	
	
}
