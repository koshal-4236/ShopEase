package com.shop.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.dao.AdminDAO;
import com.shop.model.Admin;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/adminlogin")
public class AdminLoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		AdminDAO dao=new AdminDAO();
		
		Admin admin=dao.loginAdmin(email,password);
		
		if(admin!=null)
		{
			HttpSession session=request.getSession();
			session.setAttribute("admin",admin);
			response.sendRedirect("admin-dashboard.jsp");
		}
		else {
			request.setAttribute("error", "Invalid mail or password");
			request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
		}
	}

}
