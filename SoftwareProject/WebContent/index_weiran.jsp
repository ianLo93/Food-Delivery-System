<%@ page import="jconnect.database.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager,java.util.ArrayList" %>



<html>
    
    <head>
	   <title>Food Order Here!</title>
	   <link rel="stylesheet" type="text/css" href="css/main.css"/>
    </head>

    <body>
	   <div class="nav">

           <a class="logo_btn" href="#">
               <img src="images/logo.png">
           </a>
        
           <a class="nav_btn1" href="#">
               <img src="images/icons/018-house.png" align="left">
               <p >HOME</p>
           </a>
           <a class="nav_btn2" href="#">
               <img src="images/icons/017-list.png" align="left">
               <p>MY ORDER</p>
           </a>
           <a class="nav_btn3" href="#">
               <img src="images/icons/014-trip-handbag.png" align="left">
               <p>JOIN US</p>
           </a>
           <a class="nav_btn4" href="#">
               <img src="images/icons/001-question.png" align="left">
               <p>HELP</p>
           </a>
           
           <%
           if (Login.ObjectExist()){
           %>
           <a class="login_btn" ><p><%= Login.getUser() %></p></a>
           <%
           }else{
           %>
           <a class="login_btn" href="http://localhost:8080/SoftwareProject/login.jsp"><p>Login/Signup</p></a>
           <%
           }
           %>
           
           
        </div>
        
        <div id="nav_hidden"></div>
        
	   <div id="banner"></div>
        
        <div id="contentAndAnnouncement">
            <div id="announcement">
                <dl>
                    <dt>Welcome to our online ordering system!</dt>
                    <br/><br/><br/>
                    <dt>Annoucements:</dt>
                    <br/>
                    <dd>The system is working 24/7.</dd>
                    <dd>Two more restaurants will join us soon!</dd>
                </dl>
            </div>
            <div id="content">
                <p id="tagline1">Order food like from home!</p>
                <p id="tagline2">Ordering from your favorite restaurant is even easier than eating.</p>
                
                <div class="restaurant">
                
                <%
                ArrayList<ArrayList<String>> result = DatabaseInfo.getRestaurant("*", "all", "");        
                for (int i = 0; i < result.size(); i++){
                
                %>
                		<input type="hidden" name="restaurant_id" value="<%= result.get(i).get(0)%>">
                    <a class="cell"  href="#">
                        <p><%= result.get(i).get(1) %></p>
                    </a>
                <%
                }
                
                %>
          
                </div>
            </div>
        

        </div>
           
        <jsp:include page="footer.html" />
    </body>
    
</html>

<style type="text/css">
</style>
