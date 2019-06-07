<%@ page import="com.getsocio.SecurityQuestion"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="main" />
<title>GetSocio</title>
<script type="text/javascript"
	src="${resource(dir:'js', file:'login.js') }"></script>
<style type="text/css" media="screen">
#status {
	background-color: #eee;
	border: .2em solid #fff;
	margin: 2em 2em 1em;
	padding: 1em;
	width: 12em;
	float: left;
	-moz-box-shadow: 0px 0px 1.25em #ccc;
	-webkit-box-shadow: 0px 0px 1.25em #ccc;
	box-shadow: 0px 0px 1.25em #ccc;
	-moz-border-radius: 0.6em;
	-webkit-border-radius: 0.6em;
	border-radius: 0.6em;
}

.ie6 #status {
	display: inline;
	/* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
}

#status ul {
	font-size: 0.9em;
	list-style-type: none;
	margin-bottom: 0.6em;
	padding: 0;
}

#status li {
	line-height: 1.3;
}

#status h1 {
	text-transform: uppercase;
	font-size: 1.1em;
	margin: 0 0 0.3em;
}

#page-body {
	margin: 2em 1em 1.25em 18em;
}

h2 {
	margin-top: 1em;
	margin-bottom: 0.3em;
	font-size: 1em;
}

p {
	line-height: 1.5;
	margin: 0.25em 0;
}

#controller-list ul {
	list-style-position: inside;
}

#controller-list li {
	line-height: 1.3;
	list-style-position: inside;
	margin: 0.25em 0;
}

@media screen and (max-width: 480px) {
	#status {
		display: none;
	}
	#page-body {
		margin: 0 1em 1em;
	}
	#page-body h1 {
		margin-top: 0;
	}
}
</style>
</head>
<body>
	<a href="#page-body" class="skip"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div id="page-body" role="main">
	</div>
	<div style="position: relative;">
		<div id="errorMessageDiv">
			<g:if test="${errorMessage }">
				<span style="color: red;"> ${errorMessage }
				</span>
			</g:if>
		</div>
		<div id="loginForm"
			style="width: 25% !important; float: left; margin: 10px 10px 10px 20px; border: 2px solid lightgray;">
			<span
				style="padding-left: 20%; font-weight: bold; font-family: sans-serif; font-size: 20px">Log
				In</span>
			<g:form action="login" controller="login" id="loginForm">

				<table>
					<tr>
						<td>Username :</td>
						<td><div class="hideOnLoad errorMessage"></div> <g:textField
								name="username" id="username" value="" data-required="true" /></td>
					</tr>
					<tr>
						<td>Password :</td>
						<td><div class="hideOnLoad errorMessage"></div> <g:passwordField
								name="userPassword" id="userPassword" value=""
								data-required="true" /></td>
					</tr>
					<tr>
						<td><g:submitButton name="login" value="Login"
								onclick="if(!checkValidate('loginForm')) return false;" /></td>
						<td><g:link class="forgetPassword" action="renderChangePassword" controller="login">
						Forget Password</g:link></td>
					</tr>
				</table>
			</g:form>

		</div>
		
		<div id="signUpForm"
			style="width: 40% !important; margin: 10px 10px 10px 20px; border: 2px solid lightgray; float: right">
			<span
				style="padding-left: 20%; font-weight: bold; font-family: sans-serif; font-size: 20px">New
				User</span>
			<g:form action="newUserSignUp" controller="user">
			<g:hiddenField name="contextPath" id="contextPath" value="${request.getContextPath() }"/>
				<div id="alert" style="text-indent: 2.2em; color: #CC0000;"></div>
				<table>
					<tr>
						<td>UserId :</td>
						<td><div class="successMessage" id="successMessage">
								${isAvailable }
							</div>
							<div class="hideOnLoad errorMessage" id="errorMessage"></div>
							<g:textField name="userId" id="userId" value=""
								data-required="true" /> <input type="button"
							class="linkLikeButton" value="Check for Availability"
							onClick="if(!checkValidateuserId()) return false" /></td>
					</tr>
					<tr>
						<td>Full Name :</td>
						<td><div class="hideOnLoad errorMessage"></div> <g:textField
								name="signUpUsername" id="signUpUsername" value=""
								data-required="true" /></td>
					</tr>
					<tr>
						<td>Country :</td>
						<td><div class="hideOnLoad errorMessage"></div> <g:textField
								name="country" id="country" value="" data-required="true" /></td>
					</tr>
					<tr>
						<td>Password :</td>
						<td>
							<div class="hideOnLoad errorMessage"></div> <g:passwordField
								name="signUpPassword" id="signUpPassword" value=""
								data-required="true" />
						</td>
					</tr>
					<tr>
						<td>Confirm Password :</td>
						<td>
							<div class="hideOnLoad errorMessage"></div> <g:passwordField
								name="userConfirmPassword" id="userConfirmPassword" value=""
								data-required="true" />
						</td>
					</tr>
					<tr>
						<td>Security Question :</td>
						<td>
							<div class="hideOnLoad errorMessage"></div> <g:select
								name="securityQues" from="${SecurityQuestion.values()}"
								id="securityQues" />
						</td>
					</tr>
					<tr>
						<td>Security Answer :</td>
						<td>
							<div class="hideOnLoad errorMessage"></div> <g:passwordField
								name="securityAnswer" id="securityAnswer" value=""
								data-required="true" />
						</td>
					</tr>
					<tr>
						<td><g:submitButton name="signUp" value="Sign Up"
								onclick="if(!checkValidate('signUpForm')) return false;if(!checkPassword()) return false;if(!checkUserIdErrorMessage()) return false;" /></td>
					</tr>
				</table>
			</g:form>
		</div>
<div style=" margin: 20px 10px 10px 320px; float: left; color: green">
			
			<g:if test="${isUpdated == 'true' }">
			Password Changed successfully.<br> Login with new Password
			</g:if>
			<g:elseif test="${isUpdated == 'false' }">
				<span style="color: red">Not able to change password.<br>
					Please try again later
				</span>
			</g:elseif>
			<g:if test="${existingUserId == 'true' }">
				<span style="color: red">You are not allowed to sign up with existing userId.<br>
					Please check the availability of userId and try again.
				</span>
			</g:if>
		</div>

	</div>
</body>
</html>
