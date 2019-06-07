<%@page import="com.getsocio.Role"%>
<g:if test="${session.getAttribute("user")!=null }">
	<!doctype html>
	<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
	<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
	<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
	<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
	<!--[if (gt IE 9)|!(IE)]><!-->
	<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Welcome" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="${resource(dir: 'images', file: 'favicon.ico')}"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="114x114"
	href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="main.css"/>
    <asset:stylesheet src="mobile.css"/>
    <asset:stylesheet src="errors.css"/>
    <asset:javascript src="application.js"/>
    <asset:javascript src="homePage.js"/>
<g:layoutHead />
<r:layoutResources />
</head>
<body>
<div id="grailsLogo" role="banner">
	<span style="font-size: 20px;"><h1>Welcome to GetSocio - Social Networking on Grails</h1></span>
</div>
	<div class="nav" role="navigation">
		<g:if
			test="${session.getAttribute("role").equals(Role.ADMIN) && session.getAttribute("adminView") == true}">
			<ul>
				<li><g:link class="home" action="list" controller="userData">
						<g:message code="Home" />
					</g:link></li>
				<li><g:link class="profile" action="list"
						controller="profile">
						<g:message code="Profiles" />
					</g:link></li>
				<li><g:link class="post" action="list" controller="post">
						<g:message code="Posts" />
					</g:link></li>
				<li><g:link class="post" action="list"
						controller="comment">
						<g:message code="Comments" />
					</g:link></li>
				<li><g:link class="tag" action="list"
						controller="tag">
						<g:message code="Tags" />
					</g:link></li>
				<li><g:link class="search" action="search"
						controller="user">
						<g:message code="Search" />
					</g:link></li>
				<li><g:link class="view" action="viewChange"
						controller="User">
						<g:if test="${session.getAttribute('adminView') == true }">
					Change to User View
					</g:if>
						<g:else>
					Change to Admin View
					</g:else>
					</g:link></li>
					<li style="float: right; font-size: 13px"><g:link class="logout" action="logout"
						controller="login">
						<g:message code="Logout" />
					</g:link></li>
					<li style="float: right; font-size: 13px"><g:link class="changePassword" url="../login/renderChangePassword">
						<g:message code="Change Password" /></g:link>
					</li>
				

			</ul>

		</g:if>
		<g:if
			test="${session.getAttribute("role").equals(Role.USER) || session.getAttribute("adminView") == false}">
			<ul>
				<li><g:link class="home" action="homePage"
						controller="userData">
						<g:message code="Home" />
					</g:link></li>
				<li><g:link class="profile" action="userProfile"
						controller="profile">
						<g:message code="My Profile" />
					</g:link></li>
				<li><g:link class="post" action="timeline"
						controller="post">
						<g:message code="Timeline" />
					</g:link></li>
				<li><g:link class="tag" action="myTags"
						controller="tag">
						<g:message code="My Tags" />
					</g:link></li>
				<li><g:link class="search" action="search"
						controller="user">
						<g:message code="Search" />
					</g:link></li>
				<li><g:if test="${session.getAttribute('adminView') == true }">
						<g:link class="view" action="viewChange" controller="User">
					Change to User View
					</g:link>
					</g:if> <g:if test="${session.getAttribute('adminView') == false }">
						<g:link class="view" action="viewChange" controller="User">
					Change to Admin View
					</g:link>
					</g:if></li>
				<%--<li><g:link action="startChat" controller="Post">Chat</g:link></li>--%>
				<li style="float: right; font-size: 13px"><g:link class="logout" action="logout"
						controller="login">
						<g:message code="Logout" />
					</g:link></li>
				<li style="float: right; font-size: 13px"><g:link class="changePassword" url="../login/renderChangePassword">
						<g:message code="Change Password" /></g:link>
					</li>
				
			</ul>
		</g:if>

	</div>
	<g:layoutBody />
	<div class="footer" role="contentinfo"></div>
	<%--<div id="spinner" class="spinner" ><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		--%>
	<g:javascript library="application" />
	<r:layoutResources />
</body>
	</html>
</g:if>
<g:else>
	<%--<g:link href="../login/index">Click here to login again</g:link>
--%>
</g:else>