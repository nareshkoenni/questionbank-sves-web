<%@ page import="java.sql.*, com.model.DBCon"%>
<%
String uname=request.getParameter("uname");
String pwd=request.getParameter("pwd");
Connection con=DBCon.getConnection();
try {
	Statement s=con.createStatement();
	ResultSet rs=s.executeQuery("select *from user1 where userid='"+uname+"' and password='"+pwd+"' ");
	if(rs.next()) {
		out.println("success"); 
	}else {
		out.println("fail"); 
	}
	
} catch (SQLException e) {
	e.printStackTrace();
}
try {
	con.close();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>