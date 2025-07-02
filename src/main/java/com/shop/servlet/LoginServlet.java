package com.shop.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.dao.UserDAO;
import com.shop.model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		UserDAO dao=new UserDAO();
		User user=dao.loginUser(email, password);
		
		if(user!=null)
		{
			HttpSession session=request.getSession();
			session.setAttribute("user", user);
			response.sendRedirect("user-products");
			
		}else {
			request.setAttribute("error", "Invalid email or password.");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
	}

}
