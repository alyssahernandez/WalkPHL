package com.techelevator.model;

import java.util.List;

public interface BadgeDao {
	
	public List<Badge> getAllBadges();
	
	public List<Badge> getEarnedBadges(User user);
}
