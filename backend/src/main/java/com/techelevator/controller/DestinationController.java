package com.techelevator.controller;



import com.techelevator.authentication.AuthProvider;

import com.techelevator.authentication.UnauthorizedException;
import com.techelevator.model.Destination;
import com.techelevator.model.DestinationDao;
import com.techelevator.model.User;
import com.techelevator.model.UserDao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@RestController
@CrossOrigin
public class DestinationController {
    
    
    @Autowired
    private DestinationDao destinationDao;
    
	@GetMapping("/destinations")
	public List<Destination> getBadge() {
		return destinationDao.getAllDestinations();
	}
}