package com.techelevator.model;

import java.util.List;

public interface BadgeDao {
	
	public List<Badge> getAllBadges();
	
	public List<Badge> getEarnedBadges(String username);
	
	public String getBadgeImage();
	
}
