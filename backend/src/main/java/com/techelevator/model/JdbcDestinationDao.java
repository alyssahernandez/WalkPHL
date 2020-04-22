package com.techelevator.model;

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
public class JdbcDestinationDao implements DestinationDao {

    private JdbcTemplate jdbcTemplate;

    /**
     * Create a new user dao with the supplied data source and the password hasher
     * that will salt and hash all the passwords for users.
     *
     * @param dataSource an SQL data source
     * @param passwordHasher an object to salt and hash passwords
     */
    @Autowired
    public JdbcDestinationDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
    public List<Destination> getDestinations(User user)
    {
    	List<Destination> destinations = new ArrayList<>();
    	String query = "SELECT * FROM destination INNER JOIN user_destination ON destination.destination_id = user_destination.destination_id WHERE user_destination.user_id = ?";
    	SqlRowSet results = jdbcTemplate.queryForRowSet(query, user.getId());
    	while (results.next())
    	{
    		
    	}
    	
    	return destinations;
    }

}