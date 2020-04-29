package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcDestinationRequestDao implements DestinationRequestDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JdbcDestinationRequestDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<DestinationRequest> getRequests() {
		List<DestinationRequest> requests = new ArrayList<>();
		String query = "SELECT * FROM user_destination_submission";
		SqlRowSet results = jdbcTemplate.queryForRowSet(query);

		while (results.next()) {
			DestinationRequest request = new DestinationRequest();
			request.setName(results.getString("destination_name"));
			request.setUsername(results.getString("submitted_by"));
			requests.add(request);
		}
		return requests;
	}
}
