<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.liang.AppUser"%>
<%@ page import="com.liang.OfyService"%>
<%@ page import="com.googlecode.objectify.Result"%>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%--This part is for background and should be the same for all pages--%>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="stylesheets/background.css" />  
</head>

<body>
<div id="main_container">

  	<div id="header">
        <div id="menu">
            <ul>                                              
                <li><a class="current" href="homepage.jsp" title="">home</a></li>
                <li class="divider"></li>
                <li><a href="MyFavorite.jsp" title="">My Favorite</a></li>
                <li class="divider"></li>
                <li><a href="RecentImages.jsp" title="">Recent Images</a></li>
                <li class="divider"></li>
                <li><a href="RecentDiaries.jsp" title="">Recent Diaries</a></li>
                <li class="divider"></li>
                <li><a href="PopularBabies.jsp" title="">Popular Babies</a></li>
                <li class="divider"></li>
                <li><a href="Q&A.jsp" title="">Q&A</a></li>
                <li class="divider"></li>
                <%--fail to setAttribute maybe the reason why my previous codes have bugs for login, here is the auto place where new users get registered in our system--%>
                <%
    				UserService userService = UserServiceFactory.getUserService();
    				User user = userService.getCurrentUser();
    				if (user != null) {
     					pageContext.setAttribute("user", user); 
     					    List<AppUser> list = OfyService.ofy().load().type(AppUser.class).list();
    						if (list.isEmpty()){
    							OfyService.ofy().save().entities(new AppUser(user.getNickname(),user.getEmail())).now();
    						}else{
    							boolean flag = false;
    							for (AppUser a:list){
    								if (a.userName.equals(user.getNickname())){
    									flag = true;
    									break;
    								}
    							}
    							if (!flag){
    								OfyService.ofy().save().entities(new AppUser(user.getNickname(),user.getEmail())).now();
    							}   
    						}            	
                %>
                		<li><a href="Login.jsp" title="">Logout</a></li>
                <%
                	}else{
                %>
                		<li><a href="Login.jsp" title="">Login</a></li>	
                <%
    				}
				%>
            </ul>
        </div>
        <div id="logo"><a href="index.html"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>
     </div><!--end of header-->
<%--This part is for background and should be the same for all pages--%>

    <div class="slider_content">	     
     	<form name="addBabyInput" action="addBabyServlet" method="get">
		<ul>
        	<li>
        		<label for="firstName"><b>First Name:</b></label>
            	<input type="text" size="50" id="name" name="firstName" />
        	</li>
        	<li>
        		<label for="lastName"><b>Last Name:</b></label>
            	<input type="text" size="50" id="name" name="lastName" />
        	</li>
        	<li>
        		<label for="gender"><b>Gender:</b></label>
            	<input type="text" size="50" id="name" name="gender"/>
        	</li>
        	<li>
        		<label for="url"><b>URL to cover image(optional):</b></label>
            	<input type="text" size="50" id="url" name="url" />
        	</li>

			<li>
        		<label for="date of birth"><b>Date Of Birth:</b></label>
            	<input type="text" maxLength="4" size="2" onKeypress="if (event.keyCode < 48 || event.keyCode > 57) event.returnValue = false;" id="date" name="year" />
            	<label for="date of birth"><b>-</b></label>
            	<input type="text" maxLength="2" size="1" onKeypress="if (event.keyCode < 48 || event.keyCode > 57) event.returnValue = false;" id="date" name="month" />
        		<label for="date of birth"><b>-</b></label>
            	<input type="text" maxLength="2" size="1" onKeypress="if (event.keyCode < 48 || event.keyCode > 57) event.returnValue = false;" id="date" name="day" />
            	<label for="date of birth"><b> year-month-day</b></label>
			</li>

		</ul>
    	<p>
        	<button type="reset" class="right">Reset</button>
        	<button type="submit" class="action">Add A Baby</button>
    	</p>
		</form>
    	<div class="clear"></div>
    </div>
</div>
</body>
</html>