package com.techelevator.controller;

import com.techelevator.model.Destination;
import com.techelevator.model.DestinationDao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@CrossOrigin
public class DestinationController {
    
    
    @Autowired
    private DestinationDao destinationDao;
    
	@GetMapping("/destinations")
	public List<Destination> getDestinations() {
		return destinationDao.getAllDestinations();
	}
}