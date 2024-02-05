package com.skilldistillery.gamequest.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String username;

	private String password;

	private boolean enabled;

	private String role;
	
	@Column(name="profile_picture")
	private String profilePicture;
	
	@ManyToMany
	@JoinTable(name="user_game_list",
	joinColumns=@JoinColumn(name="user_id"),
	inverseJoinColumns=@JoinColumn(name="game_id"))
	private List<Game> userGames;

	public User() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getProfilePicture() {
		return profilePicture;
	}

	public void setProfilePicture(String profilePicture) {
		this.profilePicture = profilePicture;
	}
	
	public List<Game> getUserGames() {
		return userGames;
	}

	public void setUserGames(List<Game> userGames) {
		this.userGames = userGames;
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(enabled, id, password, profilePicture, role, userGames, username);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		return enabled == other.enabled && id == other.id && Objects.equals(password, other.password)
				&& Objects.equals(profilePicture, other.profilePicture) && Objects.equals(role, other.role)
				&& Objects.equals(userGames, other.userGames) && Objects.equals(username, other.username);
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", enabled=" + enabled
				+ ", role=" + role + "]";
	}
	
	public void addUserGame(Game game) {
		if(userGames == null) {
			userGames = new ArrayList<>();
		}
		if(!userGames.contains(game)) {
			userGames.add(game);
			game.addGameUser(this);
		}
	}
	
	public void removeUserGame(Game game) {
		if(userGames != null && userGames.contains(game)) {
			userGames.remove(game);
			game.removeGameUser(this);
		}
	}

}
