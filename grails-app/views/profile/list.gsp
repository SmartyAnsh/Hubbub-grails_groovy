<%@page import="com.getsocio.Role"%>
<%@ page import="com.getsocio.Profile"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="userLayout">
<g:set var="entityName"
	value="${message(code: 'profile.label', default: 'Profile')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<g:if test="${session.getAttribute('role').equals(Role.ADMIN) }">
		<a href="#list-profile" class="skip" tabindex="-1"><g:message
				code="default.link.skip.label" default="Skip to content&hellip;" /></a>

		<div id="list-profile" class="content scaffold-list" role="main">
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

						<g:sortableColumn property="fullName"
							title="${message(code: 'profile.fullName.label', default: 'Full Name')}" />

						<g:sortableColumn property="bio"
							title="${message(code: 'profile.bio.label', default: 'Bio')}" />
						
						<g:sortableColumn property="dateOfBirth"
							title="${message(code: 'profile.dateOfBirth.label', default: 'Date of Birth')}" />
	
						<g:sortableColumn property="homepage"
							title="${message(code: 'profile.homepage.label', default: 'Homepage')}" />

						<g:sortableColumn property="photo"
							title="${message(code: 'profile.photo.label', default: 'Photo')}" />

						<g:sortableColumn property="country"
							title="${message(code: 'profile.country.label', default: 'Country')}" />

						<g:sortableColumn property="timezone"
							title="${message(code: 'profile.timezone.label', default: 'Timezone')}" />

					</tr>
				</thead>
				<tbody>
					<g:each in="${profileInstanceList}" status="i"
						var="profileInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

							<td><g:link action="show" id="${profileInstance.id}">
									${fieldValue(bean: profileInstance, field: "fullName")}
								</g:link></td>

							<td>
								${fieldValue(bean: profileInstance, field: "bio")}
							</td>

							<td>
							<g:formatDate format="dd-MMM-yyyy" date="${profileInstance?.dateOfBirth}"/>
							</td>
								
							<td>
								${fieldValue(bean: profileInstance, field: "homepage")}
							</td>

							<td><g:if test="${profileInstance.photo}">
									<img
										src="<g:createLink controller='image' action='renderImage' id='${profileInstance.id}' params="[profileListPage:true]"/>"
										style="width: 100px; height: 100px" />
								</g:if></td>

							<td>
								${fieldValue(bean: profileInstance, field: "country")}
							</td>

							<td>
								${fieldValue(bean: profileInstance, field: "timezone")}
							</td>

						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${profileInstanceTotal}" />
			</div>
		</div>
	</g:if>
	<g:if test="${session.getAttribute('role').equals(Role.USER) }">
		<div style="margin: 10px 10px 10px 20px">Sorry you do not have
			access to this page.</div>
	</g:if>
</body>
</html>
