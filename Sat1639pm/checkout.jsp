<!doctype html>
<html>
    
    <head>
	   <title>Online Ordering - Checkout</title>
	   <link rel="stylesheet" type="text/css" href="css/checkout.css"/>
    </head>

    <body>
	   	<jsp:include page="nav_customer.html" />
        
        <div id="contentAndCart">
            <div id="cart">
                <div id=cartHeader>
                    YOUR ORDER CART
                </div>
                <div id="resName">
                    Restaurant 1
                </div>
                <div id="form">
                    <div id="items">
                        <div class="item">
                            <div class="itemName">Steamed Dumpling x2</div>
                            <div class="itemNum">$10.00</div>
                        </div>
                        <div class="item">
                            <div class="itemName">Fried Bean Curd with Vegetables x2
                            </div><div class="itemNum">
                                $12.00</div>
                        </div>
                    </div>
                    <div id="total">
                        <div class="totalLabel">Subtotal</div>
                        <div class="itemNum">$22.00</div>
                        <div class="totalLabel">Delivery Charge</div>
                        <div class="itemNum">$1.00</div>
                        <div class="totalLabel">Tax</div>
                        <div class="itemNum">$1.76</div>
                        <div class="totalLabel">TOTAL</div>
                        <div class="itemNum" id="TOTAL">$24.76</div>
                    </div>
                    <div id="return_btn">
                        <a href="restaurant.jsp">Continue Ordering</a>
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
                </div>
                    <input type="submit" id="submit_btn" value="PLACE  ORDER"/>
            </form>
        </div>
        
        <jsp:include page="footer.html" />
    </body>
    
</html>
