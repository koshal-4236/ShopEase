package com.shop.servlet;

import com.shop.model.CartItem;
import com.shop.model.Product;
import com.shop.dao.ProductDOAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/update-cart")
public class UpdateCartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart != null) {
            for (CartItem item : cart) {
                if (item.getProduct().getId() == productId) {
                    switch (action) {
                        case "increase":
                            item.setQuantity(item.getQuantity() + 1);
                            break;
                        case "decrease":
                            if (item.getQuantity() > 1) {
                                item.setQuantity(item.getQuantity() - 1);
                            }
                            break;
                    }
                    break;
                }
            }
            if (cart.isEmpty()) {
                session.removeAttribute("cart");
            } else {
                session.setAttribute("cart", cart);
            }
        }

        // ✅ Redirect back to cart.jsp
        response.sendRedirect("cart.jsp");
    }
}
