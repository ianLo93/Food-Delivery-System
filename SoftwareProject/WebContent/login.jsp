<!doctype html>
<html>
    
    <head>
	   <title>Online Ordering - Customer Login</title>
	   <link rel="stylesheet" type="text/css" href="css/login.css"/>
    </head>

    <body>
    	   <jsp:include page="nav_customer.jsp" />
    	   
       <div id="content">
            <div class="tabs">
                <div class="tab1">I'm a CUSTOMER</div>                    
                <a class="tab2" href="login-vendor.jsp">I'm a VENDOR</a>
            </div>
            <p id="tagline1">Log In</p>
            <p id="tagline2">as a CUSTOMER</p>
                
            <form action="login-signup-response.jsp">
            		<input type="hidden" name="login" value="true" />
            		<input type="hidden" name="usertype" value="customer" />
                <p>
                    <label id="username">Username:</label>
                    <input type="text" name="username" class="inputs"/>
                </p>
                <p>
                    <label id="password">Password:</label>
                    <input type="password" name="password" class="inputs"/>
                </p>
                <div id="errorInfo"></div>
                <input type="submit" id="submit_btn" value="LOGIN" />
            </form>
            <div id="toSignup">    
                <a href="signup.jsp">Haven't signed up yet? Create your account here!</a>
            </div>
        </div>
           
        
        
        <jsp:include page="footer.html" />
    </body>
    
</html>

<style type="text/css">
.tab1 {
    width: 20em;
    height: 1em;
    border: solid #302030 1.5px;
    border-top-left-radius: 15px;
    border-top-right-radius: 15px;
    border-bottom: none;
    padding: 10px 12px;
}

.tab2 {
    width: 20em;
    height: 1em;
    border: solid #302030 1.5px;
    border-top-left-radius: 15px;
    border-top-right-radius: 15px;
    border-bottom: none;
    padding: 10px 12px;
    background-color: darkgray;
    text-decoration: none;
    color: black;
}
</style>