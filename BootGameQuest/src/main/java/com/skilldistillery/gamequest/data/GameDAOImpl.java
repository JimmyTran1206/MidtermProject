package com.skilldistillery.gamequest.data;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.skilldistillery.gamequest.entities.Game;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Transactional
@Repository
public class GameDAOImpl implements GameDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Game> getAllGames() {
		String jpql = "Select game FROM Game game";
		List<Game> games = em.createQuery(jpql, Game.class).getResultList();
		return games;
	}

	@Override
	public Game searchGameById(int id) {
		return em.find(Game.class, id);
	}

	@Override
	public Game createGame(Game game) {
		em.persist(game);
		return game;
	}

}
