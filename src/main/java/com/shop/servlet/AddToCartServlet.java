package com.shop.servlet;

import com.shop.dao.ProductDOAO;
import com.shop.model.CartItem;
import com.shop.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));
        ProductDOAO dao = new ProductDOAO();
        Product product = dao.getProductBYId(productId);
        
        
        if (product == null) {
            // Handle invalid product ID
            response.sendRedirect("user-products?error=ProductNotFound");
            return;
        }
        
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        boolean itemExists = false;
        for (CartItem item : cart) {
            if (item.getProduct().getId() == productId) {
                item.setQuantity(item.getQuantity() + 1);
                itemExists = true;
                break;
            }
        }

        if (!itemExists) {
            cart.add(new CartItem(product, 1));
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("user-products");
    }
}
