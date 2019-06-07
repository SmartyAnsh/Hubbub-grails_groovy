<%@page import="com.getsocio.Role"%>
<%@ page import="com.getsocio.Comment"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="userLayout">
<g:set var="entityName"
	value="${message(code: 'commentByUserOnPost.label', default: 'CommentByUserOnPost')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<g:if test="${session.getAttribute('role').equals(Role.ADMIN) }">
		<div id="show-commentByUserOnPost" class="content scaffold-show"
			role="main">
			<h1>
				<g:message code="default.show.label" args="[entityName]" />
			</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>
			<ol class="property-list commentByUserOnPost">

				<g:if test="${commentByUserOnPostInstance?.commentByUser}">
					<li class="fieldcontain"><span id="commentByUser-label"
						class="property-label"><g:message
								code="commentByUserOnPost.commentByUser.label"
								default="Comment By User" /></span> <span class="property-value"
						aria-labelledby="commentByUser-label"><g:fieldValue
								bean="${commentByUserOnPostInstance}" field="commentByUser" /></span></li>
				</g:if>

				<g:if test="${commentByUserOnPostInstance?.byUser}">
					<li class="fieldcontain"><span id="byUser-label"
						class="property-label"><g:message
								code="commentByUserOnPost.byUser.label" default="By User" /></span> <span
						class="property-value" aria-labelledby="byUser-label"><g:link
								controller="user" action="show"
								id="${commentByUserOnPostInstance?.byUser?.id}">
								${commentByUserOnPostInstance?.byUser?.encodeAsHTML()}
							</g:link></span></li>
				</g:if>

				<g:if test="${commentByUserOnPostInstance?.onPost}">
					<li class="fieldcontain"><span id="onPost-label"
						class="property-label"><g:message
								code="commentByUserOnPost.onPost.label" default="On Post" /></span> <span
						class="property-value" aria-labelledby="onPost-label"><g:link
								controller="post" action="show"
								id="${commentByUserOnPostInstance?.onPost?.id}">
								${commentByUserOnPostInstance?.onPost?.encodeAsHTML()}
							</g:link></span></li>
				</g:if>

			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${commentByUserOnPostInstance?.id}" />
					<g:link class="edit" action="edit"
						id="${commentByUserOnPostInstance?.id}">
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<g:actionSubmit class="delete" action="delete"
						value="${message(code: 'default.button.delete.label', default: 'Delete')}"
						onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
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
