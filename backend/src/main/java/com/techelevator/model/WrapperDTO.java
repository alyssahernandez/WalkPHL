package com.techelevator.model;

public class WrapperDTO
{
	
	// TODO: Hopefully/probably not needed
	   private User user;
	   private Destination destination;
	
	   public WrapperDTO(Destination d, User user){
	    this.user = user;
	    this.destination = d;
	   }
	   
	   public User getUser() { return user; }
	   public Destination getDestination() { return destination; }
}