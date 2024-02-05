package com.skilldistillery.gamequest.entities;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;

@Entity
public class Game {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String title;
	
	private String description;
	
	@Column(name="release_date")
	private LocalDateTime releaseDate;
	
	@Column(name="avatar_url")
	private String avatarUrl;
	
	@Column(name="trailer_url")
	private String trailerUrl;
	
	@Column(name="user_id")
	private int userId;
	
	@OneToOne
	@JoinColumn(name="company_id")
	private Company company;
	
	@OneToOne
	@JoinColumn(name="age_rating_id")
	private AgeRating rating;
	
	@OneToMany(mappedBy="game")
	private List<GameImage> gameImages;
	
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

	@Override
	public int hashCode() {
		return Objects.hash(avatarUrl, company, description, gameImages, id, rating, releaseDate, title, trailerUrl,
				userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Game other = (Game) obj;
		return Objects.equals(avatarUrl, other.avatarUrl) && Objects.equals(company, other.company)
				&& Objects.equals(description, other.description) && Objects.equals(gameImages, other.gameImages)
				&& id == other.id && Objects.equals(rating, other.rating)
				&& Objects.equals(releaseDate, other.releaseDate) && Objects.equals(title, other.title)
				&& Objects.equals(trailerUrl, other.trailerUrl) && userId == other.userId;
	}

	@Override
	public String toString() {
		return "Game [id=" + id + ", title=" + title + ", description=" + description + ", releaseDate=" + releaseDate
				+ ", avatarUrl=" + avatarUrl + ", trailerUrl=" + trailerUrl + ", userId=" + userId + ", company="
				+ company + ", rating=" + rating + ", gameImages=" + gameImages + "]";
	}

	

	
	
	
	
	

}
