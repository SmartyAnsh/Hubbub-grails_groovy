<%@ page import="com.getsocio.UserData" %>
<%@page import="com.getsocio.Role"%>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="userLayout">
		<g:set var="entityName" value="${message(code: 'userData.label', default: 'UserData')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:if test="${session.getAttribute('role').equals(Role.ADMIN) }">
		<a href="#edit-userData" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="edit-userData" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userDataInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userDataInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${userDataInstance?.id}" />
				<g:hiddenField name="version" value="${userDataInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<%--<g:link class="list" action="list"><g:message code="default.button.list.label" default="Users" /></g:link>
					--%><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
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
