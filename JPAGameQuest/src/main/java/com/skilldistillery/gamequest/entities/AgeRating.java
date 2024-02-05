package com.skilldistillery.gamequest.entities;

import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="age_rating")
public class AgeRating {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Enumerated(EnumType.STRING)
	private RatingSymbol rating;
	
	@OneToOne(mappedBy="rating")
	private Game game;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public RatingSymbol getRating() {
		return rating;
	}

	public void setRating(RatingSymbol rating) {
		this.rating = rating;
	}

	public Game getGame() {
		return game;
	}

	public void setGame(Game game) {
		this.game = game;
	}

	@Override
	public int hashCode() {
		return Objects.hash(game, id, rating);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AgeRating other = (AgeRating) obj;
		return Objects.equals(game, other.game) && id == other.id && rating == other.rating;
	}

	@Override
	public String toString() {
		return "AgeRating [id=" + id + ", rating=" + rating + ", game=" + game + "]";
	}
	
	
	
}
