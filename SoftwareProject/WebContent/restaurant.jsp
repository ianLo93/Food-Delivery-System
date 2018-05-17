<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="jconnect.database.*" %>

<!doctype html>
<html>
    
    <head>
	   <title>Online Ordering</title>
	   <link rel="stylesheet" type="text/css" href="css/restaurant.css"/>
    </head>

    <body>
	   <jsp:include page="nav_customer.jsp" />
        
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
        
        String restaurant_id = request.getParameter("restaurant_id");
        ReviewMenu menus = new ReviewMenu(Integer.valueOf(restaurant_id));
        
        
        %>
        <div id="title">
            <div id="resImg">
                <img src = "<%=menus.getRestaurantImage_path()%>">
            </div>
            <div id="resTitle">
            		<%= menus.getCurrent_restaurant_name() %>
			</div>
            <div id="deliFee">Delivery Fee: $<%= menus.getDelivery_fee() %></div>
        </div>
        
        
     
        <div id="contentAndCart">
            <div id="cart">
                <button type="button" value="" id=cartHeader onclick='hideOrder()'>
                    YOUR ORDER CART
                </button>
                <div id="resName">
                    <%= menus.getCurrent_restaurant_name() %>
                </div>
                <form id="form" action="checkout.jsp">
                    <div id="items">
                    </div>
                    <div id="total">
                        <div class="totalLabel">Subtotal</div>
                        <div class="itemNum" id="subtotal">$0.00</div>
                        <div class="totalLabel">Delivery Charge</div>
                        <div class="itemNum" id=deli>$1.00</div>
                        <div class="totalLabel">Tax</div>
                        <div class="itemNum" id="tax">$0.00</div>
                        <div class="totalLabel" id="TOTALlabel">TOTAL</div>
                        <div class="itemNum" id="TOTAL">$1.00</div>
                    </div>
                    <div id="hiddens">
                        <input type="hidden" name="user" value=<%= username %> />
                        <input type="hidden" name="res" value="<%=restaurant_id %>" />
                        <input type="hidden" id="numH" name="num" value="0" />
                    </div>
                    <input type="submit" id="return_btn" value="Check Out" onclick="return confirm('Are you sure you want to check out?')">
                	</form>
            </div>
            
            <div id="content">
                
                <div id="tabs">
                <%
            		ArrayList<String> categories = menus.getCategory();
            		for (int i = 0; i < categories.size(); i++){
            		%>
                    <a class="tab" href="#1"><%=categories.get(i) %></a>
                <%
            		}
                %>
                
                </div>
                <div id="contentBody">
                		<%
                		for (int i = 0; i < categories.size(); i++){
                		%>
                    <div class="tagline" id="1"> <%=categories.get(i) %>> </div>
                    <div class="module">
                    
                    		<%
                    		EditCart cart = new EditCart();
                    		ArrayList<ArrayList<String>> dishes = menus.getDishByCategory(categories.get(i));
                    		for (int j = 0; j < dishes.size(); j++){ 
                    			System.out.println(dishes.get(j).get(0));

                    		%>
                        <div class="cell">
                            <img src="images/banner.jpg" class="">
                            <%-- <img src="<%=dishes.get(j).get(6) %>" class=""> --%>
                            <% System.out.println(dishes.get(j).get(6)); %>
                            <div class="cellRight">
                                <label id="<%= dishes.get(j).get(0) %>"><%=dishes.get(j).get(1) %></label>
                                <div class="pricediv">
                                    <div class="priceL">$</div>
                                    <div class="price" id = "<%= dishes.get(j).get(0)%>price"><%= dishes.get(j).get(3) %></div>
                                
                                </div>
                                
                                <button type="button" style="display: inline-block" class="add_btn" id="<%= dishes.get(j).get(0) %>add_btn" onclick="addToOrder('<%= dishes.get(j).get(0) %>')">Add to Cart</button>
                                <div class="counter" style="display: none" id="<%= dishes.get(j).get(0) %>counter">
                                    <button type="button" id="down" class="upDown" onclick="modify_qty(-1,'<%= dishes.get(j).get(0) %>')">-</button>
                                    <input id="<%= dishes.get(j).get(0) %>qty" class="qty" value="1" />
                                    <button type="button" id="up" class="upDown" onclick="modify_qty(1, '<%= dishes.get(j).get(0) %>')">+</button>
                                </div>
                                
                            </div>
                        </div>
                        
                        <%
                        }
                		}
                        %>
   
                    </div>
                </div>
            </div>
        </div>
 

        <jsp:include page="footer.html" />
    </body>
    
    
<script src="js-files/restaurant.js"></script>
</html>



