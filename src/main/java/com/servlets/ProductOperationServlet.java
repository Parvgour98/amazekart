package com.servlets;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.CategoryDao;
import com.dao.ProductDao;
import com.entities.Category;
import com.entities.Product;
import com.helper.FactoryProvider;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	public ProductOperationServlet() {
        super();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String operation = request.getParameter("operation");
		
		HttpSession session = request.getSession();
		if(operation.trim().equals("addCategory"))
		{
			// add category
			
			
			String catTitle = request.getParameter("catTitle");
			String catDesc  = request.getParameter("catDesc");
			
			if(catTitle.length()>200)
			{
				session.setAttribute("message","Category title is too long");
				response.sendRedirect("admin.jsp");
				return;
			}
			else if(catDesc.length()>2000)
			{
				session.setAttribute("message","Category description is too long");
				response.sendRedirect("admin.jsp");
				return;
			}
			else {
			
				Category category = new Category();
				category.setCategoryTitle(catTitle);
				category.setCategoryDescription(catDesc);
				
				// Now saving category to the database
				
				try {
					CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
					categoryDao.saveCategory(category);
					session.setAttribute("message","Category saved successfully!");
					response.sendRedirect("admin.jsp");
					return;
				}
				catch(Exception e){
					
					session.setAttribute("message","Some error occured, Please try again...");
					response.sendRedirect("admin.jsp");
					return;
				}
			}
		}
		else {
			// add product
			String pName = request.getParameter("pName");
			String pDesc = request.getParameter("pDesc");
			double pPrice = Double.parseDouble(request.getParameter("pPrice"));
			double pDiscount = Double.parseDouble(request.getParameter("pDiscount"));	
			int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
			int catId = Integer.parseInt(request.getParameter("catId"));
			
			if(pName.length()>200){
				session.setAttribute("message","Product name is too long");
				response.sendRedirect("admin.jsp");
				return;
			}
			else if(pDesc.length()>2500)
			{
				session.setAttribute("message","Product description is too long");
				response.sendRedirect("admin.jsp");
				return;
			}
			else if(pQuantity>10000000)
			{
				session.setAttribute("message","Product quantity is very large");
				response.sendRedirect("admin.jsp");
				return;
			}
			else {
							
				Part part = request.getPart("pPic");
				
				Product product = new Product();
				product.setpName(pName);
				product.setpDesc(pDesc);
				product.setpPrice(pPrice);
				product.setpDiscount(pDiscount);
				product.setpQuantity(pQuantity);
				product.setpPhoto(part.getSubmittedFileName());
				
				// get category by id
				
				try {
					CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
					Category category = categoryDao.getCategoryById(catId);
					product.setCategory(category);
					
					ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
					productDao.saveProduct(product);
					
					// Uploading product pic to the folder products
					
					String path = request.getRealPath("img") + File.separator + "products" + File.separator + part.getSubmittedFileName();
					
					// Uploading code...
					
					FileOutputStream fileOutputStream = new FileOutputStream(path);
					
					InputStream inputStream = part.getInputStream();
					
					// Reading data
					
					byte[] data = new byte[inputStream.available()];
					
					inputStream.read(data);
				
					// Writing data
				
					fileOutputStream.write(data);
					
					fileOutputStream.close();
					
					session.setAttribute("message","Product saved successfully!");
					response.sendRedirect("admin.jsp");
					return;
					
				}
				catch(Exception e)
				{
					session.setAttribute("message","Some error occured, Please try again...");
					response.sendRedirect("admin.jsp");
					return;
				}
			
			}
		} 
		
	}

}
