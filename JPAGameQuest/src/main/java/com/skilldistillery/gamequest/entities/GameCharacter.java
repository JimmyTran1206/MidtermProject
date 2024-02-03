package com.skilldistillery.gamequest.entities;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="game_character")
public class GameCharacter {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String description;
	
	@Column(name="character_avatar_url")
	private String avatarUrl;
	
	@Column(name="game_id")
	private int gameId;
	
	public GameCharacter() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAvatarUrl() {
		return avatarUrl;
	}

	public void setAvatarUrl(String avatarUrl) {
		this.avatarUrl = avatarUrl;
	}

	public int getGameId() {
		return gameId;
	}

	public void setGameId(int gameId) {
		this.gameId = gameId;
	}

	@Override
	public int hashCode() {
		return Objects.hash(avatarUrl, description, gameId, id, name);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		GameCharacter other = (GameCharacter) obj;
		return Objects.equals(avatarUrl, other.avatarUrl) && Objects.equals(description, other.description)
				&& gameId == other.gameId && id == other.id && Objects.equals(name, other.name);
	}

	@Override
	public String toString() {
		return "GameCharacter [id=" + id + ", name=" + name + ", description=" + description + ", avatarUrl="
				+ avatarUrl + ", gameId=" + gameId + "]";
	}
	
	
	

}
