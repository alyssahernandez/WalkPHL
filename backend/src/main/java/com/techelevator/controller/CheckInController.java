package com.techelevator.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.techelevator.model.CheckIn;
import com.techelevator.model.CheckInDao;

@RestController
@CrossOrigin
public class CheckInController {

	CheckInDao checkInDao;
	
    @RequestMapping(path = "/check-in", method = RequestMethod.POST)
    public void checkIn(@RequestBody CheckIn checkInObject) {
    	checkInDao.checkIntoDestination(checkInObject);
    }
	
}
