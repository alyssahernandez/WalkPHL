package com.techelevator.controller;

import com.techelevator.model.Destination;
import com.techelevator.model.DestinationDao;
import com.techelevator.model.UserDao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@CrossOrigin
public class DestinationController {
    
    
    @Autowired
    private UserDao userDao;
    
    @Autowired DestinationDao destinationDao;
    
	@GetMapping("/destinations")
	public List<Destination> getDestinations() {
		return destinationDao.getAllDestinations();
	}
	
	@GetMapping("/profile/{username}/checkins")
	public List<Destination> getCheckins(@PathVariable String username) {
		return userDao.getVisitedDestinations(username);
	}
	
	@PostMapping("/profile/{username}/{destinationId}") 
	public void checkIn(@PathVariable String username, @PathVariable Integer destinationId) {
		userDao.checkIntoDestination(username, destinationId);
	}
	
	@PostMapping(path = "/adminfeatures")
	public Destination createDestination(@RequestBody Destination destination) {
		destinationDao.createDestination(destination);
		return destination;
	}
}