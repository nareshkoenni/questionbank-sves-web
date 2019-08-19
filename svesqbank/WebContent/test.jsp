<%@page import="java.util.Collections"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.Connection"%>
<%@include file="header.jsp"%>
<%@ page import="com.model.DBCon" %>
<%  
	String dept=request.getParameter("dept");
	String subject=request.getParameter("subject");
	String level=request.getParameter("level");
	String unit=request.getParameter("unit");
	
	ArrayList qlist=new ArrayList();
	ArrayList finalQlist=new ArrayList();
	
	Connection con=DBCon.getConnection();
	
	Statement s1=con.createStatement();
/*	ResultSet rs1=s1.executeQuery("select sno from question where dept='"+dept+"' and subject='"+subject+"' and level='"+level+"' ");
	rs1.last();
	int bound = rs1.getRow(); 
	System.out.println("bound is"+bound);
	rs1.close();
	s1.close();
	*/
	if(unit.equals("All")){
		ResultSet rs1=s1.executeQuery("select sno from question where dept='"+dept+"' and subject='"+subject+"' and level='"+level+"' ");
		while(rs1.next()){
			qlist.add(rs1.getString("sno"));
		}
		Collections.shuffle(qlist);
		//Collections.sort(qlist);
		//Random r=new Random();
		//Statement s=con.createStatement();
		rs1.close();
		s1.close();
	}else if(unit.equals("1")){
		ResultSet rs1=s1.executeQuery("select sno from question where dept='"+dept+"' and subject='"+subject+"' and level='"+level+"' and unit=1 ");
		while(rs1.next()){
			qlist.add(rs1.getString("sno"));
		}
		Collections.shuffle(qlist);
		//Collections.sort(qlist);
		//Random r=new Random();
		//Statement s=con.createStatement();
		rs1.close();
		s1.close();
	}else if(unit.equals("2")){
		ResultSet rs1=s1.executeQuery("select sno from question where dept='"+dept+"' and subject='"+subject+"' and level='"+level+"' and unit=2 ");
		while(rs1.next()){
			qlist.add(rs1.getString("sno"));
		}
		Collections.shuffle(qlist);
		//Collections.sort(qlist);
		//Random r=new Random();
		//Statement s=con.createStatement();
		rs1.close();
		s1.close();
	}else if(unit.equals("3")){
		ResultSet rs1=s1.executeQuery("select sno from question where dept='"+dept+"' and subject='"+subject+"' and level='"+level+"' and unit=3 ");
		while(rs1.next()){
			qlist.add(rs1.getString("sno"));
		}
		Collections.shuffle(qlist);
		//Collections.sort(qlist);
		//Random r=new Random();
		//Statement s=con.createStatement();
		rs1.close();
		s1.close();
	}else if(unit.equals("4")){
		ResultSet rs1=s1.executeQuery("select sno from question where dept='"+dept+"' and subject='"+subject+"' and level='"+level+"' and unit=4 ");
		while(rs1.next()){
			qlist.add(rs1.getString("sno"));
		}
		Collections.shuffle(qlist);
		//Collections.sort(qlist);
		//Random r=new Random();
		//Statement s=con.createStatement();
		rs1.close();
		s1.close();
	}else{
		ResultSet rs1=s1.executeQuery("select sno from question where dept='"+dept+"' and subject='"+subject+"' and level='"+level+"' and unit=5 ");
		while(rs1.next()){
			qlist.add(rs1.getString("sno"));
		}
		Collections.shuffle(qlist);
		//Collections.sort(qlist);
		//Random r=new Random();
		//Statement s=con.createStatement();
		rs1.close();
		s1.close();
	}
%>
<div class="col-xs-12 col-lg-12" align="right"><a href="home.jsp">Home</a></div>
   <div class="col-xs-12"><br></div>
  <form action="rcs" method="post" class="alignqns">
<%	
  	PreparedStatement ps=null;
	ps=con.prepareStatement("select question,option1,option2,option3,option4 from question where sno=? ");
	ResultSet rs=null; 
	int count=0;
    for (int i = 0; i < 10; i++) {
     count++;   
     ps.setString(1,(String)qlist.get(i));
     rs=ps.executeQuery();
  //  System.out.println("count"+i+"rand"+qlist.get(i));
	
	if(rs.next()){  
			
%>
	<div class="col-lg-10 col-md-12 col-xs-12 qnstyle"><p><b><%=count%>.<%=rs.getString("question") %></b></p></div><br>
	<div class="container">
	
		<div class="col-lg-6 col-md-6 col-xs-12">
  			<input type="radio" name="<%=qlist.get(i)%>" value="1" required="required" id="op1" >
  			<label class="optionstyle" for="op1"><%=rs.getString("option1") %></label>
		</div>
		<div class="col-lg-6 col-md-6 col-xs-12">
  			<input type="radio" name="<%=qlist.get(i)%>" value="2" required="required" id="op2" >
  			<label class="optionstyle" for="op2"><%=rs.getString("option2") %></label>
		</div>
		<div class="col-lg-6 col-md-6 col-xs-12">
  			<input type="radio" name="<%=qlist.get(i)%>" value="3" required="required" id="op3" >
  			<label class="optionstyle" for="op3"><%=rs.getString("option3") %></label>
		</div>
		<div class="col-lg-6 col-md-6 col-xs-12">
  			<input type="radio" name="<%=qlist.get(i)%>" value="4" required="required" id="op4" >
  			<label class="optionstyle" for="op4"><%=rs.getString("option4") %></label>
		</div>
	</div>
<br>
<%	

 }
	finalQlist.add(qlist.get(i));
  					 
  }
    System.out.println("qlist"+qlist);
    System.out.println("finalQlist"+finalQlist);
  				  					
  					
	session.setAttribute("qlist", finalQlist);
  	session.setAttribute("subject", subject);
  	
	ps.close();
    rs.close();
  	con.close();
	 			
%>
		<div align="center" class="custom-control  col-lg-12 col-md-12 col-xs-12">
  			<input type="submit" value="Submit" class="form-control" />
		</div>
</form>
<br>