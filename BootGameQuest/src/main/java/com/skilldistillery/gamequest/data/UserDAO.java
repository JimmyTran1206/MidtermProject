package com.skilldistillery.gamequest.data;

import com.skilldistillery.gamequest.entities.User;

public interface UserDAO {
	public User authenticateUser(String username, String password);
	public int addUser(User user); 
	public User findUserById(int id);
	public User findUserByUsername(String username);
	public User deactivateUserById(int id);
	public void updateUserById(int id, User user);
}
