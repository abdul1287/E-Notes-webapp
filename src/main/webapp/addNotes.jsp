<%@page import="com.model.User"%>
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
<title>Add Notes</title>
<%@include file="allComponents/allCss.jsp"%>
</head>
<body>

	<%
	String noteAddFail = (String) session.getAttribute("noteAddFail");
	if (noteAddFail != null) {
	%>
	<div class="alert alert-danger" role="alert"><%=noteAddFail%></div>
	<%
	session.removeAttribute("noteAddFail");
	}
	%>

	<div class="container-fluid">
		<%@include file="allComponents/navbar.jsp"%>

		<h1 class="text-center" style="padding-top: 10px;">Add Your Notes</h1>

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form action="AddNotesServlet" method="post">
						<div class="form-group">

							<%
							User us1 = (User) session.getAttribute("us");
							if (us1 != null) {
							%>
							<input type="hidden" value="<%=user.getId()%>" name="uid">
							<%
							}
							%>

							<label for="exampleInputEmail1">Enter Title Here</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="title" required>
						</div>
						<label for="exampleInputEmail1">Enter Content Here</label>
						<div class="form-group">
							<textarea rows="10" cols="" class="form-group"
								style="height: 200px; width: 1110px;" name="content" required>
				        
				   </textarea>
						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-primary">Add</button>
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