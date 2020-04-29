package com.techelevator.model;

import java.util.List;

public interface DestinationDao {

	
	public List<Destination> getDestinationsByCategory(Long category_id);
	
	public Destination getDestination(Long destination_id);
	
	public List<Destination> getAllDestinations();
	
	public void createDestination(Destination destination);
	
	public void createRequest(Destination destination, String username);
}
