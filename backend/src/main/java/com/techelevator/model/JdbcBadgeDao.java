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
public class JdbcBadgeDao implements BadgeDao {

    private JdbcTemplate jdbcTemplate;

    /**
     * Create a new user dao with the supplied data source and the password hasher
     * that will salt and hash all the passwords for users.
     *
     * @param dataSource an SQL data source
     * @param passwordHasher an object to salt and hash passwords
     */
    @Autowired
    public JdbcBadgeDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
    @Override
    public List<Badge> getAllBadges()
    {
    	List<Badge> badges = new ArrayList<>();
    	String query = "SELECT * FROM badge, badge_category";
    	SqlRowSet results = jdbcTemplate.queryForRowSet(query);
    	
    	while (results.next())
    	{
    		Badge badge = new Badge();
    		badge.setBadgeId(results.getInt("badge_id"));
    		badge.setCategory(results.getString("category_name"));
    		badge.setName(results.getString("name"));
    		badge.setDescription(results.getString("description"));
    		badges.add(badge);
    	}
    	return badges;
    }
    
    @Override
    public List<Badge> getEarnedBadges(User user)
    {
    	List<Badge> badges = new ArrayList<>();
    	String query = "SELECT * FROM badge_category INNER JOIN badge ON badge.category_id = badge_category.category_id "
    			+ "INNER JOIN user_badge ON badge.badge_id = user_badge.badge_id WHERE user_badge.username = ?";
    	SqlRowSet results = jdbcTemplate.queryForRowSet(query);
    	
    	while (results.next())
    	{
    		Badge badge = new Badge();
    		badge.setBadgeId(results.getInt("badge_id"));
    		badge.setCategory(results.getString("category_name"));
    		badge.setName(results.getString("name"));
    		badge.setDescription(results.getString("description"));
    		badges.add(badge);
    	}
    	return badges;
    }
   
}
