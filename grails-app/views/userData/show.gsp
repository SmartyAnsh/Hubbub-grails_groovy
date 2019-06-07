<%@page import="com.getsocio.Role"%>
<%@ page import="com.getsocio.User"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="userLayout">
<g:set var="entityName"
	value="${message(code: 'userData.label', default: 'User')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<g:if test="${session.getAttribute('role').equals(Role.ADMIN) }">

		<a href="#show-userData" class="skip" tabindex="-1"><g:message
				code="default.link.skip.label" default="Skip to content&hellip;" /></a>
		<div id="show-userData" class="content scaffold-show" role="main">
			<h1>
				<g:message code="default.show.label" args="[entityName]" />
			</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>
			<ol class="property-list userData">

				<g:if test="${userDataInstance?.userId}">
					<li class="fieldcontain"><span id="userId-label"
						class="property-label"><g:message
								code="userData.userId.label" default="User Id" /></span> <span
						class="property-value" aria-labelledby="userId-label"><g:fieldValue
								bean="${userDataInstance}" field="userId" /></span></li>
				</g:if>

				<g:if test="${userDataInstance?.password}">
					<li class="fieldcontain"><span id="password-label"
						class="property-label"><g:message
								code="userData.password.label" default="Password" /></span> <span
						class="property-value" aria-labelledby="password-label"><g:fieldValue
								bean="${userDataInstance}" field="password" /></span></li>
				</g:if>

				<g:if test="${userDataInstance?.homepage}">
					<li class="fieldcontain"><span id="homepage-label"
						class="property-label"><g:message
								code="userData.homepage.label" default="Homepage" /></span> <span
						class="property-value" aria-labelledby="homepage-label"><g:fieldValue
								bean="${userDataInstance}" field="homepage" /></span></li>
				</g:if>
				<g:if test="${userDataInstance?.role}">
					<li class="fieldcontain"><span id="role-label"
						class="property-label"><g:message
								code="userData.role.label" default="Role" /></span> <span
						class="property-value" aria-labelledby="role-label"><g:fieldValue
								bean="${userDataInstance}" field="role" /></span></li>
				</g:if>

				<g:if test="${userDataInstance?.profile}">
					<li class="fieldcontain"><span id="profile-label"
						class="property-label"><g:message
								code="userData.profile.label" default="Profile" /></span> <span
						class="property-value" aria-labelledby="profile-label"><g:link
								controller="profile" action="show"
								id="${userDataInstance?.profile?.id}">
								${userDataInstance?.profile?.encodeAsHTML()}
							</g:link></span></li>
				</g:if>

				<g:if test="${userDataInstance?.dateCreated}">
					<li class="fieldcontain"><span id="dateCreated-label"
						class="property-label"><g:message
								code="userData.dateCreated.label" default="Date Created" /></span> <span
						class="property-value" aria-labelledby="dateCreated-label"><g:formatDate
								date="${userDataInstance?.dateCreated}" /></span></li>
				</g:if>

				<g:if test="${userDataInstance?.following}">
					<li class="fieldcontain"><span id="following-label"
						class="property-label"><g:message
								code="userData.following.label" default="Following" /></span> <g:each
							in="${userDataInstance.following}" var="f">
							<span class="property-value" aria-labelledby="following-label"><g:link
									controller="userData" action="show" id="${f.id}">
									${f?.encodeAsHTML()}
								</g:link></span>
						</g:each></li>
				</g:if>

				<g:if test="${userDataInstance?.posts}">
					<li class="fieldcontain"><span id="posts-label"
						class="property-label"><g:message
								code="userData.posts.label" default="Posts" /></span> <g:each
							in="${userDataInstance.posts}" var="p">
							<span class="property-value" aria-labelledby="posts-label"><g:link
									controller="post" action="show" id="${p.id}">
									${p?.encodeAsHTML()}
								</g:link></span>
						</g:each></li>
				</g:if>

				<g:if test="${userDataInstance?.tags}">
					<li class="fieldcontain"><span id="tags-label"
						class="property-label"><g:message
								code="userData.tags.label" default="Tags" /></span> <g:each
							in="${userDataInstance.tags}" var="t">
							<span class="property-value" aria-labelledby="tags-label"><g:link
                                    controller="tag" action="show" id="${t.id}">
									${t?.encodeAsHTML()}
								</g:link></span>
						</g:each></li>
				</g:if>

			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${userDataInstance?.id}" />
					<g:link class="list" action="list">
						<g:message code="default.button.list.label" default="Users" />
					</g:link>
					<g:link class="edit" action="edit" id="${userDataInstance?.id}">
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
