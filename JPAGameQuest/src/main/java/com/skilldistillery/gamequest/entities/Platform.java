package com.skilldistillery.gamequest.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;

@Entity
public class Platform {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@Column(name="platform_url")
	private String platformUrl;
	
	@ManyToMany(mappedBy="gamePlatforms")
	private List<Game> games;
	
	public Platform() {
		
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

	public String getPlatformUrl() {
		return platformUrl;
	}

	public void setPlatformUrl(String platformUrl) {
		this.platformUrl = platformUrl;
	}

	public List<Game> getGames() {
		return games;
	}

	public void setGames(List<Game> games) {
		this.games = games;
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(games, id, name, platformUrl);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Platform other = (Platform) obj;
		return Objects.equals(games, other.games) && id == other.id && Objects.equals(name, other.name)
				&& Objects.equals(platformUrl, other.platformUrl);
	}

	@Override
	public String toString() {
		return "Platform [id=" + id + ", name=" + name + ", platformUrl=" + platformUrl + "]";
	}
	
	public void addGame(Game game) {
		if(games == null) {
			games = new ArrayList<>();
		}
		if(!games.contains(game)) {
			games.add(game);
			game.addGamePlatform(this);
		}
	}
	
	public void removeGame(Game game) {
		if(games != null && games.contains(game)) {
			games.remove(game);
			game.removeGamePlatform(this);
		}
	}
	
	

}
