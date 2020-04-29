package com.techelevator.controller;

import com.techelevator.authentication.AuthProvider;
import com.techelevator.authentication.UnauthorizedException;
import com.techelevator.model.Destination;
import com.techelevator.model.DestinationDao;
import com.techelevator.model.Review;
import com.techelevator.model.ReviewDao;
import com.techelevator.model.User;
import com.techelevator.model.UserDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * ApiController
 */
@RestController
@CrossOrigin
@RequestMapping("/api")
public class ApiController {

    @Autowired
    private AuthProvider authProvider;
    
    @Autowired
    private UserDao userDao;
    
    @Autowired
    private ReviewDao reviewDao;
    
    @Autowired
    private DestinationDao destinationDao;
    

    @RequestMapping(path = "/", method = RequestMethod.GET)
    public String authorizedOnly() throws UnauthorizedException {
        /*
        You can lock down which roles are allowed by checking
        if the current user has a role.
        
        In this example, if the user does not have the admin role
        we send back an unauthorized error.
        */
        if (!authProvider.userHasRole(new String[] { "admin" })) {
            throw new UnauthorizedException();
        }
        return "Success";
    }
    
    @RequestMapping(path = "/admin-submit", method = RequestMethod.POST)
    public void createNewDestination(@RequestBody Destination destination) {
		destinationDao.createDestination(destination);
	}
    
    @RequestMapping(path = "/location-submit", method = RequestMethod.POST)
    public void newDestinationRequest(@RequestBody Destination destination) {
		destinationDao.createDestination(destination);
	}
    
    @RequestMapping(path = "/role-check", method = RequestMethod.GET)
    public boolean roleCheck() {
        
        if (authProvider.userHasRole(new String[] { "City Administrator" })) {
            return true;
        }
        return false;
    }
 }
