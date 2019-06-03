<ul>
	<li><a class="home" href="${createLink(uri: '/')}"><g:message
				code="default.home.label" /></a></li>
	<li><g:link class="create" action="create">
			<g:message code="default.new.label" args="[entityName]" />
		</g:link></li>
	<li><g:link class="search" action="search">
			<g:message code="Search" />
		</g:link></li>
	<li><g:link class="post" action="myPost" controller="post">
			<g:message code="default.new.label" args="My Post" />
		</g:link></li>
</ul>