package com.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.dao.PostDao;
import com.db.DbConn;
import com.model.Post;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int uid = Integer.parseInt(req.getParameter("uid"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");

		try {

			PostDao dao = new PostDao(DbConn.getConn());
			boolean x = dao.addNotes(title, content, uid);

			if (x) {
				resp.sendRedirect("showNotes.jsp");
			} else {
				HttpSession session = req.getSession();
				session.setAttribute("noteAddFail", "Failed to add note !");
				resp.sendRedirect("addNotes.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
