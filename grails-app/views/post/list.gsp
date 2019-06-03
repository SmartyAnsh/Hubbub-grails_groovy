<%@page import="com.getsocio.Role"%>
<%@ page import="com.getsocio.Post"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="userLayout">
<g:set var="entityName"
	value="${message(code: 'post.label', default: 'Post')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<g:if test="${session.getAttribute('role').equals(Role.ADMIN) }">
		<a href="#list-post" class="skip" tabindex="-1"><g:message
				code="default.link.skip.label" default="Skip to content&hellip;" /></a>
		<div id="list-post" class="content scaffold-list" role="main">
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

						<g:sortableColumn property="content"
							title="${message(code: 'post.content.label', default: 'Content')}" />

						<g:sortableColumn property="dateCreated"
							title="${message(code: 'post.dateCreated.label', default: 'Date Created')}" />

						<th><g:message code="post.user.label" default="User" /></th>

					</tr>
				</thead>
				<tbody>
					<g:each in="${postInstanceList}" status="i"
						var="postInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

							<td><g:link action="show" id="${postInstance.id}">
									${fieldValue(bean: postInstance, field: "content")}
								</g:link></td>

							<td><g:formatDate date="${postInstance.dateCreated}" /></td>

							<td>
								${fieldValue(bean: postInstance, field: "user")}
							</td>

						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${postInstanceTotal}" />
			</div>
		</div>
	</g:if>
	<g:if test="${session.getAttribute('role').equals(Role.USER) }">
		<div style="margin: 10px 10px 10px 20px">Sorry you do not have
			access to this page.</div>
	</g:if>
</body>
</html>
