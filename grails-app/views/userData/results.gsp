<%@ page contentType="text/html;charset=ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="userLayout" />
<g:set var="entityName"
	value="${message(code: 'userData.label', default: 'UserData')}" />
<title>Results</title>
</head>
<body>
	<div style="margin: 10px 10px 10px 20px">
	<a href="../userData/advSearch"
			style="color: teal; font-weight:bold;float: right;margin-right: 40px">Advance Search</a>
		<h1>Results</h1>
		<p>
			Searched
			${com.getsocio.UserData.count()}
			records for items matching <em> ${term}
			</em>. <br> Found <strong> ${users.size()}
			</strong> hits. <br> <br>
		</p>
		<ul style="margin: 0 20px">
			<g:each var="user" in="${users}">
				<li><g:if test="${user?.profile?.fullName == null}">
						<g:link controller="userData" action="showProfile"
							controller="profile" id="${user?.profile?.id }">
							${user}
						</g:link>
					</g:if> <g:else>
						<g:link controller="userData" action="showProfile"
							controller="profile" id="${user?.profile?.id }">
							${user?.profile?.fullName}
						</g:link>     &nbsp;&nbsp; [${user.userId }]
						</g:else></li>
			</g:each>
		</ul>
		<br> <br>
		<g:link action='search' style="color:teal ;font-style: italic;font-weight:bold;">Search Again</g:link>
		
	</div>
</body>
</html>