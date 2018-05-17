<%@ page import="jconnect.database.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager,java.util.ArrayList" %>

<html>

<%
String login_states = request.getParameter("login");
String actor = request.getParameter("usertype");
if (login_states.equals("true")) {
	String user = request.getParameter("username");
	String pwd = request.getParameter("password");
	
	Login current_user = new Login(user, pwd, actor);
	if (current_user.valid){
		Cookie nameCookie = new Cookie("current_user", user);
		nameCookie.setMaxAge(60*60);
		response.addCookie(nameCookie);
		Cookie idCookie = new Cookie("current_id", Integer.toString(current_user.getId()));
		nameCookie.setMaxAge(60*60);
		response.addCookie(idCookie);
		if (actor.equals("vendor")){
	%>	
	<jsp:include page="index_restaurant.jsp" />
	<%
		}else{
	 %> 
	 <jsp:include page="index.jsp" />
	 <% 
		}
	}
	else{	
%>
	<jsp:include page="login.jsp" />
<%	
	}
}
else{
	String user = request.getParameter("username");
	String pwd = request.getParameter("password");
	String confirm_pwd = request.getParameter("confirm");
	Signup current_user = new Signup(user, pwd, confirm_pwd, actor);
	if(current_user.valid){
		Cookie nameCookie = new Cookie("current_user", user);
		nameCookie.setMaxAge(60*5);
		response.addCookie(nameCookie);
		Cookie idCookie = new Cookie("current_id", Integer.toString(current_user.getId()));
		nameCookie.setMaxAge(60*60);
		response.addCookie(idCookie);
		if (actor.equals("vendor")){
%>
			<jsp:include page="index_restaurant.jsp" />
<%
		}else{
%>
			<jsp:include page="index.jsp" />
<% 
		}
	}else{
%>
		<jsp:include page="signup.jsp" />
<%		
	}
}
%>




</html>