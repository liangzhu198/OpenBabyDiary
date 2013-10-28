package com.liang;

import java.util.ArrayList;
import java.util.Date;

import com.google.common.base.Joiner;
import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Serialize;

@Entity
public class Baby implements Comparable<Baby> {

	static {
		 ObjectifyService.register(Baby.class);
	}
	// id is set by the datastore for us
	@Id
	public Long id;
	public String firstName;
	public String lastName;
	public String gender;
	public Date dateOfBirth;
	public Date createDate;
	public Date newUpdateDate;
	public int visitTime;
	public int pictureNum;
	public int diaryNum;
	public String coverImageUrl;
	@Serialize
	public ArrayList<Date> visitQueue;	
  
	// TODO: figure out why this is needed
	@SuppressWarnings("unused")
	private Baby() {
		firstName="Tom's";
		lastName="Baby";
		gender = "M";
		dateOfBirth = new Date();
		createDate = new Date();
		newUpdateDate = new Date();
		visitTime = 0;
		pictureNum = 0;
		diaryNum = 0;
		// need to be changed to logo
		coverImageUrl = "http://www.full-stop.net/wp-content/uploads/2012/05/Great-wall-of-china.jpeg";
		visitQueue = new ArrayList<Date>();
	}
	
	@Override
	public String toString() {
		Joiner joiner = Joiner.on(":");
		return joiner.join(id.toString(), firstName, gender, dateOfBirth.toString());
 	}
    
	// If the input of coverImageUrl is empty, use default
	public Baby(String firstName, String lastName, String gender, Date dateOfBirth) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.gender = gender;
        this.dateOfBirth = dateOfBirth;
		createDate = new Date();
		newUpdateDate = new Date();
		visitTime = 0;
		pictureNum = 0;
		diaryNum = 0;
		// need to be changed to logo
		coverImageUrl = "http://www.full-stop.net/wp-content/uploads/2012/05/Great-wall-of-china.jpeg";
		visitQueue = new ArrayList<Date>();
	} 
	
	// To see if the input of coverImageUrl is not empty
	public Baby(String firstName, String lastName, String gender, Date dateOfBirth, String coverImageUrl) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.gender = gender;
        this.dateOfBirth = dateOfBirth;
		createDate = new Date();
		newUpdateDate = new Date();
		visitTime = 0;
		pictureNum = 0;
		diaryNum = 0;
		this.coverImageUrl = coverImageUrl;
		visitQueue = new ArrayList<Date>();
	}
	
	// update queue with date created in the arraylist.
	// note that getTime() method use milli-second.
	public int updateQueue(Date date){
		ArrayList<Date> tmpArrayList = new ArrayList<Date>();
		for (Date e:visitQueue ){
			if ((date.getTime()-e.getTime())/(1000*60*60) >= 1){
				tmpArrayList.add(e);
			}
		}
		for (Date e:tmpArrayList){
			visitQueue.remove(e);
		}
		return visitQueue.size();
	}

	// method to update when new image put on
	public void updateNewStuffDate(){
		newUpdateDate = new Date();
	}
	
	@Override
	public int compareTo(Baby other) {
		if (createDate.after(other.createDate)) {
			return 1;
		} else if (createDate.before(other.createDate)) {
			return -1;
		}
		return 0;
	}
}




