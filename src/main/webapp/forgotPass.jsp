<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot Password Page</title>
<%@include file="allComponents/allCss.jsp"%>
</head>
<body
	style="background: linear-gradient(135deg, #20c493 0%, #1fb6f2 50%, #00d4ff 100%)";>
	<%@include file="allComponents/navbar.jsp"%>

	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">
				<i class="fa fa-key" aria-hidden="true"></i> Forgot Password
			</div>

			<%
			String forgotInvalidMsg = (String) session.getAttribute("forgot-invalid");
			if (forgotInvalidMsg != null) {
			%>
			<div class="alert alert-danger" role="alert"><%=forgotInvalidMsg%></div>
			<%
			session.removeAttribute("forgot-invalid");
			}
			%>

			<%
			String FailMsg = (String) session.getAttribute("failForgot");
			if (FailMsg != null) {
			%>
			<div class="alert alert-danger" role="alert"><%=FailMsg%></div>
			<%
			}
			session.removeAttribute("failForgot");
			%>

			<div class="card-body">
				<form action="forgot-password" method="post">
					<div class="form-group">
						<label>Email Address</label> <input type="email"
							class="form-control" name="log-email"
							placeholder="Enter Your Email" required>
					</div>
					<div class="form-group">
						<label>Enter New Password</label> <input type="password"
							class="form-control" name="new-pass" placeholder="********"
							required>
					</div>
					<div class="form-group">
						<label>Confirm New Password</label> <input type="password"
							class="form-control" name="confirm-new-pass"
							placeholder="********" required>
					</div>

					<div class="text-center">
						<button type="submit" class="btn"
							style="background-color: #20c493; color: #fff;">Change
							Password</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div style="padding-top: 70px;">
		<%@include file="allComponents/footer.jsp"%>
	</div>

</body>
</html>