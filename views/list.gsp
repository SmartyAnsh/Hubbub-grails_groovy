<%@page import="hubbub.Role"%>
<%@ page import="hubbub.UserData"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="userLayout">
<g:set var="entityName"
	value="${message(code: 'userData.label', default: 'UserData')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<g:if test="${session.getAttribute('role').equals(Role.ADMIN) }">
		<a href="#list-userData" class="skip" tabindex="-1"><g:message
				code="default.link.skip.label" default="Skip to content&hellip;" /></a>
		<div id="list-userData" class="content scaffold-list" role="main">
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
							title="${message(code: 'userData.userId.label', default: 'User Id')}" />

						<g:sortableColumn property="password"
							title="${message(code: 'userData.password.label', default: 'Password')}" />

						<g:sortableColumn property="homepage"
							title="${message(code: 'userData.homepage.label', default: 'Homepage')}" />

						<th><g:message code="userData.profile.label"
								default="Profile" /></th>

						<g:sortableColumn property="dateCreated"
							title="${message(code: 'userData.dateCreated.label', default: 'Date Created')}" />

					</tr>
				</thead>
				<tbody>
					<g:each in="${userDataInstanceList}" status="i"
						var="userDataInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

							<td><g:link action="show" id="${userDataInstance.id}">
									${fieldValue(bean: userDataInstance, field: "userId")}
								</g:link></td>

							<td><g:passwordField name="password"
									value="${fieldValue(bean: userDataInstance, field: "password")}"
									disabled="disabled" /></td>

							<td>
								${fieldValue(bean: userDataInstance, field: "homepage")}
							</td>

							<td>
								${fieldValue(bean: userDataInstance, field: "profile")}
							</td>

							<td><g:formatDate date="${userDataInstance.dateCreated}" /></td>

						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userDataInstanceTotal}" />
			</div>
		</div>
	</g:if>
	<g:if test="${session.getAttribute('role').equals(Role.USER) }">
		<div style="margin: 10px 10px 10px 20px">Sorry you do not have
			access to this page.</div>
	</g:if>
</body>
</html>
