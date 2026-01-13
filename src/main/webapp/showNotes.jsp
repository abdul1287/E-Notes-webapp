<%@page import="java.util.List"%>
<%@page import="com.db.DbConn"%>
<%@page import="com.dao.PostDao"%>
<%@page import="com.model.Post"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User user3 = (User) session.getAttribute("us");
if (user3 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login !");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Notes Page</title>
<%@include file="allComponents/allCss.jsp"%>
</head>
<body>
	<%@include file="allComponents/navbar.jsp"%>

	<%
	String updateMsg = (String) session.getAttribute("updateMsg");
	if (updateMsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=updateMsg%></div>
	<%
	session.removeAttribute("updateMsg");
	}
	%>

	<%
	String updateFailMsg = (String) session.getAttribute("updateFailMsg");
	if (updateFailMsg != null) {
	%>
	<div class="alert alert-danger" role="alert"><%=updateFailMsg%></div>
	<%
	session.removeAttribute("updateFailMsg");
	}
	%>

	<%
	String deleteMsg = (String) session.getAttribute("deleteMsg");
	if (deleteMsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=deleteMsg%></div>
	<%
	session.removeAttribute("deleteMsg");
	}
	%>

	<%
	String deleteFailMsg = (String) session.getAttribute("deleteFailMsg");
	if (deleteFailMsg != null) {
	%>
	<div class="alert alert-danger" role="alert"><%=deleteFailMsg%></div>
	<%
	session.removeAttribute("deleteFailMsg");
	}
	%>


	<div class="container">
		<h2 class="text-center" style="padding-top: 20px;">All Notes</h2>

		<div class="row">
			<div class="col-md-12">

				<%
				if (user3 != null) {
					PostDao pd = new PostDao(DbConn.getConn());
					List<Post> post = pd.getData(user3.getId());

					for (Post p : post) {
				%>
				<div class="card mt-3">
					<img alt="" src="img/tech-pic-up.png"
						class="card-img-top mt-2 mx-auto" style="max-width: 120px;">

					<div class="card-body p-4">

						<h5 class="card-title"><%=p.getTitle()%></h5>
						<p><%=p.getContent()%></p>

						<p>
							<b class="text-success">Published By: <%=user3.getName()%></b><br>
							<b class="text-primary"></b>
						</p>

						<p>
							<b class="text-success">Published Date: <%=p.getP_date()%></b><br>
							<b class="text-success"></b>
						</p>

						<div class="container text-center mt-2">
							<a href="edit.jsp?note_id=<%=p.getId()%>" class="btn btn-primary">Edit</a>
							<a href="DeleteServlet?note_id=<%=p.getId()%>"
								class="btn btn-danger">Delete</a>
						</div>
					</div>
				</div>
				<%
				}
				}
				%>


			</div>
		</div>
	</div>


	<div class="footer-set">
		<%@include file="allComponents/footer.jsp"%>
	</div>
</body>
</html>