<%@page import="com.db.DbConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img {
	background: url("img/ENotes2.jpg");
	width: 100%;
	height: 100vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

<meta charset="ISO-8859-1">
<title>E-Notes</title>
<%@include file="allComponents/allCss.jsp"%>
</head>
<body>
	<%@include file="allComponents/navbar.jsp"%>

	<div class="container-fluid back-img">
		<div class="text-center">
			<h1 class="text-white" style="padding-top: 45px;">
				<i class="fa fa-book" aria-hidden="true"></i> E Notes-Save Your
				Notes
			</h1>
			<a href="login.jsp" class="btn btn-light"><i
				class="fa
				fa-user-circle-o" aria-hidden="true"></i> Login </a> <a
				href="register.jsp" class="btn btn-light"><i
				class="fa fa-user-plus" aria-hidden="true"></i> Register</a>
		</div>
	</div>



	<%@include file="allComponents/footer.jsp"%>
</body>
</html>