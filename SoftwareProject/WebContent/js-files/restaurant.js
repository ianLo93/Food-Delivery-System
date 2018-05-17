    function hideOrder() {
        if (document.getElementById("form").style.display == "block") {
            document.getElementById("form").style.display = "none";
            document.getElementById("resName").style.display = "none";
            document.getElementById("cart").style.width = "10em";
            document.getElementById("cartHeader").style.borderBottomLeftRadius = "9px";
            document.getElementById("cartHeader").style.borderBottomRightRadius = "9px";
            
        } else {
            document.getElementById("form").style.display = "block";
            document.getElementById("resName").style.display = "block";
            document.getElementById("cart").style.width = "20em";
            document.getElementById("cartHeader").style.borderBottomLeftRadius = "0px";
            document.getElementById("cartHeader").style.borderBottomRightRadius = "0px";
        }
    }
    
    function addToOrder(id) {
        document.getElementById(id+'add_btn').style.display = "none";
        document.getElementById(id+'counter').style.display = "inline-block";
        var dish = document.getElementById(id).innerHTML;
        var qty = document.getElementById(id+'qty').value;
        var price = parseFloat(document.getElementById(id+'price').innerHTML).toFixed(2);
        document.getElementById('items').innerHTML += '<div class="item" id="' + id + 'item"> <a class="itemName" href="#'+ id +'">' + dish + '</a> <div class="itemQtyL">Qty:</div> <div class="itemQty" id="' + id + 'itemQty">1</div> <div class="itemNum" id="' + id + 'itemNum">$' + price + '</div> <button class="remove" onclick="remove(\'' + id + '\')" value=""></button> </div>';
        
        var subtotal = parseFloat(document.getElementById('subtotal').innerHTML.substr(1));
        var deli = parseFloat(document.getElementById('deli').innerHTML.substr(1));
        subtotal += parseFloat(document.getElementById(id+'price').innerHTML);
        document.getElementById('subtotal').innerHTML = '$' + subtotal.toFixed(2);
        document.getElementById('tax').innerHTML = '$' + (subtotal*0.08).toFixed(2);
        document.getElementById('TOTAL').innerHTML = '$' + (subtotal*1.08+deli).toFixed(2)
        
        hidden(id, 2);
    }
    
    function remove(id) {
        var qty = document.getElementById(id+'qty').value;
        var price = parseFloat(document.getElementById(id+'price').innerHTML);
        var subtotal = parseFloat(document.getElementById('subtotal').innerHTML.substr(1));
        var deli = parseFloat(document.getElementById('deli').innerHTML.substr(1));
        
        document.getElementById(id+'add_btn').style.display = "inline-block";
        document.getElementById(id+'counter').style.display = "none";
        document.getElementById(id+'qty').value = 1;
        
        var element = document.getElementById(id+'item');
        element.parentNode.removeChild(element);
        
        subtotal = (subtotal-qty*price).toFixed(2);
        document.getElementById('subtotal').innerHTML = '$' + subtotal;
        document.getElementById('tax').innerHTML = '$' + (subtotal*0.08).toFixed(2);
        document.getElementById('TOTAL').innerHTML = '$' + (subtotal*1.08+deli).toFixed(2)
        
        hidden(id, -2);
    }
    
    function modify_qty(val, id) {
        var qty = document.getElementById(id+'qty').value;
        var new_qty = parseInt(qty,10) + val;
        var items = document.getElementById('items').innerHTML;
        var price = parseFloat(document.getElementById(id+'price').innerHTML);
        var subtotal = parseFloat(document.getElementById('subtotal').innerHTML.substr(1));
        var deli = parseFloat(document.getElementById('deli').innerHTML.substr(1));
        if (new_qty < 1) {
            document.getElementById(id+'add_btn').style.display = "inline-block";
            document.getElementById(id+'counter').style.display = "none";
            new_qty = 1;
            var element = document.getElementById(id+'item');
            element.parentNode.removeChild(element);
            hidden(id, -2);
        } else {
            document.getElementById(id+'itemQty').innerHTML=new_qty;
            document.getElementById(id+'itemNum').innerHTML='$'+ (new_qty*price).toFixed(2);
            hidden(id, val);
        }
        document.getElementById(id+'qty').value = new_qty;
        subtotal = (subtotal+val*price).toFixed(2);
        document.getElementById('subtotal').innerHTML = '$' + subtotal;
        document.getElementById('tax').innerHTML = '$' + (subtotal*0.08).toFixed(2);
        document.getElementById('TOTAL').innerHTML = '$' + (subtotal*1.08+deli).toFixed(2);
        return new_qty;
    }
    
    function hidden(id, val) {
        var num = parseInt(document.getElementById('numH').value,10);
        if (val === 1 || val === -1) {
            var a = document.getElementById(id+'H').value.substr(0,4);
            var qty = parseInt(document.getElementById(id+'H').value.substr(4),10) + val;
            document.getElementById(id+'H').value =  a + qty;
        } else if (val === 2) {
            document.getElementById('hiddens').innerHTML += ' <input type="hidden" id="' + id + 'H" name="' + num + '" value="' + id + 1 + '" />';
            document.getElementById('numH').value++;
        } else {
            var missNum = parseInt(document.getElementById(id+'H').name,10);
            var element = document.getElementById(id+'H');
            element.parentNode.removeChild(element);
            var a='';
            for (i=missNum+1;i<num;i++) {
                document.getElementsByName(''+i)[0].name = ''+ (i-1);
            }
            document.getElementById('numH').value--;
        }
    }

    window.onscroll = function() {myFunction()};

    function myFunction() {
        var offsetHeight = document.getElementById('tabs').offsetHeight;
        if (document.body.scrollTop > 79 || document.documentElement.scrollTop > 79) {
        document.getElementById("tabs").className = "tabFixed";
            document.getElementById("contentBody").style.marginTop =18+offsetHeight+"px";
        } else {
            document.getElementById("tabs").className = "";
            document.getElementById("contentBody").style.marginTop = "0px";
        }
    }
    
    
    // The function actually applying the offset
    function offsetAnchor() {
        if(location.hash.length !== 0) {
            window.scrollTo(window.scrollX, window.scrollY - 120);
        }
    }

    // This will capture hash changes while on the page
    window.addEventListener("hashchange", offsetAnchor);

    // This is here so that when you enter the page with a hash,
    // it can provide the offset in that case too. Having a timeout
    // seems necessary to allow the browser to jump to the anchor first.
    window.setTimeout(offsetAnchor, 0); // The delay of 1 is arbitrary and may not always work right (although it did in my testing).
