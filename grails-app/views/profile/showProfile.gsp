
<%@ page import="com.getsocio.Profile"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="userLayout">
<g:set var="entityName"
	value="${message(code: 'profile.label', default: 'Profile')}" />
<title>Profile of ${profile?.fullName}</title>
</head>
<body>
	<a href="#show-profile" class="skip" tabindex="-1"><g:message
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
			<g:if test="${profile != null }">

				<g:if test="${profile?.fullName}">
					<li class="fieldcontain"><span id="fullName-label"
						class="property-label"><g:message
								code="profile.fullName.label" default="Full Name" /></span> <span
						class="property-value" aria-labelledby="fullName-label"> ${profile?.fullName }
					</span></li>
				</g:if>

				<g:if test="${profile?.bio}">
					<li class="fieldcontain"><span id="bio-label"
						class="property-label"><g:message
								code="profile.bio.label" default="Bio" /></span> <span
						class="property-value" aria-labelledby="bio-label"> ${profile?.bio }
					</span></li>
				</g:if>

				<g:if test="${profile?.homepage}">
					<li class="fieldcontain"><span id="homepage-label"
						class="property-label"><g:message
								code="profile.homepage.label" default="Homepage" /></span> <span
						class="property-value" aria-labelledby="homepage-label"> ${profile?.homepage }
					</span></li>
				</g:if>

				<g:if test="${profile?.country}">
					<li class="fieldcontain"><span id="country-label"
						class="property-label"><g:message
								code="profile.country.label" default="Country" /></span> <span
						class="property-value" aria-labelledby="country-label"> ${profile?.country }
					</span></li>
				</g:if>

				<g:if test="${profile?.timezone}">
					<li class="fieldcontain"><span id="timezone-label"
						class="property-label"><g:message
								code="profile.timezone.label" default="Timezone" /></span> <span
						class="property-value" aria-labelledby="timezone-label"> ${profile?.timezone }
					</span></li>
				</g:if>

				<g:if test="${profile?.email}">
					<li class="fieldcontain"><span id="email-label"
						class="property-label"><g:message
								code="profile.email.label" default="Email" /></span> <span
						class="property-value" aria-labelledby="email-label"> ${profile?.email }
					</span></li>
				</g:if>
			</g:if>
			<g:else>
			Profile Not Available
			</g:else>
		</ol>
		
		<g:form>
		<g:if test="${session.getAttribute('fullName') != profile.fullName }">
			<g:if test="${profile != null && isFollowing != true }">
				<div class="buttons">

					<g:link class="follow" action="followUser" controller="user"
						id="${profile?.id }" params="[follow:true]">
						<g:message code="default.button.list.label" default="Follow" />
					</g:link>
				</div>
			</g:if>
			<g:else>
			
			<div class="buttons">
			Following the User
			<g:link class="follow" action="followUser" controller="user"
						id="${profile?.id }"  params="[unFollow:true]">
						<g:message code="default.button.list.label" default="UnFollow" />
					</g:link>
					</div>
			</g:else>
			</g:if>
		</g:form>
	
	</div>
</body>
</html>
