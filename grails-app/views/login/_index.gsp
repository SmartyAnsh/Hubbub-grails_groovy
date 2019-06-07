<!doctype html>
<html>
<head>
<meta name="layout" content="main" />
<title>GetSocio</title>
<script type="text/javascript"
	src="${resource(dir:'js', file:'login.js') }"></script>
<style type="text/css" media="screen">
#status {
	background-color: #eee;
	border: .2em solid #fff;
	margin: 2em 2em 1em;
	padding: 1em;
	width: 12em;
	float: left;
	-moz-box-shadow: 0px 0px 1.25em #ccc;
	-webkit-box-shadow: 0px 0px 1.25em #ccc;
	box-shadow: 0px 0px 1.25em #ccc;
	-moz-border-radius: 0.6em;
	-webkit-border-radius: 0.6em;
	border-radius: 0.6em;
}

.ie6 #status {
	display: inline;
	/* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
}

#status ul {
	font-size: 0.9em;
	list-style-type: none;
	margin-bottom: 0.6em;
	padding: 0;
}

#status li {
	line-height: 1.3;
}

#status h1 {
	text-transform: uppercase;
	font-size: 1.1em;
	margin: 0 0 0.3em;
}

#page-body {
	margin: 2em 1em 1.25em 18em;
}

h2 {
	margin-top: 1em;
	margin-bottom: 0.3em;
	font-size: 1em;
}

p {
	line-height: 1.5;
	margin: 0.25em 0;
}

#controller-list ul {
	list-style-position: inside;
}

#controller-list li {
	line-height: 1.3;
	list-style-position: inside;
	margin: 0.25em 0;
}

@media screen and (max-width: 480px) {
	#status {
		display: none;
	}
	#page-body {
		margin: 0 1em 1em;
	}
	#page-body h1 {
		margin-top: 0;
	}
}
</style>
</head>
<body>
	<a href="#page-body" class="skip"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div id="status" role="complementary">
		<h1>Application Status</h1>
		<ul>
			<li>App version: <g:meta name="app.version" /></li>
			<li>Grails version: <g:meta name="app.grails.version" /></li>
			<li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
			<li>JVM version: ${System.getProperty('java.version')}</li>
			<li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>
			<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
			<li>Domains: ${grailsApplication.domainClasses.size()}</li>
			<li>Services: ${grailsApplication.serviceClasses.size()}</li>
			<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
		</ul>

	</div>
	<div id="page-body" role="main">
		<h1>Welcome to GetSocio - Social Networking on Grails</h1>
		<p>Congratulations, you have successfully started your first
			Grails application! At the moment this is the default page, feel free
			to modify it to either redirect to a controller or display whatever
			content you may choose. Below is a list of controllers that are
			currently deployed in this application, click on each to execute its
			default action:</p>

		<%--<div id="controller-list" role="navigation">
				<h2>Links:</h2>
				<ul>
			<li><g:link action="index" controller="user">User</g:link></li>
			<li><g:link action="index" controller="profile">Profile</g:link></li>
			<li><g:link action="index" controller="post">Post</g:link></li>
			<li><g:link action="index" controller="tag">Tag</g:link></li>
			</ul>
			</div>
		--%>
	</div>
	<div id="errorMessageDiv">
				<g:if test="${errorMessage }">
					<span style="color: red;"> ${errorMessage }
					</span>
				</g:if>
			</div>
	<g:form action="login" controller="login" id="loginForm">
		<div>
			<table style="width: 25% !important;">
				<tr>
					<td>Username :</td>
					<td><div class="hideOnLoad errorMessage"></div> <g:textField
							name="username" id="username" value="" data-required="true" /></td>
				</tr>
				<tr>
					<td>Password :</td>
					<td><div class="hideOnLoad errorMessage"></div> <g:passwordField
							name="password" id="password" value="" data-required="true" /></td>
				</tr>
				<tr>
					<td><g:submitButton name="login" value="login"
							onclick="if(!checkValidate(this)) return false;" /></td>
				</tr>
			</table>
		</div>

	</g:form>
</body>
</html>
