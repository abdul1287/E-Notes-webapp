package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.dao.UserDao;
import com.db.DbConn;
import com.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user-log")
public class LoginServlet extends HttpServlet{

     @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	 resp.setContentType("text/html;charset=UTF-8");
    	 
    	 try(PrintWriter out = resp.getWriter()){
			
    		String email = req.getParameter("Login-email");
 			String password = req.getParameter("Login-password");
 			HttpSession session = req.getSession();
 			
 			try {
				
 				UserDao userDao = new UserDao(DbConn.getConn());
 	 			User us = userDao.loginUser(email, password);
 	 			
 	 			if(us != null) {
 	 				session.setAttribute("us", us);
 	 				resp.sendRedirect("home.jsp");
 	 			} else {
 	 				session.setAttribute("log-fail", "Invalid Email and Password !");
 	 				resp.sendRedirect("login.jsp");
 	 			}
 				
			} catch (Exception e) {
				e.printStackTrace();
 			}
 			 
		} catch (Exception e) {
			e.printStackTrace();
 		}
     }	
}
