package com.shop.servlet;

import com.shop.dao.ProductDOAO;
import com.shop.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet("/editProduct")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 15
)
public class EditProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        ProductDOAO dao = new ProductDOAO();
        Product product = dao.getProductBYId(id);

        request.setAttribute("product", product);
        request.getRequestDispatcher("EditProduct.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String desc = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String imageUrl = request.getParameter("existingImage");

        // Handle image upload
        Part imagePart = request.getPart("image");
        String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();

        if (fileName != null && !fileName.isEmpty()) {
            String uploadDir = getServletContext().getRealPath("/images");
            File uploadFolder = new File(uploadDir);
            if (!uploadFolder.exists()) uploadFolder.mkdir();

            imagePart.write(uploadDir + File.separator + fileName);
            imageUrl = "images/" + fileName;
        }

        Product product = new Product();
        product.setId(id);
        product.setProduct_name(name);
        product.setProduct_desc(desc);
        product.setPrice(price);
        product.setImageUrl(imageUrl);

        ProductDOAO dao = new ProductDOAO();
        dao.updateProduct(product);

        response.sendRedirect("product-list");
    }
}
