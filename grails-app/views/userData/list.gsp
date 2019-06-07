<%@page import="com.getsocio.Role"%>
<%@ page import="com.getsocio.User"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="userLayout">
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<g:if test="${session.getAttribute('role').equals(Role.ADMIN) }">
		<a href="#list-user" class="skip" tabindex="-1"><g:message
				code="default.link.skip.label" default="Skip to content&hellip;" /></a>
		<div id="list-user" class="content scaffold-list" role="main">
			<h1>
				<g:message code="default.list.label" args="[entityName]" />
			</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>
			<table>
				<thead>
					<tr>

						<g:sortableColumn property="userId"
							title="${message(code: 'user.userId.label', default: 'User Id')}" />

						<g:sortableColumn property="password"
							title="${message(code: 'user.password.label', default: 'Password')}" />

						<g:sortableColumn property="homepage"
							title="${message(code: 'user.homepage.label', default: 'Homepage')}" />

						<th><g:message code="user.profile.label"
								default="Profile" /></th>

						<g:sortableColumn property="dateCreated"
							title="${message(code: 'user.dateCreated.label', default: 'Date Created')}" />

					</tr>
				</thead>
				<tbody>
					<g:each in="${userInstanceList}" status="i"
						var="userInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

							<td><g:link action="show" id="${userInstance.id}">
									${fieldValue(bean: userInstance, field: "userId")}
								</g:link></td>

							<td><g:passwordField name="password"
									value="${fieldValue(bean: userInstance, field: "password")}"
									disabled="disabled" /></td>

							<td>
								${fieldValue(bean: userInstance, field: "homepage")}
							</td>

							<td>
								${fieldValue(bean: userInstance, field: "profile")}
							</td>

							<td><g:formatDate date="${userInstance.dateCreated}" /></td>

						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userInstanceTotal}" />
			</div>
		</div>
	</g:if>
	<g:if test="${session.getAttribute('role').equals(Role.USER) }">
		<div style="margin: 10px 10px 10px 20px">Sorry you do not have
			access to this page.</div>
	</g:if>
</body>
</html>
