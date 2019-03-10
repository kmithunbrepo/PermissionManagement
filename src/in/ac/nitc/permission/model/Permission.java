package in.ac.nitc.permission.model;

public class Permission {
	private int event_id;
	private String start_datetime;
	private String end_datetime;
	private String purpose;
	private String student_rollno;
	private String student_name;
	private String raised_datetime;
	private String response_datetime;
	private String status;
	private String lab;
	private int lab_id;
	private int max_audience;
	private String dept;
	
	
	public int getEventId() {
		return event_id;
	}
	public void setEventId(int event_id) {
		this.event_id = event_id;
	}
	
	public String getStartDatetime() {
		return start_datetime;
	}
	public void setStartDatetime(String start_datetime) {
		this.start_datetime = start_datetime;
	}
	
	public String getEndDatetime() {
		return end_datetime;
	}
	public void setEndDatetime(String end_datetime) {
		this.end_datetime = end_datetime;
	}
	
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	
	public String getStudentRollno() {
		return student_rollno;
	}
	public void setStudentRollno(String student_rollno) {
		this.student_rollno = student_rollno;
	}
	
	public String getStudentName() {
		return student_name;
	}
	public void setStudentName(String student_name) {
		this.student_name = student_name;
	}
	
	
	public String getRaisedDatetime() {
		return raised_datetime;
	}
	public void setRaisedDatetime(String raised_datetime) {
		this.raised_datetime = raised_datetime;
	}
	
	public String getResponseDatetime() {
		return response_datetime;
	}
	public void setResponseDatetime(String response_datetime) {
		this.response_datetime = response_datetime;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getLab() {
		return lab;
	}
	public void setLab(String lab) {
		this.lab = lab;
	}
	
	public int getLabId() {
		return lab_id;
	}
	public void setLabId(int lab_id) {
		this.lab_id = lab_id;
	}
	
	public int getMaxAudience() {
		return max_audience;
	}
	public void setMaxAudience(int max_audience) {
		this.max_audience = max_audience;
	}
	
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	
	@Override
	public String toString() {
		return "PermissionData [student_name=" + student_name + ", student_rollno=" + student_rollno
				+ ", dept=" + dept + ", lab_id=" + lab + ", lab_id=" + lab_id +", max_audience=" + max_audience
				+ ", start_datetime=" + start_datetime + ", end_datetime=" + end_datetime
				+ ", purpose=" + purpose + "]";
	}

}
