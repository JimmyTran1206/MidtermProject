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

class GameImageTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private GameImage gameImg;

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
		gameImg = em.find(GameImage.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		gameImg = null;
		em.close();
	}

	@Test
	void test_User_has_username() {
		assertNotNull(gameImg);
		assertNotNull(gameImg.getGameId());
		assertEquals(1, gameImg.getGameId());

	}

}
