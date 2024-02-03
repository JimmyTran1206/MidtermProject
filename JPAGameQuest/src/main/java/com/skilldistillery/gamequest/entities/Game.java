package com.skilldistillery.gamequest.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

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
	
	@Column(name="company_id")
	private int companyId;
	
	@Column(name="age_rating_id")
	private int ageRatingId;
	
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

	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getAgeRatingId() {
		return ageRatingId;
	}

	public void setAgeRatingId(int ageRatingId) {
		this.ageRatingId = ageRatingId;
	}

	@Override
	public int hashCode() {
		return Objects.hash(ageRatingId, avatarUrl, companyId, description, id, releaseDate, title, trailerUrl, userId);
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
		return ageRatingId == other.ageRatingId && Objects.equals(avatarUrl, other.avatarUrl)
				&& companyId == other.companyId && Objects.equals(description, other.description) && id == other.id
				&& Objects.equals(releaseDate, other.releaseDate) && Objects.equals(title, other.title)
				&& Objects.equals(trailerUrl, other.trailerUrl) && userId == other.userId;
	}

	@Override
	public String toString() {
		return "Game [id=" + id + ", title=" + title + ", description=" + description + ", releaseDate=" + releaseDate
				+ ", avatarUrl=" + avatarUrl + ", trailerUrl=" + trailerUrl + ", userId=" + userId + ", companyId="
				+ companyId + ", ageRatingId=" + ageRatingId + "]";
	}
	
	
	
	

}
