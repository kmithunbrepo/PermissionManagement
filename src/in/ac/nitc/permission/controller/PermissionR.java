package in.ac.nitc.permission.controller;

public class PermissionR {
	private int event_id;
	private String start_datetime;
	private String end_datetime;
	private String purpose;
	private String student_rollno;
	private String student_name;
	private String raised_datetime;
	private String response_datetime;
	private String status;
	private int lab_id;
	private int max_audiance;
	public int getEvent_id() {
		return event_id;
	}
	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}
	public String getStart_datetime() {
		return start_datetime;
	}
	public void setStart_datetime(String start_datetime) {
		this.start_datetime = start_datetime;
	}
	public String getEnd_datetime() {
		return end_datetime;
	}
	public void setEnd_datetime(String end_datetime) {
		this.end_datetime = end_datetime;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getStudent_rollno() {
		return student_rollno;
	}
	public void setStudent_rollno(String student_rollno) {
		this.student_rollno = student_rollno;
	}
	public String getStudent_name() {
		return student_name;
	}
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
	public String getRaised_datetime() {
		return raised_datetime;
	}
	public void setRaised_datetime(String raised_datetime) {
		this.raised_datetime = raised_datetime;
	}
	public String getResponse_datetime() {
		return response_datetime;
	}
	public void setResponse_datetime(String response_datetime) {
		this.response_datetime = response_datetime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getLab_id() {
		return lab_id;
	}
	public void setLab_id(int lab_id) {
		this.lab_id = lab_id;
	}
	public int getMax_audiance() {
		return max_audiance;
	}
	public void setMax_audiance(int max_audiance) {
		this.max_audiance = max_audiance;
	}
	@Override
	public String toString() {
		return "Permission [event_id=" + event_id + ", start_datetime=" + start_datetime + ", end_datetime="
				+ end_datetime + ", purpose=" + purpose + ", student_rollno=" + student_rollno + ", student_name="
				+ student_name + ", raised_datetime=" + raised_datetime + ", response_datetime=" + response_datetime
				+ ", status=" + status + ", lab_id=" + lab_id + ", max_audiance=" + max_audiance + "]";
	}
	
	

}
