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
	
	<div class="row">
	<div class="col-md-11">
		<form class="form-horizontal" action="raisePermissionConfirmation.jsp" method="post">
			
			<div class="form-group">
                <label class="control-label col-md-8" >Name (Requested by)</label>
                <div class="col-md-8">
                  <input class="form-control"  type="text" name="name" value="<%=session.getAttribute("name") %>"/>
                </div>
             </div>
  
             <div class="form-group">
                <label class="control-label col-md-8" >Roll Number (Requested by)</label>
                <div class="col-md-8">
                  <input class="form-control"  type="text" name="rollNumber" value="<%=session.getAttribute("rollno") %>"/>
                </div>
             </div>
             
             <div class="form-group">
                <label class="control-label col-md-8" >Department</label>
                <div class="col-md-8">
                  <input class="form-control"  type="text" name="department" value="<%=session.getAttribute("dept") %>"/>
                </div>
             </div>
             
              <div class="form-group">
                <label class="control-label col-md-8" >Permission for Lab</label>
                <div class="radio">
                  	<label class="control-label col-md-8"><input type="radio" value="nsl" name="lab" checked/>NSL</label>
                 </div >
                 <div class="radio">
                  	<label class="control-label col-md-8"><input type="radio" value="ssl" name="lab" />SSL</label>
             	 </div>
             </div>
  			
             <div class="form-group">
                <label class="control-label col-md-8" >Maximum Number of Audience</label>
                <div class="col-md-8">
                  <input class="form-control"  type="number" name="maxAudience" required/>
                </div>
             </div>
              
             <div class="form-group">
                <label class="control-label col-md-8" >Event Start Date and Time </label>
                <div class="col-md-8">
                  <input class="form-control" id="start" type="datetime-local" name="eventStartDateTime" required />
                  <!-- <script type="text/javascript">
				    $(function () {
				        $('#start').datetimepicker('setStartDate', '2019-01-01');
				        $('#datetimepicker').datetimepicker('setEndDate', '2019-04-30');
				        $('#start').datetimepicker('hide');

				    });
				</script> -->
                </div>
             </div>
            <div class="form-group">
                <label class="control-label col-md-8" >Event End Date and Time</label>
                <div class="col-md-8">
                  <input class="form-control" id="end" type="datetime-local" name="eventEndDateTime" required/>
                </div>
             </div>
             
             <div class="form-group">
                <label class="control-label col-md-8" >Purpose in details:</label>
                <div class="control-label col-md-8">
                  <textarea class="control-label col-md-8" rows="4" name="eventPurpose" required></textarea>
                </div>
             </div>
             
			
               
            <div class="form-group">
                <label class="control-label col-md-8" ><p>
                <input type="checkbox"  value="accepted" name="undertaking" required> I agree to be in the lab during the date/time mentioned 
                	above and I will be responsible for any damage / loss happening during the slot(s)</p>
                </label>
             </div>
             
           	<div class="form-group">
                <div class="col-md-8 col-sm-offset-4">
                  <button type="submit" class="btn btn-default" name="submit">Submit</button>
                </div>
            </div>
		              	  
        </form>
    </div>
	</div>
</div>
</body>
</html>