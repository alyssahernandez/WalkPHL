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
public class JdbcUserDao implements UserDao {

    private JdbcTemplate jdbcTemplate;
    private PasswordHasher passwordHasher;

    /**
     * Create a new user dao with the supplied data source and the password hasher
     * that will salt and hash all the passwords for users.
     *
     * @param dataSource an SQL data source
     * @param passwordHasher an object to salt and hash passwords
     */
    @Autowired
    public JdbcUserDao(DataSource dataSource, PasswordHasher passwordHasher) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
        this.passwordHasher = passwordHasher;
    }

    /**
     * Save a new user to the database. The password that is passed in will be
     * salted and hashed before being saved. The original password is never
     * stored in the system. We will never have any idea what it is!
     *
     * @param userName the user name to give the new user
     * @param password the user's password
     * @param role the user's role
     * @return the new user
     */
    @Override
    public User saveUser(String userName, String password, String role) {
        byte[] salt = passwordHasher.generateRandomSalt();
        String hashedPassword = passwordHasher.computeHash(password, salt);
        String saltString = new String(Base64.encode(salt));
        long newId = jdbcTemplate.queryForObject(
                "INSERT INTO users(username, password, salt, role) VALUES (?, ?, ?, ?) RETURNING id", Long.class,
                userName, hashedPassword, saltString, role);

        User newUser = new User();
        newUser.setId(newId);
        newUser.setUsername(userName);
        newUser.setRole(role);

        return newUser;
    }

    @Override
    public void changePassword(User user, String newPassword) {
        byte[] salt = passwordHasher.generateRandomSalt();
        String hashedPassword = passwordHasher.computeHash(newPassword, salt);
        String saltString = new String(Base64.encode(salt));

        jdbcTemplate.update("UPDATE users SET password=?, salt=? WHERE id=?", hashedPassword, saltString, user.getId());
    }

    /**
     * Look for a user with the given username and password. Since we don't
     * know the password, we will have to get the user's salt from the database,
     * hash the password, and compare that against the hash in the database.
     *
     * @param userName the user name of the user we are checking
     * @param password the password of the user we are checking
     * @return true if the user is found and their password matches
     */
    @Override
    public User getValidUserWithPassword(String userName, String password) {
        String sqlSearchForUser = "SELECT * FROM users WHERE UPPER(username) = ?";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForUser, userName.toUpperCase());
        if (results.next()) {
            String storedSalt = results.getString("salt");
            String storedPassword = results.getString("password");
            String hashedPassword = passwordHasher.computeHash(password, Base64.decode(storedSalt));
            if (storedPassword.equals(hashedPassword)) {
                return mapResultToUser(results);
            } else {
                return null;
            }
        } else {
            return null;
        }
    }

    /**
     * Get all of the users from the database.
     * @return a List of user objects
     */
    @Override
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<User>();
        String sqlSelectAllUsers = "SELECT id, username, role, img_url, bio FROM users";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllUsers);

        while (results.next()) {
            User user = mapResultToUser(results);
            users.add(user);
        }

        return users;
    }

    @Override
    public User getUserByUsername(String username) {
        String sqlSelectUserByUsername = "SELECT id, username, role, profile_pic, bio FROM users WHERE username = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectUserByUsername, username);

        if (results.next()) {
            return mapResultToUser(results);
        } else {
            return null;
        }
    }
    
    @Override
    public void setAdmin(String username)
    {
    	String admin = "City Administrator";
    	String query = "UPDATE users SET role = ? WHERE username = ?";
    	jdbcTemplate.update(query, admin, username);
    }
    
    @Override
    public List<Destination> getVisitedDestinations(String username)
    {
    	String query = "SELECT * FROM destination INNER JOIN user_destination ON destination.destination_id = user_destination.destination_id WHERE user_destination.username = ?";
    	SqlRowSet results = jdbcTemplate.queryForRowSet(query, username);
    	List<Destination> destinations = new ArrayList<>();
    	while (results.next())
    	{
    		Destination d = new Destination();
    		d.setCity(results.getString("city"));
    		d.setDescription(results.getString("description"));
    		d.setDestinationId(results.getInt("destination_id"));
    		d.setName(results.getString("name"));
    		d.setState(results.getString("state"));
    		d.setLatitude(results.getString("lat"));
    		d.setLongitude(results.getString("long"));
    		d.setZip_code(results.getString("zip_code"));
    		d.setCategoryId(results.getString("category_id"));
    		d.setOpenFrom(results.getString("open_from"));
    		d.setOpenOnWeekends(results.getString("weekends"));
    		d.setOpenTo(results.getString("open_to"));
    		d.setImgUrl(results.getString("img_url"));
    		destinations.add(d);
    	}
    	return destinations;
    }
    
    @Override
    public void checkIntoDestination(String username, Integer destinationId)
    {
    	String query = "INSERT INTO user_destination (username, destination_id, date_visited) VALUES (?, ?, ?)";
    	jdbcTemplate.update(query, username, destinationId, LocalDate.now());
    }
	/*
	 * public void checkIn(User user, Destination destination) { String query =
	 * "UPDATE user_destination SET checked_in" }
	 */
    private User mapResultToUser(SqlRowSet results) {
        User user = new User();
        user.setId(results.getLong("id"));
        user.setUsername(results.getString("username"));
        user.setRole(results.getString("role"));
        user.setProfilePicture(results.getString("profile_pic"));
        user.setBio(results.getString("bio"));
        return user;
    }

}
