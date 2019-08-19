<%@page import="com.model.DBCon"%>
<%@ page import="java.sql.*,java.util.Date, java.text.SimpleDateFormat " %>
<%


Connection con = DBCon.getConnection();
Statement s=con.createStatement();
Date date = new Date();  
SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
String strDate= formatter.format(date);    
int score=Integer.parseInt(request.getParameter("score"));
String subject=request.getParameter("subject");
String uname=request.getParameter("uname");

PreparedStatement ps=con.prepareStatement("insert into result(date,userid,subject,score) values(?,?,?,?)");
ps.setString(1, strDate);
ps.setString(2,uname);
ps.setString(3,subject);
ps.setInt(4, score);
int noru=ps.executeUpdate();
if(noru==1) {
	out.println("success"); 
}else {
	out.println("fail"); 
}
ps.close();
//RequestDispatcher rd=req.getRequestDispatcher("result.jsp");
//rd.include(req,resp);

con.close();
%>
