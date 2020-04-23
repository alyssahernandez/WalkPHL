package com.techelevator.controller;


import java.sql.Date;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.techelevator.model.Review;
import com.techelevator.model.ReviewDao;
import com.techelevator.model.User;


import com.techelevator.reviews.dao.ProductReviewDao;
import com.techelevator.reviews.exception.ProductReviewNotFoundException;
import com.techelevator.reviews.model.ProductReview;

@RestController
@CrossOrigin
@RequestMapping("/api/reviews")
public class ReviewsController {
	
	@Autowired
	private ReviewDao reviewDAO;

	
	// We return objects that are Beans
	// typically POJOs or collections of POJOs
	@GetMapping
	public List<Review> list() {
		return 
	}
	
	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public Review create(@RequestBody Review review) {
		review.setCreatedAt(Date.valueOf(LocalDate.now()));
		return reviewDAO.create(review);
		
	}
	
	@GetMapping("/profile")
	public Review getUserReview(@PathVariable User user){
		Review review = null;
		if(review != null) {
			return review;
		}else {
		//	throw new ReviewNotFoundException("Product Review Not Found!");
		}
		
	}
}
	
	


