package com.shop.servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.shop.dao.ProductDOAO;
import com.shop.model.Product;

/**
 * Servlet implementation class AddProductServlet
 */
@WebServlet("/addProduct")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10,      // 10MB
maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class AddProductServlet extends HttpServlet {
	
	private static final String Upload="images";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String appPath=request.getServletContext().getRealPath("");
		String uploadPath=appPath+File.separator+Upload;
		
//		String uploadPath = "D:/Java_Practice/shopping-ecom/src/main/webapp/images";
		
		File uploadDir=new File(uploadPath);
		
		if(!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		String name=request.getParameter("name");
		String description=request.getParameter("description");
		double price=Double.parseDouble(request.getParameter("price"));
		
		Part filepart=request.getPart("image");
		String fileName=Paths.get(filepart.getSubmittedFileName()).getFileName().toString();
		String filepath=uploadPath+ File.separator+fileName;
		
		filepart.write(filepath);
		
		System.out.println("Saving file to: " + filepath);

		
		String imageUrl=Upload+"/"+fileName;
		
		Product product = new Product();
        product.setProduct_name(name);
        product.setProduct_desc(description);
        product.setPrice(price);
        product.setImageUrl(imageUrl);
        
        new ProductDOAO().Addproduct(product);
        
        response.sendRedirect("product-list");
        
		
		
		
	}

}
