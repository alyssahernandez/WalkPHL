package com.techelevator.model;

import java.util.List;

public interface DestinationDao {

	
	public List<Destination> getDestinationsByCategory(Integer category_id);
	
	public Destination getDestination(Integer destination_id);
	
	public List<Destination> getAllDestinations();
	
	public void createDestination(Destination destination);
}
