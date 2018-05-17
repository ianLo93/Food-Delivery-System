<!doctype html>
<html>
    
    <head>
	   <title>Online Ordering - Customer Signup</title>
	   <link rel="stylesheet" type="text/css" href="css/login.css"/>
    </head>

    <body>
	   <jsp:include page="nav_customer.jsp" />
        
        <div id="content">
            <div class="tabs">
                <a class="tab1" href="signup.jsp">I'm a CUSTOMER</a>                    
                <div class="tab2">I'm a VENDOR</div>
            </div>
            <p id="tagline1">Sign Up</p>
            <p id="tagline2">as a VENDOR</p>
                
            <form action="login-signup-response.jsp">
                <input type="hidden" name="login" value="false" />
                <input type="hidden" name="usertype" value="vendor" />
                <p>
                    <label id="username">Username:</label>
                    <input type="text" name="username" class="inputs"/>
                </p>
                <p>
                    <label id="password">Password:</label>
                    <input type="password" name="password" class="inputs"/>
                </p>
                <p>
                    <label id="confirm">Confirm Password:</label>
                    <input type="password" name="confirm" class="inputs"/>
                    <small style="color: whitesmoke">ERROR!</small>
                </p>
                <p>
                    <label id="email">E-mail:</label>
                    <input type="text" name="email" class="inputs"/>
                </p>
                <input type="submit" id="submit_btn" value="SIGNUP">                </input>
            </form>
            <div id="toSignup">    
                <a href="login-vendor.jsp">Already have an account?</a>
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