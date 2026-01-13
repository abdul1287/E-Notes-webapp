package com.servlet;

import java.io.IOException;

import com.dao.PostDao;
import com.db.DbConn;
import com.mysql.cj.Session;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int note_id = Integer.parseInt(req.getParameter("note_id"));

		try {

			PostDao pd = new PostDao(DbConn.getConn());
			boolean x = pd.noteDelete(note_id);

			HttpSession session = req.getSession();

			if (x) {
				session.setAttribute("deleteMsg", "Notes Deleted Successfully..");
				resp.sendRedirect("showNotes.jsp");
			} else {
				session.setAttribute("deleteFailMsg", "Failed to delete note !");
				resp.sendRedirect("showNotes.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
