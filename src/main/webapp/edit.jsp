<%@page import="com.model.Post"%>
<%@page import="com.db.DbConn"%>
<%@page import="com.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User user = (User) session.getAttribute("us");
if (user == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login !");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Page</title>
<%@include file="allComponents/allCss.jsp"%>
</head>
<body>

	<%
	int note_id = Integer.parseInt(request.getParameter("note_id"));

	PostDao pd = new PostDao(DbConn.getConn());
	Post p = pd.getDataById(note_id);
	%>

	<div class="container-fluid">
		<%@include file="allComponents/navbar.jsp"%>

		<h1 class="text-center" style="padding-top: 10px;">Edit Your
			Notes</h1>



		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form action="EditServlet" method="post">

						<input type="hidden" value="<%=note_id%>" name="note-id">

						<div class="form-group">

							<label for="exampleInputEmail1">Enter Title Here</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="title" required
								value="<%=p.getTitle()%>">
						</div>
						<label for="exampleInputEmail1">Enter Content Here</label>
						<div class="form-group">
							<textarea rows="10" cols="" class="form-group"
								style="height: 200px; width: 1110px;" name="content" required><%=p.getContent()%>
				        
				   </textarea>
						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-primary">Edit</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>



	<div style="padding-top: 100px;">
		<%@include file="allComponents/footer.jsp"%>
	</div>
</body>
</html>