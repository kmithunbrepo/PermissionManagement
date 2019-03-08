package in.ac.nitc.permission.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.ac.nitc.permission.dbconnection.DBConnection;


@WebServlet("/login")
public class Login extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		//LoginDao dao=new LoginDao();
		DBConnection dbCon=new DBConnection();
		Connection con=dbCon.getConnection();
		String query="";
		PreparedStatement st;
		ResultSet rs;
		try {
			query="select * from User where email=? and password=?";
			st=con.prepareStatement(query);
			st.setString(1, email);
			st.setString(2, pass);
			rs=st.executeQuery();
			if(rs.next()) {
				HttpSession session=request.getSession();	
				session.setAttribute("email", email);
				response.sendRedirect("studentHomeView.jsp");
			}
			else {
				PrintWriter out=response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Nitc Email Id or Password incorrect');");
				out.println("location='loginView.jsp';");
				out.println("</script>");
				//response.sendRedirect("loginView.jsp");
			}

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			dbCon.closeConnection();
		}
		
	}

	

}
