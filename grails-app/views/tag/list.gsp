<%@page import="com.getsocio.Role"%>
<%@ page import="com.getsocio.Tag" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="userlayout">
		<g:set var="entityName" value="${message(code: 'tag.label', default: 'Tag')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<g:if test="${session.getAttribute('role').equals(Role.ADMIN) }">
		<a href="#list-taggingOfUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="list-taggingOfUser" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'tag.name.label', default: 'Name')}" />
					
						<th><g:message code="taggingOfUser.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${taggingOfUserInstanceList}" status="i" var="taggingOfUserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${taggingOfUserInstance.id}">${fieldValue(bean: taggingOfUserInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: taggingOfUserInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${taggingOfUserInstanceTotal}" />
			</div>
		</div>
		</g:if>
		<g:if test="${session.getAttribute('role').equals(Role.USER) }">
		<div style="margin: 10px 10px 10px 20px">Sorry you do not have
			access to this page.</div>

	</g:if>
	</body>
</html>
