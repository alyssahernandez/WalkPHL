package com.techelevator.controller;

import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import com.techelevator.authentication.AuthProvider;
import com.techelevator.authentication.JwtTokenHandler;
import com.techelevator.authentication.UnauthorizedException;
import com.techelevator.authentication.UserCreationException;
import com.techelevator.model.BadgeDao;
import com.techelevator.model.User;
import com.techelevator.model.UserDao;

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
public class AccountController {
    @Autowired
    private AuthProvider auth;

    @Autowired
    private JwtTokenHandler tokenHandler;
    
    @Autowired
    private UserDao user;
    
    @Autowired
    private BadgeDao badge;

    @RequestMapping(path = "/login", method = RequestMethod.POST)
    public String login(@RequestBody User user, RedirectAttributes flash) throws UnauthorizedException {
        if (auth.signIn(user.getUsername(), user.getPassword())) {
            User currentUser = auth.getCurrentUser();
            return tokenHandler.createToken(user.getUsername(), currentUser.getRole());
        } else {
            throw new UnauthorizedException();
        }
    }
 
    @RequestMapping(path = "/register", method = RequestMethod.POST)
    public String register(@Valid @RequestBody User user, BindingResult result) throws UserCreationException {
        if (result.hasErrors()) {
            String errorMessages = "";
            for (ObjectError error : result.getAllErrors()) {
                errorMessages += error.getDefaultMessage() + "\n";
            }
            throw new UserCreationException(errorMessages);
        }
        auth.register(user.getUsername(), user.getPassword(), user.getRole());
        return "{\"success\":true}";
    }
    
	@RequestMapping(path = "/logout", method = RequestMethod.POST) 
	public void logout(RedirectAttributes flash) {
		auth.logOff();
	}	
	
	@RequestMapping(path = "/profile/{username}", method=RequestMethod.GET) 
	public Map<String, Object> getUser(@PathVariable String username) {
		Map<String, Object> userInfo = new HashMap<>();
		
		userInfo.put("user", user.getUserByUsername(username));
		userInfo.put("userBadges", badge.getEarnedBadges(username));
		return userInfo;
	}	
}