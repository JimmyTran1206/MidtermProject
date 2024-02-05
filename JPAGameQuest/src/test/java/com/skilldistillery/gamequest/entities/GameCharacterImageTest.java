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

class GameCharacterImageTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private GameCharacterImage charImg;

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
		charImg = em.find(GameCharacterImage.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		charImg = null;
		em.close();
	}

	@Test
	void test_GameCharacter_has_username() {
		assertNotNull(charImg);
		assertNotNull(charImg.getGameCharacter().getId());
		assertEquals(5, charImg.getGameCharacter().getId());	
	}

}
