package in.ac.nitc.permission.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.If;

import com.sun.xml.internal.bind.v2.model.core.ID;
import com.sun.xml.internal.ws.api.model.wsdl.editable.EditableWSDLService;

import in.ac.nitc.permission.model.Permission;

/**
 * Servlet implementation class GetAdminController
 */
@WebServlet("/getAdmin")
public class GetAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String choice= request.getParameter("choice");
		
		PermissionDaoR permissionDao= new PermissionDaoR();
		
		ArrayList<PermissionR> list= permissionDao.getObject(choice);
		
		request.setAttribute("permission_list",list);
		if(choice.equals("lab_admin"))
		{
			RequestDispatcher rDispatcher = request.getRequestDispatcher("admin_viewraised.jsp");
			rDispatcher.forward(request, response);
		}else if(choice.equals("approved")){
			RequestDispatcher rDispatcher = request.getRequestDispatcher("admin_viewapproved.jsp");
			rDispatcher.forward(request, response);
		}else if(choice.equals("faculty_incharge")){
			RequestDispatcher rDispatcher = request.getRequestDispatcher("faculty_viewraised.jsp");
			rDispatcher.forward(request, response);
			
		}else if(choice.equals("pending")){
			RequestDispatcher rDispatcher = request.getRequestDispatcher("faculty_viewpending.jsp");
			rDispatcher.forward(request, response);
			
		}else if(choice.equals("declined")){
			RequestDispatcher rDispatcher = request.getRequestDispatcher("faculty_viewdeclined.jsp");
			rDispatcher.forward(request, response);
			
		}

	}

	

}
