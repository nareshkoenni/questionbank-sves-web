package com.controller;
import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.DBCon;
public class LoginServlet extends HttpServlet {
	 protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String uname=request.getParameter("uname");
		String pwd=request.getParameter("pwd");
		Connection con=DBCon.getConnection();
		HttpSession session=request.getSession();
		try {
			Statement s=con.createStatement();
			ResultSet rs=s.executeQuery("select *from user1 where userid='"+uname+"' and password='"+pwd+"' ");
			if(rs.next()) {
				session.setAttribute("uname", uname);
				session.setAttribute("login", 1);
				out.println("<script>window.location = 'home.jsp'</script>"); 
			}else {
				session.setAttribute("login", 0);
				out.println("<script>window.location = 'index.jsp'</script>"); 
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
	
	}

}
