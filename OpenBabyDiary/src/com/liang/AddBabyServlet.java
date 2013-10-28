package com.liang;

import static com.liang.OfyService.ofy;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

// Backs up CreateStream.html form submission. Trivial since there's no image uploaded, just a URL
@SuppressWarnings("serial")
public class AddBabyServlet extends HttpServlet{
	// format for transform from string to Date
	public SimpleDateFormat sdf  =   new  SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException{
		
		// user service to add in servlet
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();
		
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String gender = req.getParameter("gender");
		String url = req.getParameter("url");
		Date dateOfBirth;
		// transform from string to Date (When I tried to do this in Baby.java, I failed to save s as an entity. not sure what is wrong)
		try {
			dateOfBirth = getBirthDay (req.getParameter("year")+"-"+req.getParameter("month")+"-"+req.getParameter("day"));
		}
		catch (ParseException e){
			dateOfBirth = new Date();
			System.out.println("input failed, dateOfBirth is set to current time!");
		}
		Baby s = new Baby(firstName, lastName, gender, dateOfBirth, url);
		// Do not forget to add ObjectifyFilter to enable save and load.
		ofy().save().entity(s).now();
		// you cannot use s.toString before save the entity, because toString include s.id, which is created when saving the entity
		System.out.println(s.toString());

		List<AppUser> th = OfyService.ofy().load().type(AppUser.class).list();
		AppUser appUser = new AppUser();
		if (th.isEmpty()){
			appUser = new AppUser(user.getNickname(),user.getEmail());
		}else{
			boolean flag = false;
			for (AppUser a:th ){
				if (a.userName.equals(user.getNickname())){
					appUser = a;
					flag = true;
					break;
				}
			}
			if (!flag){
				appUser = new AppUser(user.getNickname(),user.getEmail());
			}
		}
		appUser.babyOwned.add(s.id);
		System.out.println("appuser = "+appUser.userName + " added baby "+s.firstName);
		ofy().save().entity(appUser).now();
		
		resp.sendRedirect("/homepage.jsp");

	}

	//set the parseException by call function, in case the parse fails
	private Date getBirthDay (String dateOfBirth) throws ParseException {
		return sdf.parse(" "+dateOfBirth+ " 00:00:00 ");
	}
}