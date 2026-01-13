package com.servlet;

import java.io.IOException;

import com.dao.PostDao;
import com.db.DbConn;
import com.model.Post;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int note_id = Integer.parseInt(req.getParameter("note-id"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");

		try {

			PostDao pd = new PostDao(DbConn.getConn());
			boolean b = pd.postUpdate(note_id, title, content);

			HttpSession session = req.getSession();

			if (b) {
				session.setAttribute("updateMsg", "Notes Updated Successfully..");
				resp.sendRedirect("showNotes.jsp");
			} else {
				session = req.getSession();
				session.setAttribute("updateFailMsg", "Failed to update note !");
				resp.sendRedirect("showNotes.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
