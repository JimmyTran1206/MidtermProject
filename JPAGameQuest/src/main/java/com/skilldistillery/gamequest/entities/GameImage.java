package com.skilldistillery.gamequest.entities;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="game_image")
public class GameImage {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="image_url")
	private String imageUrl;
	
	@ManyToOne
	@JoinColumn(name="game_id")
	private Game game;
	
	public GameImage() {
		
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
	
	
	public Game getGame() {
		return game;
	}

	public void setGame(Game game) {
		this.game = game;
	}

	@Override
	public int hashCode() {
		return Objects.hash(game, id, imageUrl);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		GameImage other = (GameImage) obj;
		return Objects.equals(game, other.game) && id == other.id && Objects.equals(imageUrl, other.imageUrl);
	}

	@Override
	public String toString() {
		return "GameImage [id=" + id + ", imageUrl=" + imageUrl + ", game=" + game + "]";
	}

	
	

}
