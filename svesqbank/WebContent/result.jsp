<%@include file="header.jsp"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.Connection"%>
<%@ page import="com.model.DBCon" %>
<%  
	Connection con=DBCon.getConnection();
	Statement s=con.createStatement();
//	String dept=request.getParameter("dept");
//	String subject=request.getParameter("subject");
//	String level=request.getParameter("level");
	ArrayList qlist=(ArrayList)session.getAttribute("qlist");
	String cans[]=(String[])session.getAttribute("cans");

	int count=0;
	ResultSet rs=null;
%>	
	<div class="col-xs-12 col-lg-12" align="right"><a href="home.jsp">Home</a></div>
 	<div align="center" class="col-lg-10 col-md-12 col-xs-12"><label class="qnstyle">Test Score is:<%=session.getAttribute("score")%></label></div><br>
<% 	
	for(int i=0;i<qlist.size();i++){
		count++;
		rs=s.executeQuery("select sno,question,option1,option2,option3,option4,correct_answer,explanation,resource from question where sno='"+qlist.get(i)+"' ");
		rs.next();
%>

	<div class="col-lg-10 col-md-12 col-xs-12 qnstyle"><p><b><%=count%>.<%=rs.getString("question") %></b></p></div><br>
	<div class="container">
	
		<div class="col-lg-6 col-md-6 col-xs-12">
  				<input type="radio" name="<%=rs.getInt("sno")%>" value="1" required="required" class="custom-control-input" id="op1" >
  			<label class="optionstyle" for="op1"><%=rs.getString("option1") %></label>
		</div>
		<div class="col-lg-6 col-md-6 col-xs-12">
  			<input type="radio" name="<%=rs.getInt("sno")%>" value="2" class="custom-control-input" id="op2" >
  			<label class="optionstyle" for="op2"><%=rs.getString("option2") %></label>
		</div>
		<div class="col-lg-6 col-md-6 col-xs-12">
  			<input type="radio" name="<%=rs.getInt("sno")%>" value="3" class="custom-control-input" id="op3">
  			<label class="optionstyle" for="op3"><%=rs.getString("option3") %></label>
		</div>
		<div class="col-lg-6 col-md-6 col-xs-12">
  			<input type="radio" name="<%=rs.getInt("sno")%>" value="4" class="custom-control-input" id="op4">
  			<label class="optionstyle" for="op4"><%=rs.getString("option4") %></label>
		</div>
		<div class="col-lg-10 col-md-12 col-xs-12" >
  			<label class="optionstyle" ><b style="color: green;">Correct Option:</b></label><%=rs.getString("correct_answer") %>
		</div>
		<div class="col-lg-10 col-md-12 col-xs-12" >
  			<label class="optionstyle" ><b>Your Option:</b></label><%=cans[i] %>
		</div>
		<div class="col-lg-10 col-md-12 col-xs-12" >
  			<label class="optionstyle" ><b style="color: green;">Explanation:</b></label><%=rs.getString("explanation") %>
		</div>
		<div class="col-lg-10 col-md-12 col-xs-12" >
  			<label class="optionstyle"><b>Resource:</b></label><%=rs.getString("resource") %>
		</div>
	</div>
<br>
<%	
	}
  	session.removeAttribute("qlist");
  	session.removeAttribute("cans");
  	session.removeAttribute("score");
  	session.removeAttribute("subject");
  	
  	
	rs.close();
  	s.close();
  	con.close();
  					
%>
		

<br>