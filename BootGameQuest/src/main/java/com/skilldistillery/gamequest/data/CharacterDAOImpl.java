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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GameCharacter> getCharactersByGameId() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public GameCharacter getCharacterById(int id) {
		GameCharacter gameChar = em.find(GameCharacter.class, id);
		return gameChar;
	}

	@Override
	public GameCharacter createGameChar(GameCharacter character) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
