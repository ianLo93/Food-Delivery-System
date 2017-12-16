<!doctype html>
<html>
    
    <head>
	   <title>Ordering - Order Retrieval</title>
	   <link rel="stylesheet" type="text/css" href="css/order-retrieve.css"/>
    </head>

    <body>
	    <jsp:include page="nav_restaurant.html" />
        
        
        
        <div id="title">
            <div id="resImg">
                <img src = "images/banner.jpg">
            </div>
            <div id="resTitle">Restaurant Name</div>
            <div id="pageName">Order Retrieval</div>
        </div>        
        
        
        <div id="contentAndCart">
            <div id="cart">
                <div id=cartHeader>
                    ORDERS
                </div>
                <div id="form">
                    <div id="items">
                        <form action="order-retrieve.jsp">
                            <button class="item" onclick="this.form.submit()" style="background-color: white">
                                <input type="hidden" name="new" value="new"/>
                                <input type="hidden" name="order" value="000002"/>
                                <div class="orderNum">000002</div>
                                <div class="newState">New!</div>
                            </button>                        
                        </form>
                        <form action="order-retrieve.jsp">
                            <button class="item" onclick="this.form.submit()" style="background-color: lightsteelblue">
                                <input type="hidden" name="order" value="000001"/>
                                <div class="orderNum">000001</div>
                                <div class="processingState">Processing</div>
                            </button> 
                        </form>
                        <form action="order-retrieve.jsp">
                            <button class="item" onclick="this.form.submit()" style="background-color: white">
                                <input type="hidden" name="order" value="000000"/>
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
                        <label id="firstnameL">First Name:</label>
                        <label class="name">fisrtname</label>
                        <label id="lastnameL">Last Name:</label>
                        <label class="name">lastname</label>
                    </div>
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
                    </tr>
                    <tr>
                        <td>xxxxxxxx</td>
                        <td>1</td> 
                    </tr>
                    <tr>
                        <td>xxxxxxxx</td>
                        <td>2</td> 
                    </tr>
                </table>
                
                <input type="hidden" name="order" value="000001"/>
                <input type="hidden" name="complete" value="complete"/>
				<input type="submit" id="submit_btn" value="COMPLETE"/>
            </form>
        </div>
        

    
    
        <jsp:include page="footer.html" />
    </body>
    
</html>