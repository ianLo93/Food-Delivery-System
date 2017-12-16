<!doctype html>
<html>
    
    <head>
	   <title>Ordering - Order Retrieval</title>
	   <link rel="stylesheet" type="text/css" href="css/my-order.css"/>
    </head>

    <body>
	   
	    <jsp:include page="nav_customer.html" />
        
        <div id="contentAndCart">
            <div id="cart">
                <div id=cartHeader>
                    ORDERS
                </div>
                <div id="form">
                    <div id="items">
                        <form action="my-order.jsp">
                            <input type="hidden" name="order" value="000002"/>
                            <button class="item" onclick="this.form.submit()" style="background-color: white">
                                <div class="orderNum">000002</div>
                                <div class="newState">Order Sent</div>
                            </button>                        
                        </form>
                        <form action="my-order.jsp">
                            <input type="hidden" name="order" value="000001"/>
                            <button class="item" onclick="this.form.submit()" style="background-color: lightsteelblue">
                                <div class="orderNum">000001</div>
                                <div class="processingState">Accepted</div>
                            </button> 
                        </form>
                        <form action="my-order.jsp">
                            <input type="hidden" name="order" value="000000"/>
                            <button class="item" onclick="this.form.submit()" style="background-color: white">
                                <div class="orderNum">000000</div>
                                <div class="completeState">Completed</div>
                            </button>                        
                        </form>
                    </div>
                </div>
            </div>
            
            
            <form action="order-retrieve.jsp" id="content">
				
				<div id="tagline1">Delivery Information</div>
                
                <div class="module">
                    <div>
                        <label id="phoneL">Phone Number:</label>
                        <label id="phone">0000000000</label>
                    </div>
                    <div>
                        <label id="specInstL">Special Instruction:</label>
                        
                        <label id="specInst">xxxxxxxxxxxxxx xxxxxxxxxxx xxxxx xxxxx xxxxxxxxxxxxxx xxxxxxxxx xxxxxxx</label>
                    </div>
                    <div>
                        <label id="addressL">Address:</label>
                        <label id="address" >xxxxxxxxxxxx xxxxx xxxx xxxxxx xxxxx xxxx xxxx xxxx xxx xxxx xxx </label>
                    </div>
                </div>
				
                <div id="tagline1">Order Infomation</div>
                <table>
                    <tr>
                        <th>Item Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                    </tr>
                    <tr>
                        <td>xxxxxxxx</td>
                        <td>1</td>
                        <td>$10.00</td>
                    </tr>
                    <tr>
                        <td>xxxxxxxx</td>
                        <td>2</td>
                        <td>$12.00</td>
                    </tr>
                </table>
                <div>
                    <label id="delFeeL">Delivery Fee:</label>
                    <label class="fee">$1.00</label>
                </div>
                <div>
                    <label id="taxL">TAX:</label>
                    <label class="fee">$1.76</label>
                </div>
                <div>
                    <label id="totalL">Total Price:</label>
                    <label id="total">$24.76</label>
                </div>
            </form>
        </div>
        
        

    
        <jsp:include page="footer.html" />
    </body>
    
</html>