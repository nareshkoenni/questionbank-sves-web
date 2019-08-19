package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.DBCon;

public class RegisterServlet extends HttpServlet {
	 protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
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
		if(mail==null) {
			mail="";
		}
		String section=request.getParameter("section");
		if(section == null) {
			section ="";
		}
		System.out.println(rollnumber +"\t"+ mobile_number +"\t"+ uname ); 
		System.out.println("test1");
		Connection con=DBCon.getConnection();
		HttpSession session=request.getSession();
		
		try {
			Statement s=con.createStatement();
			ResultSet rs=s.executeQuery("select userid from user1 where userid='"+uname+"' ");
			if(rs.next()) {
				session.setAttribute("registerAcctCheck", 3);
				out.println("<script>window.location = 'index.jsp'</script>");
			}else {
				if(uname !="" || mobile_number!="" || rollnumber!="") {	
					System.out.println("test2");
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
							session.setAttribute("uname", uname);
							ps.close();
							con.close();
							session.setAttribute("register", 1);
							out.println("<script>window.location = 'home.jsp'</script>"); 
						}else {
							session.setAttribute("register", 0);
							out.println("<script>window.location = 'index.jsp'</script>"); 
						}
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						System.out.println("not able to get register");
						e.printStackTrace();
					}
				}else {
					out.println("<script>alert('Registration fail2');window.location = 'index.jsp'</script>"); 
				}
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		
	}

}
