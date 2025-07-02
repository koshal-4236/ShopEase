package com.shop.servlet;

import com.shop.model.CartItem;
import com.shop.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

@WebServlet("/remove-from-cart")
public class RemoveFromCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	  HttpSession session = request.getSession();
          List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

          if (cart != null) {
              String productIdStr = request.getParameter("productId");

              try {
                  int productId = Integer.parseInt(productIdStr);

                  // Use iterator to safely remove item while looping
                  Iterator<CartItem> iterator = cart.iterator();
                  while (iterator.hasNext()) {
                      CartItem item = iterator.next();
                      Product product = item.getProduct();
                      if (product.getId() == productId) {
                          iterator.remove();
                          break;
                      }
                  }

                  // If cart becomes empty, remove it from session
                  if (cart.isEmpty()) {
                      session.removeAttribute("cart");
                  } else {
                      // Update the cart in session just in case
                      session.setAttribute("cart", cart);
                  }

              } catch (NumberFormatException e) {
                  e.printStackTrace(); // or log error
              }
          }


        response.sendRedirect("cart.jsp");
    }
}
