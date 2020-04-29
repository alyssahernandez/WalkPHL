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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.techelevator.model.Review;
import com.techelevator.model.ReviewDao;
import com.techelevator.model.User;

@RestController
@CrossOrigin
public class ReviewsController {
	
	@Autowired
	private ReviewDao reviewDAO;
	
	// We return objects that are Beans
	// typically POJOs or collections of POJOs
	
	@GetMapping("/reviews")
	public List<Review> listAll() {
		return reviewDAO.getAllReviews();
	}
	
	@GetMapping("/recent-reviews")
	public List<Review> listRecent() {
		return reviewDAO.getRecentReviews();
	}
	
    @RequestMapping(path = "/leave-review", method = RequestMethod.POST)
    public void leaveReview(@RequestBody Review review) {	
    	reviewDAO.createReview(review);   	
    }
	
	/*
	@PostMapping(path = "/profile/{username}/{destination}")
	@ResponseStatus(HttpStatus.CREATED)
	public Review create(@RequestBody Review review) {
		reviewDAO.createReview(review);
		reviewDAO.createReview(review);
		return review;
	}
	
	
	@GetMapping("/profile")
	public Review getUserReview(@PathVariable User user){
		Review review = null;
		if(review != null) {
			return review;
		} else {
		//	throw new ReviewNotFoundException("Product Review Not Found!");
		}
	}
	*/
}
	
	


