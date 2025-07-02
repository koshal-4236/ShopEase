package com.shop.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.UserDAO;
import com.shop.model.User;
import com.shop.util.EmailUtil;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        User user = new User(name, email, password);
        UserDAO dao = new UserDAO();

        if (dao.isEmailRegistered(email)) {
            req.setAttribute("error", "Email is already registered.");
            req.getRequestDispatcher("register.jsp").forward(req, res);  // Forward back with error
            return;
        }
        
        if (dao.registerUser(user)) {
        	
        	 String subject = "Welcome to ShopEase!";
             String message = "Hello " + name + ",\n\nThank you for registering at ShopEase.\nEnjoy your shopping!";
             EmailUtil.sendEmail(email, subject, message);
        	
            res.sendRedirect("login.jsp");
        } else {
            res.getWriter().println("Registration failed");
        }
	}

}
