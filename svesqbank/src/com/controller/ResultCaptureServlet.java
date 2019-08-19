package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.model.DBCon;
 
public class ResultCaptureServlet extends HttpServlet {
     
   
    public void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html");
	    HttpSession session=req.getSession();
	    ArrayList qlist=(ArrayList)session.getAttribute("qlist");
	    Connection con=DBCon.getConnection();
  	    System.out.println("in rcs"+ qlist);
        try {   
        //	PrintWriter out=resp.getWriter();
            Statement s=con.createStatement();
    	    String cans[]=new String[qlist.size()];
            String dans[]=new String[qlist.size()];
    	    ResultSet rs1=null;
    	    PreparedStatement ps1=con.prepareStatement("select correct_answer from question where sno=?");
    	    for(int i=0;i<cans.length;i++){
    	    	cans[i]=req.getParameter((String)qlist.get(i));
    	    	//System.out.println(cans[i]);
    	     	//rs1=s.executeQuery("select correct_answer from question where sno='"+qlist.get(i)+"' ");
    	    	ps1.setString(1,(String)qlist.get(i));
    	        rs1=ps1.executeQuery();
    	    	 if(rs1.next()) {
    	    		 dans[i]=rs1.getString("correct_answer");
    	    	 }
    	    } 
    	    rs1.close();
    	    s.close();
    	    System.out.println("can length"+cans.length);
    	    System.out.println("dans length"+dans.length);
    	    int score=0;
    	    for(int i=0;i<cans.length;i++){
    	    	if(dans[i].equals(cans[i])){
    	    		System.out.println(dans[i]+"=="+cans[i]);
    	    		score++;
    	    	}
    	    }
    	 //   out.println("score"+score);
    	   // qlist.clear();
    	   // session.removeAttribute("qlist");
    	    session.setAttribute("cans", cans);
    		session.setAttribute("score", score);
    		/*	Statement s2=con.createStatement();
    		ResultSet rs2=s2.executeQuery("select rollnumber,fullname,college,dept,section from user where userid='"+session.getAttribute("uname")+"' ");
    		String rollnumber=null,college=null,dept=null,section=null,name=null;
    		if(rs2.next()) {
	    		rollnumber=rs2.getString("rollnumber");
	    		college=rs2.getString("college");
	    		dept=rs2.getString("dept");
	    		section=rs2.getString("section");
	    		name=rs2.getString("fullname");
	    	}
    	    rs2.close();
    	    s2.close(); */
    		Date date = new Date();  
    	    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
    	    String strDate= formatter.format(date);     
    		PreparedStatement ps=con.prepareStatement("insert into result(date,userid,subject,score) values(?,?,?,?)");
            ps.setString(1, strDate);
    		ps.setString(2,(String)session.getAttribute("uname"));
            ps.setString(3,(String)session.getAttribute("subject"));
            ps.setInt(4, score);
            ps.executeUpdate();
            ps.close();
            RequestDispatcher rd=req.getRequestDispatcher("result.jsp");
    		rd.include(req,resp);
    		
    	    con.close();
    	}catch (SQLException e) {
    			e.printStackTrace();
    			System.out.println("not able to get the connection RCS");
    	} 
    }
}