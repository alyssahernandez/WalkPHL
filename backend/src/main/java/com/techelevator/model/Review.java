package com.techelevator.model;

import java.util.Date;

public class Review {
	
	private Integer review_id;
	private Integer user_id;
	private String title;
	private String review;
	private Date createdAt;

	public Integer getReview_id() {
		return review_id;
	}
	public void setReview_id(Integer review_id) {
		this.review_id = review_id;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
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
