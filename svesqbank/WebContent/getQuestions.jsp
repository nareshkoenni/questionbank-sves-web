<%@page import="java.util.Collections"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.Connection"%>
<%@ page import="com.model.DBCon" %>
<%  
	String dept=request.getParameter("dept");
	String subject=request.getParameter("subject");
	String level=request.getParameter("level");
	String unit=request.getParameter("unit");
	if(unit==null){
		unit="All";
	}
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

	
	PreparedStatement ps=null;
	ps=con.prepareStatement("select sno,question,option1,option2,option3,option4,correct_answer,explanation,resource from question where sno=? ");
	ResultSet rs=null; 
	int count=0;
	out.println("{\"questions\" : [  ");
	int j=0;
    for (int i = 0; i < 10; i++) {
     count++;   
     ps.setString(1,(String)qlist.get(i));
     rs=ps.executeQuery();
  //  System.out.println("count"+i+"rand"+qlist.get(i));
	//int j=0;
	if(rs.next()){  
		if(j != 0) {
			out.println(",");	 
		 } 
		 j=1;
		 out.println(" {\"sno\" : "+'"'+rs.getString("sno")+'"'+",   \"question\" : "+'"'+rs.getString("question")+'"'+",  \"option1\" : "+'"'+rs.getString("option1")+'"'+",   \"option2\" : "+'"'+rs.getString("option2")+'"'+",    \"option3\" : "+'"'+rs.getString("option3")+'"'+",   \"option4\" : "+'"'+rs.getString("option4")+'"'+", \"correct_answer\" : "+'"'+rs.getString("correct_answer")+'"'+", \"explanation\" : "+'"'+rs.getString("explanation")+'"'+", \"resource\" : "+'"'+rs.getString("resource")+'"'+"}   ");	
	//	 out.println("{\"question\" : "+'"'+rs.getString("question")+'"'+" }");
		 

 }
	finalQlist.add(qlist.get(i));
  					 
  }
    out.println("]} ");

    System.out.println("qlist"+qlist);
    System.out.println("finalQlist"+finalQlist);
  				  					
  					
	session.setAttribute("qlist", finalQlist);
  	session.setAttribute("subject", subject);
  	
	ps.close();
    rs.close();
  	con.close();
	 			

%>
