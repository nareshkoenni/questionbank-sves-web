<%@page import="com.model.DBCon"%>
<%@ page import="java.sql.* " %>
<%
String dept=request.getParameter("dept");

Connection con = DBCon.getConnection();
Statement s=con.createStatement();
ResultSet rs=s.executeQuery("select distinct subject from question where dept='"+dept+"' ");

while(rs.next()){
		 out.println(rs.getString("subject").trim()+",");
}
s.close();
rs.close();
con.close();
%>
