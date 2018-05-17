
<html>
<head>
<title>Logout</title>
</head>
<body>
<jsp:include page="nav_customer.jsp" />
<% 
Cookie[] theCookies = request.getCookies();
if(theCookies != null){
	for (Cookie tempCookie : theCookies ){
		if("current_user".equals(tempCookie.getName())){
			tempCookie.setValue("Admin");
			response.addCookie(tempCookie);
		}
		if("current_id".equals(tempCookie.getName())){
			tempCookie.setValue("0");
			response.addCookie(tempCookie);
		}
	}
}
%>
<p>You have been successfully logout</p>

<jsp:include page="footer.html" />
</body>
</html>