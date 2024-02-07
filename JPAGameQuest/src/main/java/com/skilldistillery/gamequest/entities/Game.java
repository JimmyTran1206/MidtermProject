package com.skilldistillery.gamequest.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;

@Entity
public class Game {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String title;

	private String description;

	@Column(name = "release_date")
	private LocalDateTime releaseDate;

	@Column(name = "avatar_url")
	private String avatarUrl;

	@Column(name = "trailer_url")
	private String trailerUrl;

	@Column(name = "user_id")
	private int userId;

	@ManyToOne
	@JoinColumn(name = "company_id")
	private Company company;

	@OneToOne
	@JoinColumn(name = "age_rating_id")
	private AgeRating rating;

	@OneToMany(mappedBy = "game")
	private List<GameImage> gameImages;

	@ManyToMany
	@JoinTable(name = "platform_game", joinColumns = @JoinColumn(name = "game_id"), inverseJoinColumns = @JoinColumn(name = "platform_id"))
	private List<Platform> gamePlatforms;

	@ManyToMany
	@JoinTable(name = "genre_game", joinColumns = @JoinColumn(name = "game_id"), inverseJoinColumns = @JoinColumn(name = "genre_id"))
	private List<Genre> genres;

	@ManyToMany(mappedBy = "userGames")
	private List<User> gameUsers;

	//add -remove GameImage
	public void addGameImage(GameImage gameImage) {
		if (gameImages==null) {
			gameImages=new ArrayList<>();
		}
		if(!gameImages.contains(gameImage)) {
			gameImages.add(gameImage);
			if(gameImage.getGame()!=null) {
				gameImage.getGame().removeGameImage(gameImage);
			}
			gameImage.setGame(this);
		}
	}
	
	public void removeGameImage(GameImage gameImage) {
		if(gameImages!=null && gameImages.contains(gameImage)) {
			gameImages.remove(gameImage);
			gameImage.setGame(null);
		}
	}
	//---finish adding new stuffs--
	
	public Game() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDateTime getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(LocalDateTime releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getAvatarUrl() {
		return avatarUrl;
	}

	public void setAvatarUrl(String avatarUrl) {
		this.avatarUrl = avatarUrl;
	}

	public String getTrailerUrl() {
		return trailerUrl;
	}

	public void setTrailerUrl(String trailerUrl) {
		this.trailerUrl = trailerUrl;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public AgeRating getRating() {
		return rating;
	}

	public void setRating(AgeRating rating) {
		this.rating = rating;
	}

	public List<GameImage> getGameImages() {
		return gameImages;
	}

	public void setGameImages(List<GameImage> gameImages) {
		this.gameImages = gameImages;
	}

	public List<Platform> getGamePlatforms() {
		return gamePlatforms;
	}

	public void setGamePlatforms(List<Platform> gamePlatforms) {
		this.gamePlatforms = gamePlatforms;
	}

	public List<Genre> getGenres() {
		return genres;
	}

	public void setGenres(List<Genre> genres) {
		this.genres = genres;
	}

	public List<User> getGameUsers() {
		return gameUsers;
	}

	public void setGameUsers(List<User> gameUsers) {
		this.gameUsers = gameUsers;
	}

	public void addGenre(Genre genre) {
		if (genres == null) {
			genres = new ArrayList<>();
		}
		if (!genres.contains(genre)) {
			genres.add(genre);
			genre.addGame(this);
		}
	}

	public void removeGenre(Genre genre) {
		if(genres != null && genres.contains(genre)) {
			genres.remove(genre);
			genre.removeGame(this);
		}
	}

	public void addGamePlatform(Platform platform) {
		if(gamePlatforms == null) {
			gamePlatforms = new ArrayList<>();
		}
		if(!gamePlatforms.contains(platform)) {
			gamePlatforms.add(platform);
			platform.addGame(this);		
		}
	}

	public void removeGamePlatform(Platform platform) {
		if(gamePlatforms != null && gamePlatforms.contains(platform)) {
			gamePlatforms.remove(platform);
			platform.removeGame(this);
		}
	}
	
	public  void addGameUser(User user) {
		if(gameUsers == null) {
			gameUsers = new ArrayList<>();
		}
		if(!gameUsers.contains(user)) {
			gameUsers.add(user);
			user.addUserGame(this);
		}
	}
	
	public void removeGameUser(User user) {
		if(gameUsers != null && gameUsers.contains(user)) {
			gameUsers.remove(user);
			user.removeUserGame(this);
		}
	}

}
