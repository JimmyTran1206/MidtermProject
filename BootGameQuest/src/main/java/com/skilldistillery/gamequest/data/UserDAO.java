package com.skilldistillery.gamequest.data;

import java.util.List;

import com.skilldistillery.gamequest.entities.Game;
import com.skilldistillery.gamequest.entities.GameImage;
import com.skilldistillery.gamequest.entities.User;

public interface UserDAO {
	public User authenticateUser(String username, String password);

	public int addUser(User user);

	public User findUserById(int id);

	public User findUserByUsername(String username);

	public User deactivateUserById(int id);

	public User activateUserById(int id);

	public int updateUserByInfo(User userNewInfo);

	public List<User> getAllUser();

	public List<User> getUsersByUsername(String username);

	public List<User> getUsersByid(int id);

	public List<Game> getGameListByUserId(int userId);
	
	public Game removeGameFromUserList(int gameId, int userId);
	
	public List<Game> getGameListByUserInputTitle(String gameTitle);
	
	public int userAddNewGame(int userId, Game game, String[] screenshots);


}
