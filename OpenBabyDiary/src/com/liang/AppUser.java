package com.liang;

import java.util.HashSet;


import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Serialize;

@Entity
public class AppUser {
	
	static {
		 ObjectifyService.register(AppUser.class);
	}
	
	@Id 
	public Long id;
	public String userName;
	public String userEmail;
	@Serialize
	public HashSet<Long> babyOwned;
	@Serialize
	public HashSet<Long> babySubed;

	// constructor function on users without arguments passed in
	// solving two main parts: Own & Subscribe
	public AppUser(){
		babyOwned = new HashSet<Long>();
		babySubed = new HashSet<Long>();
	}

	// constructor function on users with arguments passed in
	public AppUser(String userName,String userEmail){
		this.babyOwned = new HashSet<Long>();
		this.babySubed = new HashSet<Long>();
		this.userName = userName;
		this.userEmail = userEmail;
	}
}
