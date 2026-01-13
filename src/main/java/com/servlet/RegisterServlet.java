package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.model.User;
import com.dao.UserDao;
import com.db.DbConn;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user-regis")
public class RegisterServlet extends HttpServlet{

     @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	 
    	 resp.setContentType("text/html;charset=UTF-8");
    	 
    	 String name = req.getParameter("Register-name");
		 String email = req.getParameter("Register-email");
		 String pass = req.getParameter("Register-password");
		 String conPass = req.getParameter("Confirm-password");
			  
		   HttpSession session = req.getSession();
		    
		    try(PrintWriter out = resp.getWriter();) {
		    	 if(pass.equals(conPass)) {
		    		  UserDao usDao = new UserDao(DbConn.getConn());
					  User us = usDao.addUser(name, email, pass);
					  
						if(us != null) {
							session.setAttribute("regis-success", "User Registered Successfully... ");
							resp.sendRedirect("register.jsp");
 						} else {
 							session.setAttribute("regis-failed", "User Already Registered !");
 							resp.sendRedirect("register.jsp");
 						}
		    	 } else {
		    		 session.setAttribute("regis-invalid", "Password and Confirm-Password didn't Matched !");
		    		 resp.sendRedirect("register.jsp");
		    	 }
				
				
			} catch (Exception e) {
 				e.printStackTrace();
			}  
     }	
}
