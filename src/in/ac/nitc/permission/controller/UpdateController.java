package in.ac.nitc.permission.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import in.ac.nitc.permission.model.Permission;

/**
 * Servlet implementation class UpdateController
 */
@WebServlet("/updateStatus")
public class UpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int id= Integer.parseInt(request.getParameter("submit_id"));
		String status = request.getParameter("change_status");
		System.out.println("Hi new one");
		System.out.println("Event id=="+id);
		
		PermissionDaoR permissionDao = new PermissionDaoR();
		permissionDao.updateStatus(id, status);
		if(status.equals("faculty_incharge"))
		{
			RequestDispatcher rDispatcher = request.getRequestDispatcher("index.jsp");
			rDispatcher.forward(request, response);
		}else{
			RequestDispatcher rDispatcher = request.getRequestDispatcher("faculty_index.jsp");
			rDispatcher.forward(request, response);
		}

		
	}

	

}
