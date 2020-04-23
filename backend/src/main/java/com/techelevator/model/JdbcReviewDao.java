package com.techelevator.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.techelevator.authentication.PasswordHasher;

import org.bouncycastle.util.encoders.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcReviewDao implements ReviewDao {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public JdbcReviewDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
    public List<Review> getAllReviews()
    {
    	List<Review> reviews = new ArrayList<>();
    	String query = "SELECT * FROM user_reviews";
    	SqlRowSet results = jdbcTemplate.queryForRowSet(query);
    	
    	while (results.next())
    	{
    		Review review = new Review();
    		review.setReview(results.getString("review"));
    		review.setReview_date(results.getDate("review_date"));
    		review.setReview_id(results.getInt("review_id"));
    		review.setTitle(results.getString("title"));
    		review.setUser_id(results.getInt("user_id"));
    		reviews.add(review);
    	}
    	return reviews;
    }
    
    public List<Review> getReviewsByUser(User user)
    {
    	List<Review> reviews = new ArrayList<>();
    	String query = "SELECT * FROM user_reviews WHERE username = ?";
    	SqlRowSet results = jdbcTemplate.queryForRowSet(query, user.getId());
    	
    	while (results.next())
    	{
    		Review review = new Review();
    		review.setReview(results.getString("review"));
    		review.setReview_date(results.getDate("review_date"));
    		review.setReview_id(results.getInt("review_id"));
    		review.setTitle(results.getString("title"));
    		review.setUser_id(results.getInt("user_id"));
    		reviews.add(review);
    	}
    	return reviews;
    }
    
    public void createReview(Review review)
    {
    	String query = "INSERT INTO user_reviews (user_id, title, review, review_date) VALUES (?, ?, ?, ?)";
    	jdbcTemplate.update(query, review.getUser_id(), review.getTitle(), review.getReview(), LocalDate.now());
    }
}
    
    
