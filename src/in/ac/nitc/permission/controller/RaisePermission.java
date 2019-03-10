package in.ac.nitc.permission.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.ac.nitc.permission.dbconnection.PermissionDataDao;
import in.ac.nitc.permission.model.Permission;

/**
 * Servlet implementation class RaisePermission
 */
@WebServlet("/raisePermission")
public class RaisePermission extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
				
		try {
			
			String studentName=(String)session.getAttribute("name");
			String studentRollNumber=(String)session.getAttribute("rollNumber");
			String department=(String)session.getAttribute("department");
			String lab=(String)session.getAttribute("lab");
			String maxAudience=(String)session.getAttribute("maxAudience");
			String eventStartDate=(String)session.getAttribute("eventStartDate");
			String eventStartTime=(String)session.getAttribute("eventStartTime");
			String eventEndDate=(String)session.getAttribute("eventEndDate");
			String eventEndTime=(String)session.getAttribute("eventEndTime");
			String eventPurpose=(String)session.getAttribute("eventPurpose");
			
			//modifying data to insert into databases
			String eventStartDateTime=eventStartDate+" "+eventStartTime+":00";
			String eventEndDateTime=eventEndDate+" "+eventEndTime+":00";	
			
			System.out.println(eventStartDateTime);
			System.out.println(eventEndDateTime);
			

			Permission pd=new Permission();

			pd.setDepartment(department);
			pd.setEventEndDateTime(eventEndDateTime);
			pd.setEventPurpose(eventPurpose);
			pd.setEventStartDateTime(eventStartDateTime);
			pd.setLab(lab);
			pd.setMaxAudience(maxAudience);
			pd.setStudentName(studentName);
			pd.setStudentRollNumber(studentRollNumber);
			
			PermissionDataDao dao=new PermissionDataDao();
			boolean result=dao.insertPermissionData(pd);
			
			if(!result){
				throw new Exception("data not inserted in Permission table");
			}
			else {
				System.out.println("data successfully inserted in Permission table");
			}
		}
		catch(Exception e){
			System.out.println(e.getMessage());
		}
		finally {
			
			session.getAttribute("name");
			session.getAttribute("rollNumber");
			session.getAttribute("department");
			session.getAttribute("lab");
			session.getAttribute("maxAudience");
			session.getAttribute("eventStartDateTime");
			session.getAttribute("eventEndDateTime");
			session.getAttribute("eventPurpose");
			
		}
	}

	

}
