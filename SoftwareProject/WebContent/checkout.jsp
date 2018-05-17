<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="jconnect.database.*" %>

<!doctype html>
<html>
    
    <head>
	   <title>Online Ordering - Checkout</title>
	   <link rel="stylesheet" type="text/css" href="css/checkout.css"/>
    </head>

    <body>
	   	<jsp:include page="nav_customer.jsp" />
        <% 
        String username = request.getParameter("user");
        if (username.equals("Admin" )){
            String redirectURL = "login.jsp";
            response.sendRedirect(redirectURL);
        }
        %>
        <% 
        String restaurant_id = request.getParameter("res");
        ReviewMenu temp = new ReviewMenu(Integer.valueOf(restaurant_id));
        
        String user_id = request.getParameter("user");
        EditCart foodcart = new EditCart();

        %>
        
        <div id="contentAndCart">
            <div id="cart">
                <div id=cartHeader>
                    YOUR ORDER CART
                </div>
                <div id="resName">
                    <%= temp.getCurrent_restaurant_name() %>
                </div>
                <div id="form">
               	 <div id="items">
                
                		<%
                		for(int i = 0; i < Integer.valueOf(request.getParameter("num")); i++){
            				String dish_info = request.getParameter(Integer.toString(i));
            				System.out.println(dish_info);
            				int dish_id = Integer.valueOf(dish_info.substring(0, 4));
            				int dish_num = Integer.valueOf(dish_info.substring(4, 5));
            			
            				CartItem item = new CartItem(dish_id, dish_num);    				
            				foodcart.addItem(item);
                
               		 %>    
                        <div class="item">
                            <div class="itemName"><%=item.DishName%>x<%=item.number %></div>
                            <div class="itemNum">$<%= item.price %></div>
                        </div> 
                    <%
                    }
                    %>
                  </div>
                    <div id="total">
                        <div class="totalLabel">Subtotal</div>
                        <div class="itemNum">$<%= foodcart.total_price() %></div>
                        <div class="totalLabel">Delivery Charge</div>
                        <div class="itemNum">$<%= temp.getDelivery_fee() %></div>
                        <div class="totalLabel">Tax</div>
                        <div class="itemNum">$<%= Math.round((foodcart.total_price()*foodcart.tax_rate) * 100.0) / 100.0 %></div>
                        <div class="totalLabel">TOTAL</div>
                        <div class="itemNum" id="TOTAL">$<%= Math.round((foodcart.total_price()*(1+foodcart.tax_rate)+temp.getDelivery_fee()) * 100.0) / 100.0 %></div>
                    </div>

                    <div id="return_btn">
                        <a onclick="history.back()" >Continue Ordering</a>
                    </div>
                </div>
            </div>
                
            
            <form action="my-order.jsp" id="content">
                <div id="tagline1">Delivery Information</div>
                
                <div class="module">
                    <div>
                        <label id="firstnameL">First Name:</label>
                        <input type="text" name="firstname" class="inputs_name"/>
                        <label id="lastnameL">Last Name:</label>
                        <input type="text" name="lastname" class="inputs_name"/>
                    </div>
                    <div>
                        <label id="phoneL">Phone Number:</label>
                        <input type="number" name="phone" class="inputs"/>
                    </div>
                    <div>
                        <label id="specInstL">Special Instruction:</label>
                        <textarea id="specInst" name="specInst" rows="4" cols="50">ASAP!</textarea>
                    </div>
                    <div>
                        <label id="addressL">Address:</label>
                        <textarea id="address" name="address"  id="inputs-area2" rows="3" cols="50"></textarea>
                    </div>
                </div>
                
                <div id="tagline1">Payment Information</div>
                <div class="module">  
                    <div>
                        <label id="cardNumL">Card Number:</label>
                        <input type="number" name="cardNum" class="inputs"/>
                    </div>
                    <div>
                        <label id="firstnameL">Card Holder:</label>
                        <input type="text" name="firstname" class="inputs_name"/>
                        <label id="lastnameL">CVV Code:</label>
                        <input type="text" name="lastname" class="inputs_name"/>
                    </div>
                    <div>
                        <label id="expiDateL">Expiration Date:</label>
                        <input type="month" name="expiDate" class="inputs" value="2017-11"/>
                    </div>
                    <div>
                        <label id="billZipL">Billing Zip Code:</label>
                        <input type="number" name="billZip" class="inputs"/>
                    </div>
                    <div>
                        <label id="billAddrL">Billing Address:</label>
                        <input type="text" name="billAddr" class="inputs"/>
                    </div>
                    
                    <div id="hiddens">
                        <input type="hidden" name="user" value="<%= username %>" />
                        <input type="hidden" name="res" value="<%= restaurant_id %>" />
                        <input type="hidden" id="deliver" name="deliver_fee" value="<%= temp.getDelivery_fee() %>" />
                        <input type="hidden" id = num_dish name = "num_dish" value = "<%= foodcart.getAllItem().size()%>"/>
                        <%
                        for (int i = 0; i <foodcart.getAllItem().size(); i++){
                        	CartItem temp_item = foodcart.getAllItem().get(i);
                        %>
                        <input type = "hidden" id = "<%=i%>qty" name = "<%=i %>qty" value = "<%=temp_item.DishId %><%=temp_item.number %>"/>
                        <%
                        } 
                        %>
                    </div>
                </div>
                    <input type="submit" id="submit_btn" value="PLACE  ORDER"/>
            </form>
        </div>
        
        <jsp:include page="footer.html" />
    </body>
    
</html>
