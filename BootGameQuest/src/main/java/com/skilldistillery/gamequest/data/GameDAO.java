package com.skilldistillery.gamequest.data;

import java.util.List;

import com.skilldistillery.gamequest.entities.Game;

public interface GameDAO {
	
	public List<Game> getAllGames();
	
	public Game searchGameById(int id);
}
