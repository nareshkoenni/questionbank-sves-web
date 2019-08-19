<%@page import="java.util.ResourceBundle"%>
<link href="intranetcss/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="intranetcss/style.css" rel="stylesheet" type="text/css" media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
   
 $(document).ready(function()
 	{$( '.dropdown' ).hover(
function()
		{$(this).children('.sub-menu').slideDown(200);},


  function()
   {
$(this).children('.sub-menu').slideUp(200);});}); // end ready

</script>
<%
		response.setHeader("Pragma", "no-cache");
		response.setHeader( "Cache-Control", "no-cache" );
		response.setHeader( "Cache-Control", "no-store" );
		response.setDateHeader( "Expires", 0 );
	//	ResourceBundle rb = ResourceBundle.getBundle("s.acyear");
//		String uid=null;
 		if(session.getAttribute("uname")== null){
 			response.sendRedirect("index.jsp");
		}else{
	%>
		<div align="left"  class="col-lg-8 col-md-8 col-sm-8 col-xs-9">
			<img src='images/logo.jpg' align="left" height="105" width="100"><br><h3 align="left" style="font-weight: bold;">SVES Question Bank</h3></img>  
		</div>
		<br>
		<div align="right"  class="col-lg-4 col-md-4 col-sm-4 col-xs-3">
			Hello, <%=session.getAttribute("uname")%>
			[<a  href="logout.jsp">Logout</a>]
        </div>
    
   
	

	<% }
			
	%>


</html>