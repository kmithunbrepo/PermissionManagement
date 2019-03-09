package in.ac.nitc.permission.model;

import java.sql.Date;

public class User {
	protected int userId;
	protected String name;
	private String password;
	protected String email;
	protected String mobile;
	protected String dept;
	protected int type;
	public void viewRaisedPermission() {
		
	}
}
class Student extends User{
	private String rollno;
	private int studentId;
	public boolean raisePermission() {
		return true;
	}
	@Override
	public void viewRaisedPermission() {
		
	}
	
}
class StudentLabAdmin extends Student{
	private int studentLabAdminId;
	private Date dateOfStart;
	private Date dateOfEnd;
	private String status;
	public boolean acceptForPresence() {
		return true;
	}
}
class AuthorityIncharge extends User{
	private int authorityId;
	private int authLabId;
	private Date dateOfJoin;
	private Date dateOfComplete;
	private String status;
	@Override
	public void viewRaisedPermission() {
		
	}
	public void postNotification() {
		
	}
	public void sendNotification() {
		
	}
}

