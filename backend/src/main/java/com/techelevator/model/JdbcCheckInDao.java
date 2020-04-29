package com.techelevator.model;

import java.time.LocalDate;

import org.springframework.jdbc.core.JdbcTemplate;

public class JdbcCheckInDao implements CheckInDao {
	
	private JdbcTemplate jdbcTemplate;
	
    @Override
    public void checkIntoDestination(CheckIn checkIn)
    {
    	String query = "INSERT INTO user_destination (username, destination_id, date_visited) VALUES (?, ?, ?)";
    	jdbcTemplate.update(query, checkIn.getUsername(), checkIn.getDestinationId(), LocalDate.now());
    }

}
