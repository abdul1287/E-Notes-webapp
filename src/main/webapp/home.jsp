<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User user2 = (User) session.getAttribute("us");
if (user2 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login !");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<%@include file="allComponents/allCss.jsp"%>
</head>
<body>

	<div class="container-fluid p-0">
		<%@include file="allComponents/navbar.jsp"%>
		<div class="card mt-3 py-5">
			<div class="card-body text-center">
				<img alt="" src="img/tech-pic-up.png" class="img-fluid mx-auto"
					style="width: 350px; height: auto;">
				<h1>START TAKING YOUR NOTES</h1>
				<a href="addNotes.jsp" class="btn btn-outline-primary">START
					HERE</a>
			</div>
		</div>
	</div>


	<%@include file="allComponents/footer.jsp"%>
</body>
</html>