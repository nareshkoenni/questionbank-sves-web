<%@ page import="java.sql.*, com.model.DBCon"%>
<% 
String mail=request.getParameter("uname");
String pwd=request.getParameter("pwd");
if(mail !="") {	
	System.out.println("test2");
	Connection con=DBCon.getConnection();
	try {
		PreparedStatement ps=con.prepareStatement("update user1 set password=? where userid=?");
		ps.setString(1, pwd);
		ps.setString(2, mail);
		System.out.println("test3"+mail);
		int noru=ps.executeUpdate();
		if(noru==1) {
			ps.close();
			con.close();
			out.println("success"); 
		}else {
			out.println("fail"); 
		}
	}catch (SQLException e) {
		System.out.println("not able to change password in mobile");
		e.printStackTrace();
	}
}else {
	out.println("fail"); 
}
%>