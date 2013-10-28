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
     
        <!--left navigation bar-->
		<div class="featured-arrow"  id="stripNavL0">
			<a href="#"><img src="images/left_nav.gif" alt="" border="0" /></a>    
		</div>


        <div id="slider">                
                    <div class="panel">
                        <div class="tab1">

                        </div>
                        <div class="tab1">

                        </div>                        
                        <div class="tab1">

                        </div>         
                        <div class="tab1">
                            <p class="tab_content">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.</p>
                        </div>                                
                    </div>
        </div>

		<div class="featured-arrow" id="stripNavR0">
			<a href="#"><img src="images/right_nav.gif" alt="" border="0"/></a></div>

		</div>
		
		<%--make sure users login before they add a new baby--%>
		<%
			if (user != null){
		%>
		<a href="AddBaby.jsp" class="add_delete"><img src="images/read_more.gif" alt="" title="" border="0" /></a>
		<%
			}else{
		%>
		<a href="Login.jsp" class="add_delete"><img src="images/read_more.gif" alt="" title="" border="0" /></a>
		<%
			}
		%>
	    <%--end--make sure users login before they add a new baby--%>
	    
        <div class="clear"></div>
	</div> <!--end of slider content-->
	
	    <div class="main_content">
    	<div class="left_content">
                <div class="title">Welcome to Tom's Baby</div>
                <p class="discription_content">
This is an open baby diary platform, where you can record and share your baby's photos, stories, and interact with other parents. Enjoy it!
                </p> 
                
                <div class="title">Announcement</div>
				<div class="banner">
                <img src="images/news_icon.jpg" alt="" title="" class="news_icon" />
                <p class="banner_content">
Stay active to win ipad. Every month, top three active users will get ipad as a reward.
                </p>
                </div>           
                
                
        </div> <!--end of left content-->

    	<div class="right_content">
            <div class="title">Top Images</div>
                 
            <div class="project_box">  
                <div class="project_title_tab">
                    <div class="project_bullet">1</div>
                    <div class="project_title">Amy</div>  
                </div>
                <div class="project_content">
                <img src="images/project_thumb.jpg" alt="" title="" class="left_img" />
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                </div>
            </div>
            
            <div class="project_box">  
                <div class="project_title_tab">
                    <div class="project_bullet">2</div>
                    <div class="project_title">Jerry</div>  
                </div>
                <div class="project_content">
                <img src="images/project_thumb.jpg" alt="" title="" class="left_img" />
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                </div>
            </div>              
                
                      
        </div> <!--end of right content-->
    
    <div class="clear"></div>
    </div>
</div>
</body>
</html>