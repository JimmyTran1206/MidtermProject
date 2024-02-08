package com.skilldistillery.gamequest.data;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.gamequest.entities.Game;
import com.skilldistillery.gamequest.entities.GameImage;
import com.skilldistillery.gamequest.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User authenticateUser(String username, String password) {
		try {
			String query = "SELECT u FROM User u WHERE u.username= :username AND u.password= :password";
			User u = em.createQuery(query, User.class).setParameter("username", username)
					.setParameter("password", password).getSingleResult();
			return u;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public int addUser(User user) {
		em.persist(user);
		em.flush();
		return user.getId();
	}

	@Override
	public User findUserById(int id) {
		return em.find(User.class, id);
	}

	@Override
	public User deactivateUserById(int id) {
		User user = em.find(User.class, id);
		if (user == null) {
			return null;
		}
		user.setEnabled(false);
		em.flush();
		return user;
	}

	@Override
	public User activateUserById(int id) {
		User user = em.find(User.class, id);
		if (user == null) {
			return null;
		}
		user.setEnabled(true);
		em.flush();
		return user;
	}

	@Override
	public int updateUserByInfo(User userNewInfo) {
		User user = em.find(User.class, userNewInfo.getId());
		user.setPassword(userNewInfo.getPassword());
		user.setUsername(userNewInfo.getUsername());
		user.setProfilePicture(userNewInfo.getProfilePicture());
		return user.getId();
	}

	@Override
	public User findUserByUsername(String username) {
		try {
			String query = "SELECT u FROM User u WHERE u.username= :username";
			User u = em.createQuery(query, User.class).setParameter("username", username).getSingleResult();
			return u;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<User> getAllUser() {
		try {
			String query = "SELECT u FROM User u WHERE u.id>1";
			List<User> userList = em.createQuery(query, User.class).getResultList();
			return userList;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<User> getUsersByUsername(String username) {
		try {
			String query = "SELECT u FROM User u WHERE u.username LIKE :name AND u.id>1";
			List<User> userList = em.createQuery(query, User.class).setParameter("name", "%" + username + "%")
					.getResultList();
			return userList;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<User> getUsersByid(int id) {
		try {
			String query = "SELECT u FROM User u WHERE u.id=:userId";
			List<User> userList = em.createQuery(query, User.class).setParameter("userId", id).getResultList();
			return userList;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<Game> getGameListByUserId(int userId) {
		return em.find(User.class, userId).getUserGames();
	}

	@Override
	public Game removeGameFromUserList(int gameId, int userId) {
		Game game = em.find(Game.class, gameId);
		User user = em.find(User.class, userId);
		user.removeUserGame(game);
		return game;
	}

	@Override
	public List<Game> getGameListByUserInputTitle(String gameTitle) {
		String query = "SELECT game FROM Game game WHERE game.title LIKE :gameTitle";
		List<Game> gameList = em.createQuery(query, Game.class).setParameter("gameTitle", "%" + gameTitle + "%")
				.getResultList();
		return gameList;
	}

	@Override
	public int userAddNewGame(int userId, Game game, String[] screenshots) {
		game.setUserId(userId);
		em.persist(game);
		em.flush();
		Game newGame = em.find(Game.class, game.getId());

		for (int i = 0; i < screenshots.length; i++) {
			GameImage screenshot = new GameImage();
			screenshot.setImageUrl(screenshots[i]);
			screenshot.setGame(newGame);
			em.persist(screenshot);
		}

		User user = em.find(User.class, userId);
		user.addUserGame(game);
		return game.getId();
	}

	@Override
	public Game getGameById(int gameId) {
		return em.find(Game.class, gameId);
	}

	@Override
	public User findUserByIdJoinFetchGameList(int id) {
		try {
			String query = "SELECT u FROM User u LEFT JOIN FETCH u.userGames WHERE u.id= :userId";
			User u = em.createQuery(query, User.class).setParameter("userId", id).getResultList().get(0);
			return u;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public Game addGametoUserList(int gameId, int userId) {
		Game game = em.find(Game.class, gameId);
		User user = em.find(User.class, userId);
		user.addUserGame(game);
		return game;
	}

	@Override
	public List<GameImage> getGameScreenshotList(int gameId) {
		Game game = em.find(Game.class, gameId);
		return game.getGameImages();
	}

	// (1) Merge with (2) when refactoring  
	@Override
	public int userModifyGameFields(Game game) {
		Game originalGame= em.find(Game.class, game.getId());
		// update original game fields
		originalGame.setTitle(game.getTitle());
		originalGame.setAvatarUrl(game.getAvatarUrl());
		originalGame.setTrailerUrl(game.getTrailerUrl());
		originalGame.setDescription(game.getDescription());
		
		//Remove all screenshots
		List<GameImage> gameImages=originalGame.getGameImages();
		for(GameImage screenshot: gameImages) {
			em.remove(screenshot);		
			}
		
		em.flush();
		return originalGame.getId();
	}


	// (2) Merge with (1) when refactoring  
	@Override
	public int userModifyGameScreenShots(int gameId, String[] screenshots) {
		Game originalGame= em.find(Game.class, gameId);

		// add screenshots to originalGame
				for (int i = 0; i < screenshots.length; i++) {
					GameImage screenshot = new GameImage();
					screenshot.setImageUrl(screenshots[i]);
					screenshot.setGame(originalGame);
					em.persist(screenshot);;
				}
		return originalGame.getId();
	}

	// END OF USER DAO \\
}
