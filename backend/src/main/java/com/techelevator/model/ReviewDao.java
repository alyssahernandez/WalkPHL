package com.techelevator.model;

import java.util.List;

public interface ReviewDao {
	
	public List<Review> getAllReviews();
	public List<Review> getReviewsByUser(User user);
	public void createReview(Review review);

}
