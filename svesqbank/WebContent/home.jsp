<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
 
 function subjects() {
	   //alert("Hi");
	  var xhttp; 
	  var dept=home_filter.dept.value;
	  // alert(branch);
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
		  
	    if (this.readyState == 4 && this.status == 200) {
	    var x=document.getElementById("sel_dept");
	    for(var i=0;i<x.length;i++){
	    	x.remove(i);
	    }
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
	  xhttp.open("GET", "getSubjects.jsp?dept="+dept, true);
	  xhttp.send();
 }
 
 $(document).ready(function() { 
	 var loginchk=<%=session.getAttribute("login")%>
	 var regchk=<%=session.getAttribute("register")%>
	 console.log(loginchk);
	 if(loginchk==1){
		 $('#myModal').modal('show');
		 <%session.setAttribute("login",2);%>
	 }
	 if(regchk==1){
		 $('#myModal1').modal('show');
		 <%session.setAttribute("register",2);%>
	 }
	 
 });
 </script>
<%@include file="header.jsp"%>
<div align="" class="col-lg-12 col-md-12 col-xs-12 selectionstyle">

<form action="test.jsp" name="home_filter" method="post">
	
	<table align="center">	
		
		<tr>
			<td><select name="dept" class="btn btn-default dropdown-toggle" required="required" onchange="subjects()">
				<option value="">Choose Dept</option>
				<option value="CSE/IT">CSE/IT</option>
				<option value="ECE">ECE</option>
				<option value="EEE">EEE</option>
				<option value="MECH">MECH</option>
				<option value="CIVIL">CIVIL</option>
				<option value="MCA">MCA</option>
				
				
			</select></td>
		</tr>
		<tr>
			<td colspan="">&nbsp;&nbsp;&nbsp;</td>		
		</tr>
		<tr>
			<td><select id="sel_dept" name="subject" class="btn btn-default dropdown-toggle" required="required">
				<option value="">Choose Subject</option> 
			</select></td>
			
		</tr>
		<tr>
			<td colspan="">&nbsp;&nbsp;&nbsp;</td>		
		
		</tr>
		
		<tr>
			<td><select name="unit" class="btn btn-default dropdown-toggle" required="required">
				<option value="">Choose Unit</option>
				<option value="All">All</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				
			</select></td>
		</tr>
		<tr>
			<td colspan="">&nbsp;&nbsp;&nbsp;</td>		
		
		</tr>
		
		<tr>
			<td><select name="level" class="btn btn-default dropdown-toggle" required="required">
				<option value="">Choose Level</option>
				<option value="1">Easy</option>
				<option value="2">Medium</option>
				<option value="3">Difficult</option>
			</select></td>
		</tr>
		<tr>
			<td colspan="">&nbsp;&nbsp;&nbsp;</td>		
		</tr>
		
	
		<tr>
    		<td><input type="submit" value="Go" class="form-control" /></td>
		</tr>
	</table>

</form>	
<!--   login success Modal -->
</div>
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

   
    <div class="modal-content">
      <div class="modal-header">
        <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
        <h4 class="modal-title">Welcome</h4>
      </div>
      <div class="modal-body">
        <p>Login Successful!!</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
      </div>
    </div>

  </div>
</div>
<div id="myModal1" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
        <h4 class="modal-title">Welcome</h4>
      </div>
      <div class="modal-body">
        <p>Registration Successful!!</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
      </div>
    </div>

  </div>
</div>