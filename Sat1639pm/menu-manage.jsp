<!doctype html>
<html>
    
    <head>
	   <title>Online Ordering - Menu Management</title>
	   <link rel="stylesheet" type="text/css" href="css/menu-manage.css"/>
    </head>

    <body>
	    <jsp:include page="nav_restaurant.html" />
        
        <div id="title">
            <div id="resImg">
                <img src = "images/banner.jpg">
            </div>
            <div id="resTitle">
            		<%= request.getParameter("id") %>
			</div>
            <div id="deliFee">Delivery Fee: $<%= request.getParameter("id") %></div>
        </div>
        
        <script type="text/javascript">
            //if myselect==null and newName==null, no alert. Change the value of submit_btn to CREATE, and remove the hidden value. Change <option selected="selected" value="NEW">CREATE NEW ITEM</option> to <option value="NEW">CREATE NEW ITEM</option>.
            //if myselect==null and newName!=null and name==null, "The information of 0000 is created."
            //if myselect==null and newName!=null and name!=null, "The information of 0000 is updated."
            //if myselect!=null, no alert. In this case, set value of the newName, price, category according to myselect. (For category, add selected="selected" to the corresponding option, e.g. <option selected="selected" value="0000">0000</option>.) If myselect=="NEW", change the value of submit_btn to CREATE, and remove the hidden value.
            alert("The information of 0000 is updated.");
        </script>
        
        
        
        <div id="contentAndSelect">
            <form action="menu-manage.jsp" id="select">
                <label>Update information for a item OR create a new item:</label>
                <select name="myselect" id="myselect" onchange="this.form.submit()">
                    <option></option>
                    <option value="0000">Dish 1</option>
                    <option value="0001">Dish 2</option>
                    <option value="0002">Dish 3</option>
                    <option value="0003">Dish 4</option>
                    <option value="NEW">CREATE NEW ITEM</option>
                </select>
            </form>
            
            <form name="Form" action="menu-manage.jsp" id="content" onsubmit="return validateForm()">
                
                <div id="tagline1">Item Information</div>
                
                <div class="module">
                    <input type="hidden" name="name" value="0000">
                    <div>
                        <label id="nameL">Item Name:</label>
                        <input type="text" name="newName" class="inputs" placeholder="  No more than 60 charactors"/>
                    </div>
                    <div>
                        <label id="picL">Upload Picture:</label>
                        <input type="file" id="pic" accept="image/png, image/jpeg" name="pic" class="inputs"/>
                    </div>
                    <div>
                        <label id="priceL">Item Price:</label>
                        <input type="number" name="price" class="inputs" min="0"/>
                    </div>
                    <div>
                        <label id="categoryL">Category:</label>
                        <select id="category" name="category" class="inputs" >
                            <option></option>
                            <option value="0000">Category 1</option>
                            <option value="0000">Category 2</option>
                            <option value="0000">Category 3</option>
                            <option value="NEW">CREATE NEW CATEGORY</option>
                        </select>                                                 
                    </div>
                    <div id="newCat">
                        <label id="newCatL">Category Name:</label>
                        <input type="text" name="newCat" class="inputs" placeholder="  No more than 50 charactors"/>
                    </div>
                </div>
                
                <div>
                    <input type="reset" class="btn">
                    <input type="submit" class="btn" id="submit_btn" value="UPDATE"/>
                </div>
                
            </form>
        </div>
        
        
        <jsp:include page="footer.html" />
    </body>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="js-files/menu-manage.js"></script>    
</html>
