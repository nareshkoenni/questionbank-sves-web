<%@ page import="java.sql.*, com.model.DBCon"%>
<% 
	String mail=request.getParameter("uname");
	System.out.println("test1"+mail);
	if(mail !="") {	
		Connection con=DBCon.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("update user1 set password=123456 where userid=?");
			ps.setString(1, mail);
			System.out.println("test3"+mail);
			int noru=ps.executeUpdate();
			if(noru==1) {
				ps.close();
				con.close();
				out.println("success"); 
			}else {
				out.println("fail"); 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("not able to reset");
			e.printStackTrace();
		}
	}else {
		out.println("fail"); 
	}
%>