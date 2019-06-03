
<%@page import="com.getsocio.SecurityQuestion"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'errors.css')}">
<link rel="shortcut icon"
	href="${resource(dir: 'images', file: 'favicon.ico')}"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="114x114"
	href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
<script type="text/javascript"
	src="${resource(dir:'js', file:'jquery-1.7.2.min.js') }"></script>
<script type="text/javascript"
	src="${resource(dir:'js', file:'jquery-1.7.2.js') }"></script>


<title>Change Password of ${session.getAttribute('fullName')}</title>
<script type="text/javascript"
	src="${resource(dir:'js', file:'login.js') }"></script>
</head>
<body>
	<%--${session.getAttribute("user")}
	${session.getAttribute("role")}	
	--%>
	<div id="grailsLogo" role="banner">
		<a href=""><img
			src="${resource(dir: 'images', file: 'grails_logo.png')}"
			alt="Grails" /></a> <span style="font-size: 30px; font-family: cursive;">Social
			Networking on Grails</span>
	</div>
	<g:if test="${session.getAttribute('user') && session.getAttribute('fullName')}">
	<div style="margin: 20px 20px 20px 20%"  id="changePassword">
		<span style="font-weight: bold; font-size: 1.2em">Change
			Password</span> <br> <br>
		<g:form>
			<table style="width: 60%" id="changePasswordTable">
				<tr>
					<td>User Id :</td>
					<td><g:textField name="userId" id="userId"
							value="${(String)session.getAttribute('user')}"
							disabled="disabled" /></td>
				</tr>
				<tr>
					<td>Full Name :</td>
					<td><g:textField name="fullName" id="fullName"
							value="${(String)session.getAttribute('fullName')}"
							disabled="disabled" /></td>
				</tr>
				<tr>
					<td>Security Question :</td>
					<td><g:select name="securityQues" id="securityQues"
							from="${SecurityQuestion}" /></td>
				</tr>
				<tr>
					<td>Security Answer :</td>
					<td><div class="hideOnLoad errorMessage"></div> <g:passwordField name="securityAns" id="securityAns" data-required="true"/></td>
				</tr>
				<tr>
					<td>Old Password :</td>
					<td><div class="hideOnLoad errorMessage"></div> <g:passwordField name="oldPassword" id="oldPassword" data-required="true"/></td>
				</tr>
				<tr>
					<td><g:submitToRemote
							url="[action:'checkCredentials',controller:'login']"
							update="changePasswordTable" value="Submit" before="if(!validateChangePassword('changePassword')) return false"/></td>

					<td><g:link controller="userData" action="homePage" class="buttonLikeLink">Cancel</g:link>
					</td>
				</tr>
			</table>

		</g:form>
	</div>
	</g:if>
	<g:else>
	<div style="margin: 20px 20px 20px 20%" id="forgetPassword">
		<span style="font-weight: bold; font-size: 1.2em">Forget
			Password</span> <br> <br>
		<g:form >
			<table style="width: 60%" id="changePasswordTable">
				<tr>
					<td>User Id :</td>
					<td><div class="hideOnLoad errorMessage"></div> <g:textField name="userId" id="userId"
							value="" data-required="true"
							 /></td>
				</tr>
				<tr>
					<td>Full Name :</td>
					<td><div class="hideOnLoad errorMessage"></div> <g:textField name="fullName" id="fullName"
							value="" data-required="true"
							 /></td>
				</tr>
				<tr>
					<td>Security Question :</td>
					<td><g:select name="securityQues" id="securityQues"
							from="${SecurityQuestion}" /></td>
				</tr>
				<tr>
					<td>Security Answer :</td>
					<td><div class="hideOnLoad errorMessage"></div> <g:passwordField name="securityAns" id="securityAns" data-required="true"/></td>
				</tr>
				
				<tr>
					<td><g:submitToRemote
							url="[action:'checkCredentials',controller:'login']"
							update="changePasswordTable" value="Submit" before="if(!validateChangePassword('forgetPassword')) return false"/></td>

					<td><g:link controller="login" action="logout" class="buttonLikeLink">Cancel</g:link>
					</td>
				</tr>
			</table>

		</g:form>
	</div>
	</g:else>
	<div class="footer" role="contentinfo"></div>
</body>
</html>
