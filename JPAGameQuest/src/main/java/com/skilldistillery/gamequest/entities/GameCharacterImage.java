package com.skilldistillery.gamequest.entities;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="game_character_image")
public class GameCharacterImage {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="image_url")
	private String imageUrl;
	
	@Column(name="game_character_id")
	private int gameCharacterId;
	
	public GameCharacterImage() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public int getGameCharacterId() {
		return gameCharacterId;
	}

	public void setGameCharacterId(int gameCharacterId) {
		this.gameCharacterId = gameCharacterId;
	}

	@Override
	public int hashCode() {
		return Objects.hash(gameCharacterId, id, imageUrl);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		GameCharacterImage other = (GameCharacterImage) obj;
		return Objects.equals(gameCharacterId, other.gameCharacterId) && id == other.id
				&& Objects.equals(imageUrl, other.imageUrl);
	}

	@Override
	public String toString() {
		return "GameCharacterImage [id=" + id + ", imageUrl=" + imageUrl + ", gameCharacterId=" + gameCharacterId + "]";
	}
	
	

}
