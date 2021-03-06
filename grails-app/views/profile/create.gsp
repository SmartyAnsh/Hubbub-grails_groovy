<%@ page import="com.getsocio.Profile"%>
<%@page import="com.getsocio.Role"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="userLayout">
<g:set var="entityName"
	value="${message(code: 'profile.label', default: 'Profile')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<g:if test="${session.getAttribute('role').equals(Role.ADMIN) }">
		<a href="#create-profile" class="skip" tabindex="-1"><g:message
				code="default.link.skip.label" default="Skip to content&hellip;" /></a>
		<div id="create-profile" class="content scaffold-create"
			role="main">
			<h1>
				<g:message code="default.create.label" args="[entityName]" />
			</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>
			<g:hasErrors bean="${profileInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${profileInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			<g:form action="save" enctype="multipart/form-data">
				<fieldset class="form">
					<g:render template="form" />
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save"
						value="${message(code: 'default.button.create.label', default: 'Create')}" />
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
