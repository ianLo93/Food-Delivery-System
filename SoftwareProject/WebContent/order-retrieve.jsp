<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="jconnect.database.*" %>
<%@ page import="jconnect.database.CartResponseBean" %>
<!doctype html>
<html>
    
    <head>
	   <title>Ordering - Order Retrieval</title>
	   <link rel="stylesheet" type="text/css" href="css/order-retrieve.css"/>
    </head>

    <body>
	    <jsp:include page="nav_restaurant.jsp" />
	    <jsp:useBean id = "obj" class = "jconnect.database.OrderBean"/>
		<jsp:setProperty property = "*" name = "obj"/>
		<jsp:useBean id = "items" class = "jconnect.database.ItemBean"/>
        <jsp:setProperty property="*" name="items"/>
        	<%
		int user_id = 0;
		Cookie[] theCookies = request.getCookies();
		if(theCookies != null){
			for (Cookie tempCookie : theCookies ){
				if("current_id".equals(tempCookie.getName())){
					user_id = Integer.valueOf(tempCookie.getValue());
					break;
				}
			}
		}
	    %>
	    <% if(user_id != 0){ %>
	    		<jsp:setProperty property="resId" name = "obj" value = "<%= user_id %>" />
	    	<% }
	    else {             
	    		String redirectURL = "login.jsp";
            response.sendRedirect(redirectURL);
        }%>
        
        <% if(obj.getState() != "NEW") 
			OrderRetrival.stateUpdate(obj);%>
		
        <div id="title">
            <div id="resImg">
                <img src = "images/banner.jpg">
            </div>
            <div id="resTitle">Restaurant Name</div>
            <div id="pageName">Order Retrieval</div>
        </div>        
        
        <%! String bgColor(String state){
        		if(state.equalsIgnoreCase("Processing"))
        			return "lightsteelblue";
        		else if(state.equalsIgnoreCase("New"))
        			return "white";
        		else
        			return "white";
       		 } %>
        
        <div id="contentAndCart">
            <div id="cart">
                <div id=cartHeader>
                    ORDERS
                </div>
                <div id="form">
                    <div id="items">
                    <% try{
                    	for(Map.Entry<Integer, String> entry : OrderRetrival.getOrderList(obj).entrySet()) {
                    		if(entry.getValue().equalsIgnoreCase("Processing")) { %>
                        <form action="order-retrieve.jsp">
                            <button class="item" onclick="this.form.submit()" style="background-color: <%= bgColor(entry.getValue()) %>">
                                <input type="hidden" name="order_num" value="<%= entry.getKey() %>"/>
                                <div class="orderNum"><%= entry.getKey() %></div>
                                <div class="processingState">Processing</div>
                            </button> 
                        </form>
                        	<% } else if(entry.getValue().equalsIgnoreCase("New")) { %>
                        <form action="order-retrieve.jsp">
                            <button class="item" onclick="this.form.submit()" style="background-color: white">
                                <input type="hidden" name="new" value="new"/>
                                <input type="hidden" name="order_num" value="<%= entry.getKey() %>"/>
                                <div class="orderNum"><%= entry.getKey() %></div>
                                <div class="newState">New!</div>
                            </button>                        
                        </form>
                        	<% } else { %>
                        <form action="order-retrieve.jsp">
                            <button class="item" onclick="this.form.submit()" style="background-color: white">
                                <input type="hidden" name="order_num" value="<%= entry.getKey() %>"/>
                                <div class="orderNum"><%= entry.getKey() %></div>
                                <div class="completeState">Completed</div>
                            </button>                        
                        </form>
                        <% } } } catch (Exception ex) {} %>
                    </div>
                </div>
            </div>
            
            <% OrderRetrival.retriveOrder(obj); %>
            <form action="order-retrieve.jsp" id="content" method="post">
				
				<div id="tagline1">Delivery Information <% out.println(obj.getOrder_num()); %></div>
                
                <div class="module">
                    <div>
                        <label id="firstnameL">First Name:</label>
                        <label class="name"><%=obj.getFirst_name() %></label>
                        <label id="lastnameL">Last Name:</label>
                        <label class="name"><%=obj.getLast_name() %></label>
                    </div>
                    <div>
                        <label id="phoneL">Phone Number:</label>
                        <label id="phone"><%=obj.getPhone() %></label>
                    </div>
                    <div>
                        <label id="specInstL">Special Instruction:</label>
                        
                        <label id="specInst"><%=obj.getSpecial_instruction() %></label>
                    </div>
                    <div>
                        <label id="addressL">Address:</label>
                        <label id="address" ><%=obj.getAddress() %> </label>
                    </div>
                </div>
				
				<% ItemRetrival.retriveOrder(items); %>
                <div id="tagline1">Order Information</div>
                <table>
                    <tr>
                        <th>Item Name</th>
                        <th>Quantity</th> 
                    </tr>
                <% try{
	                for(Map.Entry<String, Integer> entry : items.getItems().entrySet()) {
	                    out.println("<tr>"+
	                        "<td>" + entry.getKey() + "</td>" +
	                        "<td>" + entry.getValue() + "</td>" +
	                     "</tr>");
	                }
                } catch(Exception ex) {} %>
                </table>
                
                <input type="hidden" name="order_num" value="<%= obj.getOrder_num() %>" />
                <input type="submit" id="submit_btn" name="state" value="ACCEPT"/>
				<input type="submit" id="submit_btn" name="state" value="COMPLETE"/>
            </form>
        </div>
        

    
    
        <jsp:include page="footer.html" />
    </body>
    
</html>