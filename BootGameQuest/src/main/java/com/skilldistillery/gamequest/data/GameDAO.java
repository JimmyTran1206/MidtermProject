package com.skilldistillery.gamequest.data;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.skilldistillery.gamequest.entities.Game;

@Repository
public interface GameDAO {
	
	public List<Game> getAllGames();
	
	public Game searchGameById(int id);
}
