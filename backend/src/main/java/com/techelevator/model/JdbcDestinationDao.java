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

    // TODO: Figure out updating Check-in -- we'll need to reference both a username and destination name.
    // Can we pass this all back in same API call?
    
    @Autowired
    public JdbcDestinationDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
    @Override
    public List<Destination> getAllDestinations()
    {
    	String query = "SELECT * FROM destination";
    	SqlRowSet results = jdbcTemplate.queryForRowSet(query);
    	return mapRowSetToDestinations(results);
    }
    
    // TODO: This likely won't be needed. Pull destinations, filter by name, pull info from Google by name, etc.
    @Override
    public Destination getDestination(Integer destination_id)
    {
    	String query = "SELECT * FROM destination WHERE destination_id = ?";
    	SqlRowSet results = jdbcTemplate.queryForRowSet(query, destination_id);
    	return mapRowSetToDestination(results);
    }
    
    @Override
    public List<Destination> getDestinationsByCategory(Integer category_id)
    {
    	String query = "SELECT * FROM destination WHERE category_id = ?";
    	SqlRowSet results = jdbcTemplate.queryForRowSet(query, category_id);
    	return mapRowSetToDestinations(results);
    }
    
    @Override
    public List<Destination> getVisitedDestinations(User user)
    {
    	String query = "SELECT * FROM destination INNER JOIN user_destination ON destination.destination_id = user_destination.destination_id WHERE user_destination.username = ?";
    	SqlRowSet results = jdbcTemplate.queryForRowSet(query, user.getId());
    	return mapRowSetToDestinations(results);
    }
    
    @Override
    public void createDestination(Destination destination)
    {
    	String query = "INSERT INTO destination (category_id, name, description, x_coordinate, y_coordinate, city, state, zip_code) "
    			+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    	
    	Integer categoryId = getCategoryId(destination.getCategory());
    	
    	jdbcTemplate.update(query, categoryId, destination.getName(), destination.getDescription(), destination.getLatitude(), destination.getLongitude(), destination.getCity(), destination.getState(), destination.getZip_code());
    }
    
    private Integer getCategoryId(String categoryName)
    {
    	Integer i = null;
    	String query = "SELECT * FROM destination_category WHERE name = ?";
    	SqlRowSet results = jdbcTemplate.queryForRowSet(query, categoryName);
    	if (results.next())
    	{
    		i = results.getInt("category_id");
    	}
    	return i;
    }
    
    private List<Destination> mapRowSetToDestinations(SqlRowSet results)
    {
    	List<Destination> destinations = new ArrayList<>();
    	while (results.next())
    	{
    		Destination d = mapRowSetToDestination(results);
    		destinations.add(d);
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
    		d.setLatitude(results.getString("latitude"));
    		d.setLongitude(results.getString("longitude"));
    		d.setZip_code(results.getString("zip_code"));
    		d.setCategoryId(results.getString("category_id"));
    		d.setOpenFrom(results.getString("open_from"));
    		d.setOpenOnWeekends(results.getString("open_to"));
    		d.setOpenTo(results.getString("weekends"));
    		d.setImgUrl(results.getString("img_url"));
    	}
    	return d;
    }

}