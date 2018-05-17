<!doctype html>
<html>
    
    <head>
	   <title>Online Ordering - Vendor Login</title>
	   <link rel="stylesheet" type="text/css" href="css/login.css"/>
    </head>

    <body>
	   <jsp:include page="nav_customer.jsp" />
        
        <div id="content">
            <div class="tabs">
                <a class="tab1" href="login.jsp">I'm a CUSTOMER</a>                    
                <div class="tab2">I'm a VENDOR</div>
            </div>
            <p id="tagline1">Log In</p>
            <p id="tagline2">as a VENDOR</p>
                
            <form action="login-signup-response.jsp">
                <input type="hidden" name="login" value="true" />
                <input type="hidden" name="usertype" value="vendor" />
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
                <a href="signup-vendor.jsp">Haven't signed up yet? Create your account here!</a>
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
    background-color: darkgray;
    text-decoration: none;
    color: black;
}

.tab2 {
    width: 20em;
    height: 1em;
    border: solid #302030 1.5px;
    border-top-left-radius: 15px;
    border-top-right-radius: 15px;
    border-bottom: none;
    padding: 10px 12px;
    background-color: whitesmoke;
}
</style>