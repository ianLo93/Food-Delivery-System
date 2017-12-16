    $(document).ready(function () {
        toggleFields(); // call this first so we start out with the correct visibility depending on the selected form values
        // this will call our toggleFields function every time the selection value of our other field changes
        $("#category").change(function () {
            toggleFields();
        });

    });
    // this toggles the visibility of other server
    function toggleFields() {
        if ($("#category").val() === "NEW")
            $("#newCat").show();
        else
            $("#newCat").hide();
    }
    
    function validateForm()
    {
        var a=document.forms["Form"]["newName"].value;
        var b=document.forms["Form"]["pic"].value;
        var c=document.forms["Form"]["price"].value;
        var d=document.forms["Form"]["category"].value;
        if (a==null || a=="", b==null || b=="", c==null || c=="", d==null || d=="")
        {
            alert("Please Fill All Fields");
            return false;
        }
        if (d=="NEW") {
            var e=document.forms["Form"]["newCat"].value;
            if (e==null || e=="") {
                alert("Please Fill All Fields");
            return false;
            }
        }
    }