<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

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
                <%--fail to setAttribute maybe the reason why my previous codes have bugs for login--%>
                <%
    				UserService userService = UserServiceFactory.getUserService();
    				User user = userService.getCurrentUser();
    				if (user != null) {
     					pageContext.setAttribute("user", user);                	
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
     
        <div class="clear"></div>
	 </div> <!--end of slider content-->
	
	<div class="main_content">
    
    	<div class="clear"></div>
    </div>
</div>
</body>
</html>