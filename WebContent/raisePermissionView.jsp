<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application form</title>

<script src="jQuery/jquery.min.js"></script>

<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">	
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-6">
			<h2>Request for using NSL/SSL </h2>
		</div >
	</div>
</div>
<div class="container">
		<form class="form-horizontal" action="raisePermissionConfirmationView.jsp" method="post">
			
			<div class="row form-group">
                <label class="control-label col-md-8" >Name (Requested by)</label>
                <div class="col-md-8">
                  <input class="form-control"  type="text" name="name" value="<%=session.getAttribute("name") %>" readonly/>
                </div>
             </div>
  
             <div class="row form-group">
                <label class="control-label col-md-8" >Roll Number (Requested by)</label>
                <div class="col-md-8">
                  <input class="form-control"  type="text" name="rollNumber" value="<%=session.getAttribute("rollno") %>" readonly/>
                </div>
             </div>
             
             <div class="row form-group">
                <label class="control-label col-md-8" >Department</label>
                <div class="col-md-8">
                  <input class="form-control"  type="text" name="department" value="<%=session.getAttribute("dept") %>" readonly/>
                </div>
             </div>
             
              <div class="row form-group">
                <label class="control-label col-md-8" >Permission for Lab</label>
                <div class="control-label col-md-8 radio">
                  	<label class="control-label col-md-8"><input type="radio" value="nsl" name="lab" checked/>NSL</label>
                 </div >
                 <div class="control-label col-md-8 radio">
                  	<label class="control-label col-md-8"><input type="radio" value="ssl" name="lab" />SSL</label>
             	 </div>
             </div>
  			
             <div class="row form-group">
                <label class="control-label col-md-8" >Maximum Number of Audience</label>
                <div class="col-md-8">
                  <input class="form-control"  type="number" name="maxAudience" required/>
                </div>
             </div>
              
             <div class="row form-group">
	                  <label class="control-label col-md-4" >Event Start Date</label>
	                  <label class="control-label col-md-4" >Event Start Time </label>
	         </div>
	         <div class="row form-group">
	               	<div class="col-md-4">
	                  <input class="form-control"type="date" name="eventStartDate" required />
	                </div>
	                 <div class="col-md-4">
	                  <input class="form-control"type="time" name="eventStartTime" required />
	                </div>
             </div>
               
             <div class="row form-group">
	                  <label class="control-label col-md-4" >Event End Date</label>
	                  <label class="control-label col-md-4" >Event End Time </label>
	         </div>
	         <div class="row form-group">
	               	<div class="col-md-4">
	                  <input class="form-control"type="date" name="eventEndDate" required />
	                </div>
	                 <div class="col-md-4">
	                  <input class="form-control"type="time" name="eventEndTime" required />
	                </div>
             </div>
             
             <div class="row form-group">
                <label class="control-label col-md-8" >Purpose in details:</label>
                <div class="control-label col-md-8">
                  <textarea class="control-label col-md-8" rows="4" name="eventPurpose" required></textarea>
                </div>
             </div>
             
            <div class="row form-group">
                <label class="control-label col-md-8" ><p>
                <input type="checkbox"  value="accepted" name="undertaking" required> I agree to be in the lab during the date/time mentioned 
                	above and I will be responsible for any damage / loss happening during the slot(s)</p>
                </label>
             </div>
             
           	<div class="row form-group">
                <div class="col-md-8 col-sm-offset-4">
                  <button type="submit" class="btn btn-default" name="submit">Submit</button>
                </div>
            </div>
		              	  
        </form>
</div>
</body>
</html>