package in.ac.nitc.permission.dbconnection;

import java.sql.*;

import in.ac.nitc.permission.model.Permission;
public class PermissionDataDao {

	public boolean insertPermissionData(Permission pd) {
	
		try {
			DBConnection db=new DBConnection();
			Connection conn=null;
			conn=db.getDBConnection();
			
			if(conn==null) {
				throw new Exception("database connection fails");
			}else {
				System.out.println("data base connection steblished");
			}
			
			//data to insert
			String studentName=pd.getStudentName();
			String studentRollNumber=pd.getStudentRollNumber();
			String department=pd.getDepartment();
			String lab=pd.getLab();
			String maxAudience=pd.getMaxAudience();
			String eventStartDateTime=pd.getEventStartDateTime();
			String eventEndDateTime=pd.getEventEndDateTime();
			String eventPurpose=pd.getEventPurpose();
			
			//getting room_number as it is unique in Lab table 
			String labRoom="";
			if(lab.equals("nsl")){
				lab="network system laboratory";
				labRoom="itl301";
			}
			else if(lab.equals("ssl")){
				lab="software system laboratory";
				labRoom="itl302";
			}
			
			String query="";

			//Part 1
			// we have to get lab_id from Lab table as lab_id is foreign 
			//key in Permission table referencing to Lab table
			
			query="select lab_id from Lab where room_number=?";
			
			PreparedStatement pst1=conn.prepareStatement(query);
			pst1.setString(1, labRoom);
			ResultSet rs=pst1.executeQuery();
			
			rs.next();
			int lab_id=rs.getInt("lab_id");
			System.out.println(lab_id);

			//Part 2
			//now insert Permission application details into permission table 
			
			query="insert into Permission(start_datetime,end_datetime,purpose,student_rollno,student_name,"
					+ "raised_datetime,max_audience,lab_id,dept) values(?,?,?,?,?,now(),?,?,?)";
			
			PreparedStatement pst=conn.prepareStatement(query);
			pst.setString(1,eventStartDateTime);
			pst.setString(2,eventEndDateTime);
			pst.setString(3,eventPurpose);
			pst.setString(4,studentRollNumber);
			pst.setString(5,studentName);
			pst.setString(6,maxAudience);
			pst.setInt(7,lab_id);
			pst.setString(8,department);

			
			int count=pst.executeUpdate();
			if(count==0){
				throw new Exception("permisssion details not inserted into Permission table");
			}
			else {
				return true;
			}
			
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		finally {
		}
		
		return false;
	}
}