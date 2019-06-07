<%@page import="com.getsocio.Role"%>
<%@ page import="com.getsocio.Tag"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="userLayout">
<g:set var="entityName"
	value="${message(code: 'tag.label', default: 'Tag')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<g:if test="${session.getAttribute('role').equals(Role.ADMIN) }">
		<a href="#show-taggingOfUser" class="skip" tabindex="-1"><g:message
				code="default.link.skip.label" default="Skip to content&hellip;" /></a>
		<div id="show-taggingOfUser" class="content scaffold-show" role="main">
			<h1>
				<g:message code="default.show.label" args="[entityName]" />
			</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>
			<ol class="property-list taggingOfUser">

				<g:if test="${taggingOfUserInstance?.name}">
					<li class="fieldcontain"><span id="name-label"
						class="property-label"><g:message
								code="taggingOfUser.name.label" default="Name" /></span> <span
						class="property-value" aria-labelledby="name-label"><g:fieldValue
								bean="${taggingOfUserInstance}" field="name" /></span></li>
				</g:if>

				<g:if test="${taggingOfUserInstance?.posts}">
					<li class="fieldcontain"><span id="posts-label"
						class="property-label"><g:message
								code="taggingOfUser.posts.label" default="Posts" /></span> <g:each
							in="${taggingOfUserInstance.posts}" var="p">
							<span class="property-value" aria-labelledby="posts-label"><g:link
									controller="post" action="show" id="${p.id}">
									${p?.encodeAsHTML()}
								</g:link></span>
						</g:each></li>
				</g:if>

				<g:if test="${taggingOfUserInstance?.user}">
					<li class="fieldcontain"><span id="user-label"
						class="property-label"><g:message
								code="taggingOfUser.user.label" default="User" /></span> <span
						class="property-value" aria-labelledby="user-label"><g:link
								controller="user" action="show"
								id="${taggingOfUserInstance?.user?.id}">
								${taggingOfUserInstance?.user?.encodeAsHTML()}
							</g:link></span></li>
				</g:if>

			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${taggingOfUserInstance?.id}" />
					<%--<g:link class="list" action="list"><g:message code="default.button.list.label" default="Tags" /></g:link>
					--%>
					<g:link class="edit" action="edit"
						id="${taggingOfUserInstance?.id}">
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
