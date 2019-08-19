<%@ page import="java.sql.*, com.model.DBCon"%>
<%
	String name=request.getParameter("name");
	String rollnumber=request.getParameter("rollnumber");
	String college=request.getParameter("college");
	String role=request.getParameter("role");
	String mail=request.getParameter("mail");
	String mobile_number=request.getParameter("mobile_number");
	String uname=request.getParameter("uname");
	String password=request.getParameter("password");
	String dept=request.getParameter("dept");
	if(dept== null) {
		dept="";
	}
	String section=request.getParameter("section");
	if(section == null) {
		section ="";
	}
	System.out.println(rollnumber +"\t"+ mobile_number +"\t"+ uname ); 
	System.out.println("test1");
		
	if(uname !="" || mobile_number!="" || rollnumber!="") {	
		System.out.println("test2");
		Connection con=DBCon.getConnection();
		Statement s=con.createStatement();
		ResultSet rs=s.executeQuery("select userid from user1 where userid='"+uname+"' ");
		if(rs.next()) {
			System.out.println("Mail ID already exists");
			out.println("exists");
		}else{
			try {
				PreparedStatement ps=con.prepareStatement("insert into user1(fullname,rollnumber,college,userid,password,"
						+ "role,mailId,mobilenumber,dept,section) values(?,?,?,?,?,?,?,?,?,?) ");
				ps.setString(1, name);
				ps.setString(2, rollnumber);
				ps.setString(3, college);
				ps.setString(4, uname);
				ps.setString(5, password);
				ps.setString(6, role);
				ps.setString(7, mail);
				ps.setString(8, mobile_number);
				ps.setString(9, dept);
				ps.setString(10, section);
				System.out.println("test3");
				int noru=ps.executeUpdate();
				if(noru==1) {
					ps.close();
					
					out.println("success"); 
				}else {
					out.println("fail"); 
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("not able to get register");
				e.printStackTrace();
			}
		}
		con.close();
		
	}else {
		out.println("fail"); 
	}
	
%>