package com.skilldistillery.gamequest.data;

import com.skilldistillery.gamequest.entities.User;

public interface UserDAO {
	User authenticateUser(String username, String password);
}
