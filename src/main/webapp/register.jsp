<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register page</title>
<%@include file="allComponents/allCss.jsp"%>
</head>
<body
	style="background: linear-gradient(135deg, #20c493 0%, #1fb6f2 50%, #00d4ff 100%);">
	<%@include file="allComponents/navbar.jsp"%>

	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">
				<i class="fa fa-user-plus" aria-hidden="true"></i> User Registration
			</div>

			<%
			String regMsg = (String) session.getAttribute("regis-success");
			if (regMsg != null) {
			%>
			<div class="alert alert-success" role="alert"><%=regMsg%> Login -> <a href="login.jsp"> Click Here </a></div>
			<%
			  session.removeAttribute("regis-success");
			}
			%>
			
			<%
			String regFailMsg = (String) session.getAttribute("regis-failed");
			if (regFailMsg != null) {
			%>
			<div class="alert alert-danger" role="alert"><%=regFailMsg%></div>
			<%
			   session.removeAttribute("regis-failed");
			}
			%>
			
			<%
			String regInvalidMsg = (String) session.getAttribute("regis-invalid");
			if (regInvalidMsg != null) {
			%>
			<div class="alert alert-danger" role="alert"><%=regInvalidMsg%></div>
			<%
			  session.removeAttribute("regis-invalid");
			}
			%>

			<div class="card-body">
				<form action="user-regis" method="post">
					<div class="form-group">
						<label>Name</label> <input type="text" class="form-control"
							name="Register-name" placeholder="Enter Your Name" required>
					</div>
					<div class="form-group">
						<label>Email Address</label> <input type="email"
							class="form-control" name="Register-email"
							placeholder="Enter Your Email" required>
					</div>
					<div class="form-group">
						<label>Create Password</label> <input type="password"
							class="form-control" name="Register-password"
							placeholder="********" required>
					</div>
					<div class="form-group">
						<label>Confirm Password</label> <input type="password"
							class="form-control" name="Confirm-password"
							placeholder="********" required>
					</div>

					<div class="text-center">
						<button type="submit" class="subbtn"
							style="background-color: #20c493; color: #fff; border-color: #1fa67a; display: inline-block; font-weight: 400; border: 1px solid transparent; white-space: nowrap; vertical-align: middle; padding: .375rem .75rem; cursor: pointer; box-shadow: 0 0 0 .2rem; user-select: none; font-size: 1rem; line-height: 1.5; border-radius: .25rem;">Register</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@include file="allComponents/footer.jsp"%>
</body>
</html>