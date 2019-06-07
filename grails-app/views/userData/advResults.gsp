<%@page import="com.getsocio.Profile"%>
<%@ page contentType="text/html;charset=ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="userLayout" />
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title>Advance Results</title>
</head>
<body>
	<div style="margin: 10px 10px 10px 20px">
	 <a href="user/search"
			style="color: teal; font-weight: bold;float: right;margin-right: 40px">Normal Search</a>
		<h1>Results</h1>
		<p>
			Searched
			${Profile.count()}
			records for items matching <em> ${term}
			</em>. <br> Found <strong> ${profiles.size()}
			</strong> hits.
			<br><br>
		</p>
		<ul style="margin: 0 20px">
			<g:each var="profile" in="${profiles}">
				<li><g:link controller="profile" action="showProfile"
						id="${profile.id }">
						${profile.fullName}
					</g:link></li>
			</g:each>
		</ul>
		<br>
		<br>
		<g:link action='advSearch' style="color:teal ;font-style: italic;font-weight:bold">Search Again</g:link>
	
	</div>
</body>
</html>