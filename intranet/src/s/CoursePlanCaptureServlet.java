package s;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 


import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
 
public class CoursePlanCaptureServlet extends HttpServlet {
     
    private DataSource dataSource;
    
     
    public void init() throws ServletException {
        try {
            // Get DataSource
            Context initContext  = new InitialContext();
            Context envContext  = (Context)initContext.lookup("java:/comp/env");
            dataSource = (DataSource)envContext.lookup("jdbc/mysql");
            System.out.println(dataSource);
             
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }
    int count;
    public void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html");
	    Connection connection=null;
	    HttpSession session=req.getSession();
    	 PreparedStatement ps=null;
    	 PrintWriter out=resp.getWriter();
    	 String sessionNo[]=req.getParameterValues("txtbox1[]");
         String unitNo[]=req.getParameterValues("txtbox2[]");
         String date[]=req.getParameterValues("txtbox3[]");
         String topic[]=req.getParameterValues("txtbox4[]");
         String textbook[]=req.getParameterValues("txtbox5[]");
         String chapterNo[]=req.getParameterValues("txtbox6[]");
         String webResource[]=req.getParameterValues("txtbox7[]");
         String co[]=req.getParameterValues("txtbox8[]");
     	 
         String sem=req.getParameter("sem");
     	 String branch=req.getParameter("branch");
     	 String section=req.getParameter("section");
    	 String acyear=req.getParameter("acyear");
    	 String uid=(String)session.getAttribute("uid");
    	 String instrutcor=req.getParameter("instructor");
    	 String course=req.getParameter("course");
    	 String courseCode=req.getParameter("courseCode");
         
     	try {      
			connection = dataSource.getConnection();
			Statement s=connection.createStatement();
			ResultSet rs=s.executeQuery("select coursename,instructor from courseplan where coursename='"+course+"' and instructor='"+instrutcor+"' ");
			if(rs.next()){
				//RequestDispatcher rd=req.getRequestDispatcher("<jsp:forward page='coursePlan.jsp?uid=<%=uid%>'>");
				
				//rd.include(req, resp);   
           	  
          // 	out.println("<jsp:forward page='http://intranet.bvrithyderabad.edu.in:9000/intranet/coursePlan.jsp?uid=<%=uid%>'/>");
				out.println("<script>alert('Already Posted!');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/coursePlan.jsp?uid="+uid+"'</script>"); 
				//resp.sendRedirect("http://intranet.bvrithyderabad.edu.in:9000/intranet/coursePlan.jsp?uid=<%=uid%>");
				//return;
              }else{	
			int noru=0;
			for(int i=0;i<sessionNo.length;i++){       
				
        		 ps=connection.prepareStatement("insert into courseplan(date,sem,branch,section,coursecode,coursename,instructor,unit,acyear,topic,sessionNumber,textbook,chapterno,webresource,co) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                 ps.setString(1, date[i]);
                 ps.setString(2, sem);
                 ps.setString(3, branch);
                 ps.setString(4, section);
                 ps.setString(5, courseCode);
                 ps.setString(6, course);
                 ps.setString(7, instrutcor);
                 ps.setString(8, unitNo[i]);
                 ps.setString(9, acyear);
                 ps.setString(10, topic[i]);
                 ps.setString(11, sessionNo[i]);  
                 ps.setString(12, textbook[i]);
                 ps.setString(13, chapterNo[i]);
                 ps.setString(14, webResource[i]);
                 ps.setString(15, co[i]);
			      
                 noru=ps.executeUpdate();
			}
			if(noru==1){
			//	RequestDispatcher rd=req.getRequestDispatcher("http://intranet.bvrithyderabad.edu.in:9000/intranet/coursePlan.jsp?uid=<%=uid%>");   
			//	rd.include(req, resp);
           	 out.println("<script>alert('Successfully Posted Thank You');window.location = 'http://intranet.bvrithyderabad.edu.in:9000/intranet/coursePlan.jsp?uid="+uid+"'</script>");
           	 System.out.println("Successfully Posted!");
            
			}
			
			}
			
        }catch (SQLException e) {  
   		 	e.printStackTrace();
   		 	System.out.println("not able to get the connection");
   	 	 }
       
        
        try{
   		 connection.close();
   		 System.out.println("connection closed");
   	 	}catch(Exception e){}
   	 	
        
	}
}   