<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="jconnect.database.*" %>

<!doctype html>
<html>
    
    <head>
	   <title>Ordering - Order Retrieval</title>
	   <link rel="stylesheet" type="text/css" href="css/my-order.css"/>
    </head>

    <body>
    		<jsp:include page="nav_customer.jsp" /> 
    	    <jsp:useBean id="cusOrder" class="jconnect.database.CusOrderBean" />
	    <jsp:setProperty property="*" name = "cusOrder" />
	    <jsp:useBean id="cusItem" class="jconnect.database.CusItemBean" />
	    <jsp:setProperty property="*" name = "cusItem" />
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
	    		<jsp:setProperty property="customer_id" name = "cusOrder" value = "<%= user_id %>" />
	    	<% }
	    else {             
	    		String redirectURL = "login.jsp";
            response.sendRedirect(redirectURL);
        }%>
	    	
		<% System.out.println("Order number: " + cusOrder.getOrder_num()); %>
        <% CusOrderRetrival.retriveItems(cusItem); %>
        <%
        float deliverfee = 0.0f;
        try{
        int num_dish = Integer.valueOf(request.getParameter("num_dish"));
        String restaurant_id = request.getParameter("res");
        String username = request.getParameter("user");
        String lastname = request.getParameter("lastname");
        String firstname = request.getParameter("firstname");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String special_instruction = request.getParameter("specInst");
        deliverfee = Float.parseFloat(request.getParameter("deliver_fee"));
        //float deliverfee = Float.parseFloat(request.getParameter("deliver_fee"));
        
        PlaceOrder order = new PlaceOrder();
        
        EditCart foodcart = new EditCart();
        for (int i = 0; i < num_dish; i++){
        		String dish_info = request.getParameter(Integer.toString(i)+"qty");
        		System.out.println(dish_info);
			int dish_id = Integer.valueOf(dish_info.substring(0, 4));
			int dish_num = Integer.valueOf(dish_info.substring(4, 5));
			CartItem item = new CartItem(dish_id, dish_num);    				
			foodcart.addItem(item);
        }
        order.setCart(foodcart.getAllItem());
        order.setInstruction(special_instruction);
        order.setAddress(address);
        order.setRestaurant_id(Integer.valueOf(restaurant_id));
        order.setCustomer_id(username);      
        order.insert2order_info();
        order.insert2order_item();
		cusOrder.setOrder_num(order.order_num);
		cusOrder.setCustomer_id(order.getCustomer_id());
		cusItem.setOrder_num(order.order_num);
        }catch(Exception ex) {
        		try{
        			ReviewMenu rest_menu = new ReviewMenu(cusItem.getItemLs().get(0).getResId());
        			deliverfee = rest_menu.getDelivery_fee();
        		}catch(Exception ex1) {}
        }

        %>
        <% CusOrderRetrival.retriveItems(cusItem); %>
        <div id="contentAndCart">
            <div id="cart">
                <div id=cartHeader>
                    ORDERS
                </div>
                <div id="form">
                    <div id="items">
                    
                    <% try{
                    	out.println("order number: "+cusOrder.getOrder_num());
                    	out.println("customer_id: " + cusOrder.getCustomer_id());
                    out.println("size: "+CusOrderRetrival.getOrders(cusOrder).size());
                    	for(Map.Entry<Integer, String> entry : CusOrderRetrival.getOrders(cusOrder).entrySet()){
                    		if(entry.getValue().equalsIgnoreCase("new")){ %>
                        <form action="my-order.jsp">
                            <input type="hidden" name="order_num" value="<%= entry.getKey() %>" />
                            <% out.println("order_num" + entry.getKey()); %>
                            <button class="item" onclick="this.form.submit()" style="background-color: white">
                                <div class="orderNum"><%= entry.getKey() %></div>
                                <div class="newState">Order Sent</div>
                            </button>                        
                        </form>
                        <% } else if(entry.getValue().equalsIgnoreCase("Accepted")) { %>
                        <form action="my-order.jsp">
                            <input type="hidden" name="order_num" value="<%= entry.getKey() %>"/>
                            <button class="item" onclick="this.form.submit()" style="background-color: lightsteelblue">
                                <div class="orderNum"><%= entry.getKey() %></div>
                                <div class="processingState">Accepted</div>
                            </button> 
                        </form>
                        <% 
                    	    } else { 
                        %>
                        <form action="my-order.jsp">
                            <input type="hidden" name="order_num" value="<%= entry.getKey() %>"/>
                            <button class="item" onclick="this.form.submit()" style="background-color: white">
                                <div class="orderNum"><%= entry.getKey() %></div>
                                <div class="completeState">Completed</div>
                            </button>                        
                        </form>
                        <% } } } catch(Exception ex) {}%>
                    </div>
                </div>
            </div>
            
   
            <%
            if (cusOrder.getOrder_num() != 0){
            	out.println("valid order number");
            %>
            <form action="order-retrieve.jsp" id="content">
				
				<div id="tagline1">Delivery Information <%= cusOrder.getOrder_num() %></div>
                
                <div class="module">
                    <div>
                        <label id="phoneL">Phone Number:</label>
                        <label id="phone"><%= cusOrder.getPhone() %></label>
                    </div>
                    <div>
                        <label id="specInstL">Special Instruction:</label>                  
                        <label id="specInst"><%= cusOrder.getSpecial_instruction() %></label>
                    </div>
                    <div>
                        <label id="addressL">Address:</label>
                        <label id="address" ><%= cusOrder.getAddress() %> </label>
                    </div>
                </div>
				
                <div id="tagline1">Order Information</div>
                <table>
                    <tr>
                        <th>Item Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                    </tr>
               		<% 
               		try {
                    	float totalprice = 0;
                    	System.out.println("SIZE:" +cusItem.getItemLs().size());
                    	for(ItemInfo item: cusItem.getItemLs()) { %>
                    <tr>
                        <td><%= item.getName() %></td>
                        <td><%= item.getQuant() %></td>
                        <td><%= item.getPrice() %></td>
                    </tr>
                    <% 	totalprice = totalprice+item.getPrice()*item.getQuant();
                    	} 
                    	cusItem.setPrice(totalprice);
                    } catch(Exception ex) {}%>
                </table>
                <div>
                    <label id="delFeeL">Delivery Fee:</label>
                    <label class="fee">$<%= deliverfee %></label>
                </div>
                <div>
                    <label id="taxL">TAX:</label>
                    <label class="fee">$<%= cusItem.getPrice()*0.08 %></label>
                </div>
                <div>
                    <label id="totalL">Total Price:</label>
                    <label id="total">$<%= cusItem.getPrice()+cusItem.getPrice()*0.08+deliverfee %> </label>
                </div>
            </form>
            <% } %>
        </div>
        
        

    
        <jsp:include page="footer.html" />
    </body>
    
</html>