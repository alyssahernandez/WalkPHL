package com.techelevator.model;

import java.util.Date;

public class Review {
	
	private Integer review_id;
	private String username;
	private String title;
	private String review;
	private Date createdAt;

	public Integer getReview_id() {
		return review_id;
	}
	public void setReview_id(Integer review_id) {
		this.review_id = review_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public Date getReview_date() {
		return createdAt;
	}
	public void setReview_date(Date review_date) {
		this.createdAt = review_date;
	}

}
