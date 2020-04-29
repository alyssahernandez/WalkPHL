package com.techelevator.model;

import java.time.LocalDate;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcCheckInDao implements CheckInDao {
	
	private JdbcTemplate jdbcTemplate;
	
    @Autowired
    public JdbcCheckInDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
	
    @Override
    public void checkIntoDestination(CheckIn checkIn)
    {
    	
		giveBadge(checkIn);    	
    	    	
    	String query = "INSERT INTO user_destination (username, destination_id, date_visited) VALUES (?, ?, ?)";
    	jdbcTemplate.update(query, checkIn.getUsername(), checkIn.getDestinationId(), LocalDate.now());
    }
    
    private void giveBadge(CheckIn checkIn) {
    	
    	String query = "SELECT badge_id FROM destination_badge WHERE destination_id = ?";
    	SqlRowSet badgeResult = jdbcTemplate.queryForRowSet(query, checkIn.getDestinationId());
    	
    	if(badgeResult.next()) {

    		String checkIfExists = "SELECT * FROM user_badge WHERE username = ? AND badge_id = ?";
        	SqlRowSet results = jdbcTemplate.queryForRowSet(checkIfExists, checkIn.getUsername(), badgeResult.getLong("badge_id"));
        	
        	if(!results.next()) {      		
        	    		
		    	String giveBadgeQuery = "INSERT INTO user_badge (username, badge_id) VALUES (?, ?)";
		    	jdbcTemplate.update(giveBadgeQuery, checkIn.getUsername(), badgeResult.getLong("badge_id"));
		    	
        	}
		    	
    	}
    
    }

}
