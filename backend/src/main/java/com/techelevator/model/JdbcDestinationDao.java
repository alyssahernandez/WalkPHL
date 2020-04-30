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
		List<Destination> destinations = mapRowSetToDestinations(results);
		return destinations;
	}

    // TODO: This likely won't be needed. Pull destinations, filter by name, pull info from Google by name, etc.
    @Override
    public Destination getDestination(Long destination_id)
    {
    	String query = "SELECT * FROM destination WHERE destination_id = ?";
    	SqlRowSet results = jdbcTemplate.queryForRowSet(query, destination_id);
    	return mapRowSetToDestination(results);
    }
    
    @Override
    public List<Destination> getDestinationsByCategory(Long category_id)
    {
    	String query = "SELECT * FROM destination WHERE category_id = ?";
    	SqlRowSet results = jdbcTemplate.queryForRowSet(query, category_id);
    	return mapRowSetToDestinations(results);
    }
    
    @Override
    public void createDestination(Destination destination)
    {
    	String query = "INSERT INTO destination (category_id, name, description, lat, long, city, state, zip_code, open_from, open_to, weekends, img_url, icon_url, wiki, twitter_handle) "
    			+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    	
    	Integer categoryId = getCategoryId(destination.getCategory());
    	jdbcTemplate.update(query, categoryId, destination.getName(), destination.getDescription(), destination.getLatitude(), destination.getLongitude(), destination.getCity(), destination.getState(), destination.getZip_code(), destination.getOpenFrom(), destination.getOpenTo(), destination.getOpenOnWeekends(), destination.getImgUrl(), destination.getIconUrl(), destination.getWiki(), destination.getTwitterHandle());
    }
    
    @Override
    public void createRequest(Destination destination, String username)
    {
    	String query = "INSERT INTO user_destination_submission (destination_name, submitted_By) "
    			+ "VALUES (?, ?)";
    	
    	jdbcTemplate.update(query, destination.getName(), username);
    }
    
    private Integer getCategoryId(String categoryName)
    {
    	Integer i = null;
    	String query = "SELECT category_id FROM category WHERE category_name = ?";
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
		while (results.next()) {
			Destination d = mapRowSetToDestination(results);
			destinations.add(d);
		}
		return destinations;
	}
    
    private Destination mapRowSetToDestination(SqlRowSet results) {
    	
    	String catName = null;
    
	    String query = "SELECT category_name FROM category WHERE category_id = ?";
		SqlRowSet result = jdbcTemplate.queryForRowSet(query, results.getLong("category_id"));
		if (result.next()) {
			catName = result.getString("category_name");
		}
			
		Destination d = new Destination();
    
		d.setCity(results.getString("city"));
		d.setDescription(results.getString("description"));
		d.setDestinationId(results.getLong("destination_id"));
		d.setName(results.getString("name"));
		d.setState(results.getString("state"));
		d.setLatitude(results.getString("lat"));
		d.setLongitude(results.getString("long"));
		d.setZip_code(results.getString("zip_code"));
		d.setCategoryId(results.getLong("category_id"));
		d.setCategory(catName);
		d.setOpenFrom(results.getString("open_from"));
		d.setOpenOnWeekends(results.getString("weekends"));
		d.setOpenTo(results.getString("open_to"));
		d.setImgUrl(results.getString("img_url"));
		d.setIconUrl(results.getString("icon_url"));
		d.setWiki(results.getString("wiki"));
		d.setTwitterHandle(results.getString("twitter_handle"));
	
    	return d;
    }

}