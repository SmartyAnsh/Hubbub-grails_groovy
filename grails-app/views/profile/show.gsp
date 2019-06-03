<%@page import="com.getsocio.Role"%>
<%@ page import="com.getsocio.Profile"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="userLayout">
<g:set var="entityName"
	value="${message(code: 'profile.label', default: 'Profile')}" />
<title>Profile of ${profileInstance?.fullName}</title>
</head>
<body>
	<%--<g:if test="${session.getAttribute('role').equals(Role.ADMIN) }">

		--%><a href="#show-profile" class="skip" tabindex="-1"><g:message
				code="default.link.skip.label" default="Skip to content&hellip;" /></a>

		<div id="show-profile" class="content scaffold-show" role="main">
			<h1>
				<g:message code="default.show.label" args="[entityName]" />
			</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>
			<ol class="property-list profile">

				<g:if test="${profileInstance?.fullName}">
					<li class="fieldcontain"><span id="fullName-label"
						class="property-label"><g:message
								code="profile.fullName.label" default="Full Name" /></span> <span
						class="property-value" aria-labelledby="fullName-label"><g:fieldValue
								bean="${profileInstance}" field="fullName" /></span></li>
				</g:if>
				
				<g:if test="${profileInstance?.dateOfBirth}">
					<li class="fieldcontain"><span id="bio-label"
						class="property-label"><g:message
								code="profile.dateOfBirth.label" default="Date Of Birth" /></span> <span
						class="property-value" aria-labelledby="dateOfBirth-label">
						<g:formatDate format="dd-MMM-yyyy" date="${profileInstance?.dateOfBirth}"/>
						<%--<g:fieldValue
								bean="${profileInstance}" field="dateOfBirth" />--%></span></li>
				</g:if>
	
				
				<g:if test="${profileInstance?.bio}">
					<li class="fieldcontain"><span id="bio-label"
						class="property-label"><g:message
								code="profile.bio.label" default="Bio" /></span> <span
						class="property-value" aria-labelledby="bio-label"><g:fieldValue
								bean="${profileInstance}" field="bio" /></span></li>
				</g:if>

				<g:if test="${profileInstance?.homepage}">
					<li class="fieldcontain"><span id="homepage-label"
						class="property-label"><g:message
								code="profile.homepage.label" default="Homepage" /></span> <span
						class="property-value" aria-labelledby="homepage-label"><g:fieldValue
								bean="${profileInstance}" field="homepage" /></span></li>
				</g:if>

				<g:if test="${profileInstance?.photo}">
					<li class="fieldcontain"><span id="photo-label"
						class="property-label"><g:message
								code="profile.photo.label" default="Photo" /></span> <span
						class="property-value" aria-labelledby="photo-label"> <g:if
								test="${profileInstance.photo}">
								<img
									src="<g:createLink controller='image' action='renderImage' id='${profileInstance.id}' params="[profileShowPage:true]"/>"
									style="width: 100px; height: 100px" />
							</g:if>
					</span></li>
				</g:if>

				<g:if test="${profileInstance?.country}">
					<li class="fieldcontain"><span id="country-label"
						class="property-label"><g:message
								code="profile.country.label" default="Country" /></span> <span
						class="property-value" aria-labelledby="country-label"><g:fieldValue
								bean="${profileInstance}" field="country" /></span></li>
				</g:if>

				<g:if test="${profileInstance?.timezone}">
					<li class="fieldcontain"><span id="timezone-label"
						class="property-label"><g:message
								code="profile.timezone.label" default="Timezone" /></span> <span
						class="property-value" aria-labelledby="timezone-label"><g:fieldValue
								bean="${profileInstance}" field="timezone" /></span></li>
				</g:if>

				<g:if test="${profileInstance?.email}">
					<li class="fieldcontain"><span id="email-label"
						class="property-label"><g:message
								code="profile.email.label" default="Email" /></span> <span
						class="property-value" aria-labelledby="email-label"><g:fieldValue
								bean="${profileInstance}" field="email" /></span></li>
				</g:if>

			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${profileInstance?.id}" />
					<g:link class="edit" action="edit"
						id="${profileInstance?.id}">
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>

				</fieldset>
			</g:form>
		</div>
	<%--</g:if>
	<g:if test="${session.getAttribute('role').equals(Role.USER) }">
		<div style="margin: 10px 10px 10px 20px">Sorry you do not have
			access to this page.</div>
	</g:if>
--%></body>
</html>
