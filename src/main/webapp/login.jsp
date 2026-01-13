<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@include file="allComponents/allCss.jsp"%>
</head>
<body
	style="background: linear-gradient(135deg, #20c493 0%, #1fb6f2 50%, #00d4ff 100%);">
	<%@include file="allComponents/navbar.jsp"%>

	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">
				<i class="fa fa-user-circle" aria-hidden="true"></i> User Login
			</div>
			<%
			String logFailMsg = (String) session.getAttribute("log-fail");
			if (logFailMsg != null) {
			%>
			<div class="alert alert-danger" role="alert"><%=logFailMsg%></div>
			<%
			session.removeAttribute("log-fail");
			}
			%>

			<%
			String withoutLogMsg = (String) session.getAttribute("Login-error");
			if (withoutLogMsg != null) {
			%>
			<div class="alert alert-danger" role="alert"><%=withoutLogMsg%></div>
			<%
			session.removeAttribute("Login-error");
			}
			%>

			<%
			String logoutMsg = (String) session.getAttribute("logout-Msg");
			if (logoutMsg != null) {
			%>
			<div class="alert alert-success" role="alert"><%=logoutMsg%></div>
			<%
			session.removeAttribute("logout-Msg");
			}
			%>

			<!-- Forgot Password message -->

			<%
			String successMsg = (String) session.getAttribute("success-forgot");
			if (successMsg != null) {
			%>
			<div class="alert alert-success" role="alert"><%=successMsg%></div>
			<%
			}
			session.removeAttribute("success-forgot");
			%>

			<div class="card-body">
				<form action="user-log" method="post">
					<div class="form-group">
						<label>Email Address</label> <input type="email"
							class="form-control" name="Login-email"
							placeholder="Enter Your Email" required>
					</div>
					<div class="form-group">
						<label>Password</label> <input type="password"
							class="form-control" name="Login-password" placeholder="********"
							required>
					</div>

					<a href="forgotPass.jsp">Forgot Password</a>
					<div class="text-center">
						<button type="submit" class="btn"
							style="background-color: none; background-color: #20c493; color: #fff;">Login</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="footer-set">
		<%@include file="allComponents/footer.jsp"%>
	</div>
</body>
</html>