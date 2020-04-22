package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

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
    
    public List<Destination> getAllDestinations()
    {
    	String query = "SELECT * FROM destination";
    	SqlRowSet results = jdbcTemplate.queryForRowSet(query);
    	return mapRowSetToDestinations(results);
    }
    
    public Destination getDestination(Integer destination_id)
    {
    	String query = "SELECT * FROM destination WHERE destination_id = ?";
    	SqlRowSet results = jdbcTemplate.queryForRowSet(query, destination_id);
    	return mapRowSetToDestination(results);
    }
    
    public List<Destination> getDestinationsByCategory(Integer category_id)
    {
    	String query = "SELECT * FROM destination WHERE category_id = ?";
    	SqlRowSet results = jdbcTemplate.queryForRowSet(query, category_id);
    	return mapRowSetToDestinations(results);
    }
    
    public List<Destination> getVisitedDestinations(User user)
    {
    	String query = "SELECT * FROM destination INNER JOIN user_destination ON destination.destination_id = user_destination.destination_id WHERE user_destination.user_id = ?";
    	SqlRowSet results = jdbcTemplate.queryForRowSet(query, user.getId());
    	return mapRowSetToDestinations(results);
    }
    
    private List<Destination> mapRowSetToDestinations(SqlRowSet results)
    {
    	List<Destination> destinations = new ArrayList<>();
    	while (results.next())
    	{
    		Destination d = new Destination();
    		d.setCity(results.getString("city"));
    		d.setDescription(results.getString("description"));
    		d.setDestinationId(results.getInt("destination_id"));
    		d.setName(results.getString("name"));
    		d.setState(results.getString("state"));
    		d.setX_coordinate(results.getString("x_coordinate"));
    		d.setY_coordinate(results.getString("y_coordinate"));
    		d.setZip_code(results.getString("zip_code"));
    	}
    	return destinations;
    }
    
    private Destination mapRowSetToDestination(SqlRowSet results)
    {
    	Destination d = new Destination();
    	if (results.next())
    	{
    		d.setCity(results.getString("city"));
    		d.setDescription(results.getString("description"));
    		d.setDestinationId(results.getInt("destination_id"));
    		d.setName(results.getString("name"));
    		d.setState(results.getString("state"));
    		d.setX_coordinate(results.getString("x_coordinate"));
    		d.setY_coordinate(results.getString("y_coordinate"));
    		d.setZip_code(results.getString("zip_code"));
    	}
    	return d;
    }

}