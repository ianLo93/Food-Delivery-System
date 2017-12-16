<!doctype html>
<html>
    
    <head>
	   <title>Online Ordering</title>
	   <link rel="stylesheet" type="text/css" href="css/restaurant.css"/>
    </head>

    <body>
	   <jsp:include page="nav_customer.html" />
        
        
        <div id="title">
            <div id="resImg">
                <img src = "images/banner.jpg">
            </div>
            <div id="resTitle">
            		<%= request.getParameter("id") %>
			</div>
            <div id="deliFee">Delivery Fee: $<%= request.getParameter("id") %></div>
        </div>
        
        
        
            
        
        
        <div id="contentAndCart">
            <div id="cart">
                <button type="button" value="" id=cartHeader onclick='hideOrder()'>
                    YOUR ORDER CART
                </button>
                <div id="resName">
                    Restaurant Name
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
                        <input type="hidden" name="user" value="Useruseruser" />
                        <input type="hidden" name="res" value="Restaurantrestaurant" />
                        <input type="hidden" id="numH" name="num" value="0" />
                    </div>
                    <input type="submit" id="return_btn" value="Check Out" onclick="return confirm('Are you sure you want to check out?')">
                	</form>
            </div>
            
            <div id="content">
                
                <div id="tabs">
                    <a class="tab" href="#1">Category 1</a>
                    <a class="tab" href="#2">Categodasdadary 2</a>
                    <a class="tab" href="#category2">Category 2</a>
                    <a class="tab" href="#category2">Category 2</a>
                    <a class="tab" href="#category2">Category 2</a>
                    <a class="tab" href="#category2">Category 2</a>
                    <a class="tab" href="#category2">Category 2</a>
                    <a class="tab" href="#category2">Category 2</a>
                </div>
                
                <div id="contentBody">
                    <div class="tagline" id="1">Category 1</div>
                    <div class="module">
                        <div class="cell">
                            <img src="images/banner.jpg" class="">
                            <div class="cellRight">
                                <label id="0000">Steamed Dumpling</label>
                                <div class="pricediv">
                                    <div class="priceL">$</div>
                                    <div class="price" id="0000price">6.00</div>
                                </div>
                                <button type="button" style="display: inline-block" class="add_btn" id="0000add_btn" onclick="addToOrder('0000')">Add to Order</button>
                                <div class="counter" style="display: none" id="0000counter">
                                    <button type="button" id="down" class="upDown" onclick="modify_qty(-1,'0000')">-</button>
                                    <input id="0000qty" class="qty" value="1" />
                                    <button type="button" id="up" class="upDown" onclick="modify_qty(1,'0000')">+</button>
                                </div>
                            </div>
                        </div>
                        <div class="cell">
                            <img src="images/banner.jpg" class="">
                            <div class="cellRight">
                                <label id="0001">Fried Bean Curd with Vegetables Fried Bean Curd with Vegetables</label>
                                <div class="pricediv">
                                    <div class="priceL">$</div>
                                    <div class="price" id="0001price">10.00</div>
                                </div>
                                <button type="button" style="display: inline-block" class="add_btn" id="0001add_btn" onclick="addToOrder('0001')">Add to Order</button>
                                <div class="counter" style="display: none" id="0001counter">
                                    <button type="button" id="down" class="upDown" onclick="modify_qty(-1,'0001')">-</button>
                                    <input id="0001qty" class="qty" value="1" />
                                    <button type="button" id="up" class="upDown" onclick="modify_qty(1,'0001')">+</button>
                                </div>
                            </div>
                        </div>
                        <div class="cell">
                            
                        </div>
                        <div class="cell">
                            
                        </div>
                        <div class="cell">
                            
                        </div>
                    </div>
                
                    <div class="tagline" id="2">Category 2</div>
                    <div class="module">  
                        
                        <div class="cell">
                            
                        </div>
                        <div class="cell">
                            
                        </div>
                        <div class="cell">
                            
                        </div>
                        <div class="cell">
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        

        <jsp:include page="footer.html" />
    </body>
    
    
<script src="js-files/restaurant.js"></script>
</html>



