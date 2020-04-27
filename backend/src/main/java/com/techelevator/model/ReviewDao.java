package com.techelevator.model;

import java.util.List;

public interface ReviewDao {
	
	public List<Review> getAllReviews();
	
	public List<Review> getRecentReviews();
	
	public List<Review> getReviewsByUser(String username);
	
	public void createReview(Review review);

}
