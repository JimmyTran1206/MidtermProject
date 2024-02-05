package com.skilldistillery.gamequest.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class GameTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Game game;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAGameQuest");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		game = em.find(Game.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		game = null;
		em.close();
	}

	@Test
	void test_User_has_username() {
		assertNotNull(game);
		assertNotNull(game.getTitle());
		assertEquals("Minecraft", game.getTitle());
	}
	
	@Test
	void test_Game_rating_mapping() {
		assertNotNull(game);
		assertNotNull(game.getRating());
		assertEquals(RatingSymbol.E, game.getRating().getRating());
	}
	
	@Test
	void test_Game_Company_mapping() {
		assertNotNull(game);
		assertNotNull(game.getCompany());
		assertEquals("Microsoft", game.getCompany().getName());
	}
	
	@Test
	void test_Game_has_Game_images() {
		assertNotNull(game);
		assertNotNull(game.getGameImages());
		assertTrue(game.getGameImages().size() == 3);
	}

}
