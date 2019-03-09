package in.ac.nitc.permission.model;

public class Permission {
	private String studentName;
	private String StudentRollNumber;
	private String department;
	private String lab;
	private String maxAudience;
	private String eventStartDateTime;
	private String eventEndDateTime;
	private String eventPurpose;
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentRollNumber() {
		return StudentRollNumber;
	}
	public void setStudentRollNumber(String studentRollNumber) {
		StudentRollNumber = studentRollNumber;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getLab() {
		return lab;
	}
	public void setLab(String lab) {
		this.lab = lab;
	}
	public String getMaxAudience() {
		return maxAudience;
	}
	public void setMaxAudience(String maxAudience) {
		this.maxAudience = maxAudience;
	}
	public String getEventStartDateTime() {
		return eventStartDateTime;
	}
	public void setEventStartDateTime(String eventStartDateTime) {
		this.eventStartDateTime = eventStartDateTime;
	}
	public String getEventEndDateTime() {
		return eventEndDateTime;
	}
	public void setEventEndDateTime(String eventEndDateTime) {
		this.eventEndDateTime = eventEndDateTime;
	}
	public String getEventPurpose() {
		return eventPurpose;
	}
	public void setEventPurpose(String eventPurpose) {
		this.eventPurpose = eventPurpose;
	}
	
	@Override
	public String toString() {
		return "PermissionData [studentName=" + studentName + ", StudentRollNumber=" + StudentRollNumber
				+ ", department=" + department + ", lab=" + lab + ", maxAudience=" + maxAudience
				+ ", eventStartDateTime=" + eventStartDateTime + ", eventEndDateTime=" + eventEndDateTime
				+ ", eventPurpose=" + eventPurpose + "]";
	}

}
