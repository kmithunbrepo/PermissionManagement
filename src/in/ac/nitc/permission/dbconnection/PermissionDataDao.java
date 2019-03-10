package in.ac.nitc.permission.dbconnection;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

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
			String student_name=pd.getStudentName();
			String student_rollno=pd.getStudentRollno();
			String dept=pd.getDept();
			String lab=pd.getLab();
			int max_audience=pd.getMaxAudience();
			String start_datetime=pd.getStartDatetime();
			String end_datetime=pd.getEndDatetime();
			String purpose=pd.getPurpose();
			
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
			pst.setString(1,start_datetime);
			pst.setString(2,end_datetime);
			pst.setString(3,purpose);
			pst.setString(4,student_rollno);
			pst.setString(5,student_name);
			pst.setInt(6,max_audience);
			pst.setInt(7,lab_id);
			pst.setString(8,dept);

			
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
	public ArrayList<Permission> getObject(String choice)
	{

		ArrayList<Permission> list = new ArrayList<Permission>();
		DBConnection dbCon=new DBConnection();
		try{
			Connection connection = dbCon.getDBConnection();
			Statement statement = connection.createStatement();
			String query = "select * from Permission where status="+ "'" + choice + "'";
			ResultSet resultSet = statement.executeQuery(query);
			
			while(resultSet.next()){
				Permission perm=new Permission();
				perm.setEventId(resultSet.getInt(1));
				perm.setStartDatetime(resultSet.getString(2));
				perm.setEndDatetime(resultSet.getString(3));
				perm.setPurpose(resultSet.getString(4));
				perm.setStudentRollno(resultSet.getString(5));
				perm.setStudentName(resultSet.getString(6));
				perm.setRaisedDatetime(resultSet.getString(7));
				perm.setResponseDatetime(resultSet.getString(8));
				perm.setStatus(resultSet.getString(9));
				perm.setLabId(resultSet.getInt(10));
				perm.setMaxAudience(resultSet.getInt(11));
					
				list.add(perm);
			}		
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		finally {
			dbCon.closeDBConnection();
		}
			
		return list;
	}
	public void updateStatus(int id,String status)
	{
		try{
			DBConnection dbCon=new DBConnection();
			Connection connection = dbCon.getDBConnection();
			Statement statement = connection.createStatement();
			String query1 = "update Permission set status='"+status+"' where event_id="+id;
			
			int count1 = statement.executeUpdate(query1);
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			String current_datetime= dateFormat.format(cal.getTime());
			
			String query2 = "update Permission set response_datetime='"+current_datetime+"' where event_id="+id;
			
			int count2=statement.executeUpdate(query2);
			
			System.out.println(count1 +" count 1 row/s effected.....");
			System.out.println( count2 +" count2 row/s effected....."+ current_datetime );
			
			//ResultSet resultSet = statement.executeQuery(query);
			
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}