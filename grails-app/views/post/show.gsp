<%@page import="com.getsocio.Role"%>
<%@ page import="com.getsocio.Post"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="userLayout">
<g:set var="entityName"
	value="${message(code: 'post.label', default: 'Post')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<g:if test="${session.getAttribute('role').equals(Role.ADMIN) }">
		<a href="#show-post" class="skip" tabindex="-1"><g:message
				code="default.link.skip.label" default="Skip to content&hellip;" /></a>
		<div id="show-post" class="content scaffold-show" role="main">
			<h1>
				<g:message code="default.show.label" args="[entityName]" />
			</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>
			<ol class="property-list post">

				<g:if test="${postInstance?.content}">
					<li class="fieldcontain"><span id="content-label"
						class="property-label"><g:message
								code="post.content.label" default="Content" /></span> <span
						class="property-value" aria-labelledby="content-label"><g:fieldValue
								bean="${postInstance}" field="content" /></span></li>
				</g:if>

				<g:if test="${postInstance?.dateCreated}">
					<li class="fieldcontain"><span id="dateCreated-label"
						class="property-label"><g:message
								code="post.dateCreated.label" default="Date Created" /></span> <span
						class="property-value" aria-labelledby="dateCreated-label"><g:formatDate
								date="${postInstance?.dateCreated}" /></span></li>
				</g:if>

				<g:if test="${postInstance?.tags}">
					<li class="fieldcontain"><span id="tags-label"
						class="property-label"><g:message
								code="post.tags.label" default="Tags" /></span> <g:each
							in="${postInstance.tags}" var="t">
							<span class="property-value" aria-labelledby="tags-label"><g:link
                                    controller="tag" action="show" id="${t.id}">
									${t?.encodeAsHTML()}
								</g:link></span>
						</g:each></li>
				</g:if>

				<g:if test="${postInstance?.user}">
					<li class="fieldcontain"><span id="user-label"
						class="property-label"><g:message
								code="post.user.label" default="User" /></span> <span
						class="property-value" aria-labelledby="user-label"><g:link
								controller="user" action="show"
								id="${postInstance?.user?.id}">
								${postInstance?.user?.encodeAsHTML()}
							</g:link></span></li>
				</g:if>

			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${postInstance?.id}" />
					<%--<g:link class="list" action="list"><g:message code="default.button.list.label" default="Posts" /></g:link>
					--%>
					<g:link class="edit" action="edit" id="${postInstance?.id}">
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
