<div class="nav">
       <a class="logo_btn" href="#">
           <img src="images/logo.png">
       </a>
       <a class="nav_btn1" href="index.jsp">
           <img src="images/icons/018-house.png" align="left">
           HOME
       </a>
       <a class="nav_btn2" href="my-order.jsp">
           <img src="images/icons/017-list.png" align="left">
           MY ORDER
       </a>
       <a class="nav_btn3" href="#">
           <img src="images/icons/014-trip-handbag.png" align="left">
           JOIN US
       </a>
       <a class="nav_btn4" href="#">
           <img src="images/icons/001-question.png" align="left">
           HELP
       </a>
		<%
		String username = "Admin";
		Cookie[] theCookies = request.getCookies();
		if(theCookies != null){
			//System.out.println("Is looking for your cookie...");
			for (Cookie tempCookie : theCookies ){
				if("current_user".equals(tempCookie.getName())){
					username = tempCookie.getValue();
					break;
				}
			}
		}
		if (username.equals("Admin" )){
		%>
		<a class="login_btn" href="login.jsp">Login/Signup</a>
		<% 	
		}
		else{
		%>
		
		<a class="login_btn" href="logout.jsp"  >Logout</a>
		<a class="login_btn" ><%= username %></a>
		
		<%
		}
		%>


  
</div>
        
<div id="nav_hidden"></div>

<style type="text/css">

.nav {
    float: top;
    background-color: white;
    padding: 0;
    margin: 0;
    display: block;
    height: 60px;
    width: 100%;
    min-width: 24em;
	font-size: 32px;
    line-height: 60px;
    -webkit-box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.09);
    -moz-box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.09);
    box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.09);
    position: fixed;
    z-index: 99;
}

.nav a {
    color: #302030;
    text-decoration: none;
}

.logo_btn {
    margin-left: 30px;
    margin-top: 2px;
    float: left;
}

.logo_btn img {
    width: 60px;
    height: auto;
    margin-top: 3px;
}

.nav_btn1, .nav_btn2, .nav_btn3, .nav_btn4 {
    height: 50px;
    display: inline-block;
    margin: 0 10px;
    line-height: 24px;
    font-size: 21px;
    font-weight: 150;
    font-family: 'Trebuchet MS', Helvetica, sans-serif;
}

.nav_btn1, .nav_btn4 {
    width: 88px;
}

.nav_btn2 {
    width: 128px;
}

.nav_btn3 {
    width: 108px;
}

.nav_btn1 img, .nav_btn2 img, .nav_btn3 img, .nav_btn4 img {
    width: 21px;
    height: auto;
}

.login_btn {
    height: 15px;
    margin-right: 1em;
    margin-top: 12px;
    padding: 0.7em 1.5em;
    border: solid #302030 1.5px;
    border-radius: 80px;
    line-height: 14px;
    font-size: 15px;
    font-weight: 150;
    float: right;
    font-family: 'Trebuchet MS', Helvetica, sans-serif;
}

#nav_hidden {
    height: 63px;
}
</style>