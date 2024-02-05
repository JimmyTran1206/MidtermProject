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

class GameCharacterTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private GameCharacter character;

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
		character = em.find(GameCharacter.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		character = null;
		em.close();
	}

	@Test
	void test_User_has_username() {
		assertNotNull(character);
		assertNotNull(character.getName());
		assertEquals("Ender dragon", character.getName());

	}
	@Test
	void test_character_has_images() {
		GameCharacter gameChar = em.find(GameCharacter.class, 5);
		assertNotNull(gameChar);
		assertNotNull(gameChar.getCharImages());
		assertTrue(gameChar.getCharImages().size() > 2);
	}

}
