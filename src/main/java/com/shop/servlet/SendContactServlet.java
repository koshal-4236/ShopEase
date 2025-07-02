package com.shop.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.util.EmailUtil;

/**
 * Servlet implementation class SendContactServlet
 */
@WebServlet("/send-contact")
public class SendContactServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String firstName=request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String message = request.getParameter("message");
        
        String subject="New Conact Form Submission form"+ firstName+" "+lastName;
        String body="Name: "+firstName+" "+lastName+"\n"
        		+"Email: "+email+"\n"
        		 + "Phone: " + phone + "\n"
                 + "Message: \n" + message;
        
        try {
            EmailUtil.sendEmail("kushwahakoshal2002@gmail.com", subject, body);
            response.sendRedirect("Contact.jsp?status=success");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Contact.jsp?status=error");
        }
	}

}
