<%@ page import="jconnect.database.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager,java.util.ArrayList" %>

<html>

<body>
<h3> hello world of java </h3>

test database connection 
<% 
ArrayList<ArrayList<String>> result = DatabaseInfo.getRestaurant("*", "id", "811");
out.println(result.size());
for(int i = 0; i < result.size(); i++) {
	for (int j =0; j < result.get(i).size(); j++) {
		out.println(result.get(i).get(j));		
	}
}
//out.println(result);
%>

</body>

</html>