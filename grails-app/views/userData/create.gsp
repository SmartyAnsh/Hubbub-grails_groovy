<%@page import="com.getsocio.Role"%>
<%@ page import="com.getsocio.User"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="userLayout">
<g:set var="entityName"
	value="${message(code: 'userData.label', default: 'User')}" />
<title><g:if
		test="${session.getAttribute('role').equals(Role.ADMIN) }">
		<g:message code="default.create.label" args="[entityName]" />
	</g:if>
	<g:else>Functionality Not Allowed</g:else></title>
<script type="text/javascript">
	function checkValidate() {
		var pass = document.getElementById('password').value;
		var confpass = document.getElementById('confirmPassword').value;
		var valid = false;
		if (pass != "" || confpass != "") {
			if (pass != confpass) {
				document.getElementById("alert").innerHTML = 'Please enter same value in both Password and Confirm Password';
				valid = false;
			} else {
				valid = true;
			}
		}
		return valid;
	}
</script>
</head>
<body>
	<g:if test="${session.getAttribute('role').equals(Role.ADMIN) }">
		<a href="#create-userData" class="skip" tabindex="-1"><g:message
				code="default.link.skip.label" default="Skip to content&hellip;" /></a>
		<div id="create-userData" class="content scaffold-create" role="main">
			<h1>
				<g:message code="default.create.label" args="[entityName]" />
			</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>
			<div id="alert" style="text-indent: 2.2em; color: #CC0000;"></div>
			<g:hasErrors bean="${userDataInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${userDataInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			<g:form action="save">
				<fieldset class="form">
					<g:render template="form" />
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save"
						value="${message(code: 'default.button.create.label', default: 'Create')}"
						onClick="if(!checkValidate(this)) return false;" />
				</fieldset>
			</g:form>
		</div>
	</g:if>
	<g:if test="${session.getAttribute('role').equals(Role.USER) }">
		<div style="margin: 10px 10px 10px 20px">Sorry you do not have
			access to this page.</div>

	</g:if>
</body>
</html>

