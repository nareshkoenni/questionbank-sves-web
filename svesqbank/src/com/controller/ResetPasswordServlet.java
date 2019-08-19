package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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

public class ResetPasswordServlet extends HttpServlet {
	 protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String mail=request.getParameter("uname");
		System.out.println("test1"+mail);
			
	if(mail !="") {	
		System.out.println("test2");
		Connection con=DBCon.getConnection();
		HttpSession session=request.getSession();
		try {
			PreparedStatement ps=con.prepareStatement("update user1 set password=123456 where userid=?");
			ps.setString(1, mail);
			System.out.println("test3"+mail);
			int noru=ps.executeUpdate();
			if(noru==1) {
				ps.close();
				con.close();
				session.setAttribute("resetpwd", 0);
				out.println("<script>window.location = 'index.jsp'</script>"); 
			}else {
				session.setAttribute("resetpwd", 1);
				out.println("<script>window.location = 'index.jsp'</script>"); 
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("not able to get register");
			e.printStackTrace();
		}
	}else {
		out.println("<script>alert('Your email is not valid');window.location = 'index.jsp'</script>"); 
	}
		
	}

}
