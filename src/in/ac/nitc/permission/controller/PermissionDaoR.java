package in.ac.nitc.permission.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.sql.*;
import java.text.*;

import com.sun.crypto.provider.RSACipher;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

import in.ac.nitc.permission.dbconnection.DBConnection;
import in.ac.nitc.permission.model.Permission;

public class PermissionDaoR {

	public ArrayList<PermissionR> getObject(String choice)
	{

		ArrayList<PermissionR> list = new ArrayList<PermissionR>();	
			try{
				DBConnection dbCon=new DBConnection();
				Connection connection = dbCon.getDBConnection();
				Statement statement = connection.createStatement();
				String query = "select * from Permission where status="+ "'" + choice + "'";
				ResultSet resultSet = statement.executeQuery(query);
				
				while(resultSet.next()){
					PermissionR obj=new PermissionR();
					
					obj.setEvent_id(resultSet.getInt(1));
					obj.setStart_datetime(resultSet.getString(2));
					obj.setEnd_datetime(resultSet.getString(3));
					obj.setPurpose(resultSet.getString(4));
					obj.setStudent_rollno(resultSet.getString(5));
					obj.setStudent_name(resultSet.getString(6));
					obj.setRaised_datetime(resultSet.getString(7));
					obj.setResponse_datetime(resultSet.getString(8));
					obj.setStatus(resultSet.getString(9));
					obj.setLab_id(resultSet.getInt(10));
					obj.setMax_audiance(resultSet.getInt(11));
					
					list.add(obj);
					dbCon.closeDBConnection();
				}
				//statement.close();
				//connection.close();
				
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
			
			/*
			 * obj.setEvent_id(x);
			obj.setStart_datetime("start datetime");
			obj.setEnd_datetime("end datetime");
			obj.setPurpose("Purpose");
			obj.setStudent_rollno("m170345ca");
			obj.setStudent_name("Rupesh ");
			obj.setRaised_datetime("raised date time");
			obj.setResponse_datetime("response date time");
			obj.setStatus(choice);
			obj.setLab_id(3-x);
			obj.setMax_audiance(40);
			 */
			
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
