package com.techelevator.controller;



import com.techelevator.authentication.AuthProvider;

import com.techelevator.authentication.UnauthorizedException;
import com.techelevator.model.Badge;
import com.techelevator.model.BadgeDao;
import com.techelevator.model.User;
import com.techelevator.model.UserDao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * AccountController
 */
@RestController
@CrossOrigin
public class BadgeController {
    
	@Autowired
    private AuthProvider auth;
    
    @Autowired
    private BadgeDao badge;
    
	@GetMapping("/badges")
	public List<Badge> getBadge() {
		return badge.getAllBadges();
		}
	
}