
<%@page import="com.model.DBCon"%>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="intranetcss/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="intranetcss/style.css" rel="stylesheet" type="text/css" media="all" />
  <style type="text/css">

.serviceBox1{
    float:left;
    width:50%;
    } 
.serviceBox2{
    float:right;
    width:50%;
}
</style>
  <script>
  $(document).ready(function() {
    $("#datepicker").datepicker().datepicker("setDate", new Date());
  });
  </script>
  <script type="text/javascript">
  	function courseValid(){
  		var course=index-reg.dept.value;
  		if(course=="choose"){
  			alert("Please Choose dept");
  			//postattendance.course.focus();
  			//return true;  
  		}
  		
  	}
  </script>
 <script type="text/javascript">
 
 function showCustomer() {
	   //alert("Hi");
	  var xhttp; 
	  var branch=postattendance.branch.value;
	  var sem=postattendance.sem.value;
	  var section=postattendance.section.value;
	  var uid=postattendance.uid.value;
	 // alert(branch);
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
		  
	    if (this.readyState == 4 && this.status == 200) {
	    var x=document.getElementById("txtHint");
	  //  var option=document.createElement("option");
	    var te=this.responseText;
	    var a=te.split(",");
	    for(var i=0;i<a.length-1;i++){
	  //  alert(a);
	    var option=document.createElement("option");
		option.text=a[i].toString();
	    x.add(option);
	    }
	    }
	  };
	  xhttp.open("GET", "getcustomer.jsp?branch="+branch+"&sem="+sem+"&section="+section+"&uid="+uid, true);
	  xhttp.send();
	}
 
 $(document).ready(function() { 
	 
	 var loginchk=<%=session.getAttribute("login")%>
	 var regchk=<%=session.getAttribute("register")%>
	 var resetchk=<%=session.getAttribute("resetpwd")%>
	 var pwdsuccesschk=<%=session.getAttribute("passwordChangeSuccess")%>
	 var accountExistCheck=<%=session.getAttribute("registerAcctCheck")%>
	 
	 if(loginchk==0){
		 $('#myModal').modal('show');
	 }
	 if(regchk==0){
		 $('#myModal1').modal('show');
	 }
	 if(resetchk==0){
		 $('#myModalResetSuccess').modal('show');
	 }
	 if(resetchk==1){
		 $('#myModalResetFail').modal('show');
	 }
	 if(pwdsuccesschk==0){
		 $('#myModalpwdSuccess').modal('show');
	 }
	 if(accountExistCheck==3){
		 $('#myModalaccountExistCheck').modal('show');
	 }
	 
 });
  $(document).ready(function(){
	    $("#roleselect").change(function(){
	        var selectedRole = $(this).children("option:selected").val();
	        if(selectedRole=="Faculty" || selectedRole=="Principal")
	        document.getElementById("section").style.visibility = "hidden";
	        else
	        	document.getElementById("section").style.visibility = "visible";
	        if(selectedRole=="Principal"){
		        document.getElementById("dept").style.visibility = "collapse";
	            document.getElementById("dept1").style.visibility = "collapse";
	        }
		    else{
		       document.getElementById("dept").style.visibility = "visible";
		       document.getElementById("dept1").style.visibility = "visible";
		    }
	    });
	});
  
 </script>
 <title>SVES QBank</title>
</head>
<body>
	<div  class="col-lg-7 col-md-12 col-sm-12 col-xs-12">
		<img src='images/logo.jpg' align="left" height="100" width="100"><br><br><h3 align="left" style="font-weight: bold;">SVES Question Bank</h3></img>  
	</div>
	<div class="col-lg-5 col-md-12 col-sm-12 col-xs-12">
		<br>
		<form action="ls" name="index-login" method="post" style="align-self: flex-end; align-self: flex-end;">
		<table>
		<tr>
			<td><input type="email"  name="uname" placeholder="Login Mail ID" class="form-control" required="required"/>	</td>	
			<td>&nbsp;</td>
			<td><input type="password"  name="pwd" placeholder="Password" class="form-control" required="required"/></td>
			<td>&nbsp;</td>
			<td><input type="submit" value="Login" class="form-control"></td>	<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="5">&nbsp;&nbsp;&nbsp;</td>		
		</tr>	
		<tr>
			<td colspan="1" align="center"><a href="resetPassword.jsp"> Reset Password?</a></td>
			<td colspan="4" align="center"><a href="changePassword.jsp">Forgot Password?</a></td>
		</tr>
		</table>
	</form>
	</div>

<br><br>
	<br><br><br>
	<br>
<div align="center" class="col-lg-12 col-md-12 col-xs-12">
<br><br>
<h3 align="center" class="bars"><b>Create Account</b></h3>
	
<form action="rs" name="index-reg" method="post">
	
	<table align="center">	
		
		<tr>
			<td><input type="text"  name="name" placeholder="Full Name" class="form-control" required="required"/></td>		
			<td>&nbsp;&nbsp;&nbsp;</td>		
			<td><input type="text"  name="rollnumber" placeholder="Roll Number/Faculty ID" class="form-control" required="required"/></td>		
		
			
		</tr>
		
		<tr>
			<td colspan="3">&nbsp;&nbsp;&nbsp;</td>		
		
		</tr>
		<tr>
			<td><select name="college" class="btn btn-default dropdown-toggle" required="required">
				<option value="">Choose College</option>
				<option value="BVRITH">BVRITH</option>
				<option value="SVECW">SVECW</option>
				<option value="VIT">VIT</option>
				<option value="BVRITN">BVRITN</option>
				<option value="SBSP">SBSP</option>
				
			</select></td>
			<td>&nbsp;&nbsp;&nbsp;</td>		
			<td><select id="roleselect" name="role" class="btn btn-default dropdown-toggle" required="required">
				<option value="">Choose Role</option>
				<option value="Student">Student</option>
				<option value="Faculty">Faculty</option>
				<option value="Principal">Principal/Director</option>
			</select></td>
		</tr>
		<tr>
			<td colspan="3">&nbsp;&nbsp;&nbsp;</td>		
		
		</tr>
		<tr>
			<td><!-- <input type="email"  name="mail" placeholder="Mail ID" class="form-control" required="required"/> --></td>		
			<td>&nbsp;&nbsp;&nbsp;</td>		
			<td><input type="tel"  name="mobile_number" pattern="[6789][0-9]{9}" placeholder="Mobile Number" class="form-control" required="required"/></td>		
		</tr>
		<tr>
			<td colspan="3">&nbsp;&nbsp;&nbsp;</td>		
		</tr>
		<tr id="dept" >
			<td><select name="dept"  class="btn btn-default dropdown-toggle">
				<option value="">Choose Dept</option>
				<option value="CSE/IT">CSE/IT</option>
				<option value="ECE">ECE</option>
				<option value="EEE">EEE</option>
				<option value="MECH">MECH</option>
				<option value="CIVIL">CIVIL</option>
				<option value="MCA">MCA</option>
				
				
			</select></td><td>&nbsp;&nbsp;&nbsp;</td>		
			<td><select id="section" name="section" class="btn btn-default dropdown-toggle">
				<option value="">Choose Section</option>
				<option value="A">A</option>
				<option value="B">B</option>
				<option value="C">C</option>
				<option value="D">D</option>
				<option value="E">E</option>
			</select></td>
		</tr>
		<tr id="dept1">
			<td colspan="3">&nbsp;&nbsp;&nbsp;</td>		
		</tr>
		<tr>
			<td><input type="email"  name="uname" placeholder="Login Mail ID" class="form-control" required="required" onclick="courseValid()"/></td>		
			<td>&nbsp;&nbsp;&nbsp;</td>		
			<td><input type="text"  name="password" placeholder="Password" class="form-control" required="required"/></td>		
		</tr>
	
		<tr>
			<td colspan="3">&nbsp;&nbsp;&nbsp;</td>		
		</tr>
	
		<tr>
    		<td><input type="reset" value="Clear" class="form-control"> </td>
				<td>&nbsp;&nbsp;</td>		
			<td><input type="submit" value="Create" class="form-control" /></td>
		</tr>
	</table>
</form>	
</div>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br>

<div align="center" class="col-lg-12 col-md-12 col-xs-12">BVRITH &copy; 2019</div>
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content" align="center">
      <div class="modal-header">
        <!--  <button type="button" class="close" data-dismiss="modal">&times;</button>-->
      </div>
      <div class="modal-body">
        <p>Please check your credentials.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
  </div>
  
  <div id="myModal1" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content" align="center">
      <div class="modal-header">
        <!--  <button type="button" class="close" data-dismiss="modal">&times;</button>-->
      </div>
      <div class="modal-body">
        <p>Please fill valid data</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
	
  </div>
  </div>
  
  <div id="myModalResetSuccess" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content" align="center">
      <div class="modal-header">
        <!--  <button type="button" class="close" data-dismiss="modal">&times;</button>-->
      </div>
      <div class="modal-body">
        <p>Your Password is reset to 123456</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
	
  </div>
  </div>
  
  
  <div id="myModalResetFail" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content" align="center">
      <div class="modal-header">
        <!--  <button type="button" class="close" data-dismiss="modal">&times;</button>-->
      </div>
      <div class="modal-body">
        <p>Your email is not valid</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
	
  </div>
  </div>
  
  <div id="myModalpwdSuccess" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content" align="center">
      <div class="modal-header">
        <!--  <button type="button" class="close" data-dismiss="modal">&times;</button>-->
      </div>
      <div class="modal-body">
        <p>Your Password has been changed to <%=session.getAttribute("newpwd")%></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
	
  </div>
  </div>
  
  <div id="myModalaccountExistCheck" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content" align="center">
      <div class="modal-header">
        <!--  <button type="button" class="close" data-dismiss="modal">&times;</button>-->
      </div>
      <div class="modal-body">
        <p>e-Mail Id already Exists. Pls use forgot/reset Password </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
	
  </div>
  </div>
  
  
  <%session.invalidate();  %>
	 
</body>
