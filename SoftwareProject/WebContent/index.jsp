<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="jconnect.database.*" %>

<html>
    
    <head>
	   <title>Online Ordering</title>
	   <link rel="stylesheet" type="text/css" href="css/main.css"/>
    </head>

    <body>
   
    	<jsp:include page="nav_customer.jsp" />
    	

    
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
                
                <%
                ArrayList<ArrayList<String>> restaurant = Menu.getRestaurant("*", "all", " ");
                for (int i = 0; i < restaurant.size(); i++){
                	%>
                	    <form class="restaurant" action="restaurant.jsp">
                    <input type="hidden" name="restaurant_id" value="<%=restaurant.get(i).get(0) %>" />
                    <input type="hidden" name="user_id" value="0000" />
                    <input type="submit" class="cell" id="cell1" value="<%= restaurant.get(i).get(1) %>" />
                   
                </form>
                	<%
                }
                %>
            </div>
        </div>
           
        <jsp:include page="footer.html" />
    </body>
    
</html>

<style type="text/css">
</style>
