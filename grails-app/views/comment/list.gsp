<%@page import="com.getsocio.Role"%>
<%@ page import="com.getsocio.Comment"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="userLayout">
<g:set var="entityName"
	value="${message(code: 'commentByUserOnPost.label', default: 'CommentByUserOnPost')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<g:if test="${session.getAttribute('role').equals(Role.ADMIN) }">
		<div id="list-commentByUserOnPost" class="content scaffold-list"
			role="main">
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

						<g:sortableColumn property="commentByUser"
							title="${message(code: 'commentByUserOnPost.commentByUser.label', default: 'Comment By User')}" />

						<th><g:message code="commentByUserOnPost.byUser.label"
								default="By User" /></th>

						<th><g:message code="commentByUserOnPost.onPost.label"
								default="On Post" /></th>

					</tr>
				</thead>
				<tbody>
					<g:each in="${commentByUserOnPostInstanceList}" status="i"
						var="commentByUserOnPostInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

							<td><g:link action="show"
									id="${commentByUserOnPostInstance.id}">
									${fieldValue(bean: commentByUserOnPostInstance, field: "commentByUser")}
								</g:link></td>

							<td>
								${fieldValue(bean: commentByUserOnPostInstance, field: "byUser")}
							</td>

							<td>
								${fieldValue(bean: commentByUserOnPostInstance, field: "onPost")}
							</td>

						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${commentByUserOnPostInstanceTotal}" />
			</div>
		</div>
	</g:if>
	<g:if test="${session.getAttribute('role').equals(Role.USER) }">
		<div style="margin: 10px 10px 10px 20px">Sorry you do not have
			access to this page.</div>
	</g:if>
</body>
</html>
