<%@page import="com.getsocio.Role"%>
<%@ page import="com.getsocio.User" %>



<div class="fieldcontain ${hasErrors(bean: userDataInstance, field: 'userId', 'error')} ">
	<label for="userId">
		<g:message code="userData.userId.label" default="User Id" />
		
	</label>
	<g:textField name="userId" maxlength="20" value="${userDataInstance?.userId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userDataInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="userData.password.label" default="Password" />
		
	</label>
	<g:passwordField name="password" maxlength="8" value="${userDataInstance?.password}" id="password"/>
</div>
<div class="fieldcontain ${hasErrors(bean: userDataInstance, field: 'password', 'error')} ">
	<label for="confirmPassword">
		<g:message code="userData.password.label" default="Confirm Password" />
		
	</label>
	<g:passwordField name="confirmPassword" maxlength="8" value="" id="confirmPassword"/>
	
</div>

<div class="fieldcontain ${hasErrors(bean: userDataInstance, field: 'homepage', 'error')} ">
	<label for="homepage">
		<g:message code="userData.homepage.label" default="Homepage" />
		
	</label>
	<g:field type="url" name="homepage" value="${userDataInstance?.homepage}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: userDataInstance, field: 'role', 'error')} ">
	<label for="homepage">
		<g:message code="userData.role.label" default="Role" />
		
	</label>
	<g:select id="role" name="role" from="${Role}" value="${userDataInstance?.role}" noSelection="['null': '']"/>
</div>
<div class="fieldcontain ${hasErrors(bean: userDataInstance, field: 'profile', 'error')} ">
	<label for="profile">
		<g:message code="userData.profile.label" default="Profile" />
		
	</label>
	<g:select id="profile" name="profile.id" from="${com.getsocio.Profile.list()}" optionKey="id" value="${userDataInstance?.profile?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userDataInstance, field: 'following', 'error')} ">
	<label for="following">
		<g:message code="userData.following.label" default="Following" />
		
	</label>
	<g:select name="following" from="${com.getsocio.User.list()}" multiple="multiple" optionKey="id" size="5" value="${userDataInstance?.following*.id}" class="many-to-many" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userDataInstance, field: 'posts', 'error')} ">
	<label for="posts">
		<g:message code="userData.posts.label" default="Posts" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userDataInstance?.posts?}" var="p">
    <li><g:link controller="post" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="post" action="create" params="['userData.id': userDataInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'post.label', default: 'Post')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: userDataInstance, field: 'tags', 'error')} ">
	<label for="tags">
		<g:message code="userData.tags.label" default="Tags" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userDataInstance?.tags?}" var="t">
    <li><g:link controller="tag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="tag" action="create" params="['userData.id': userDataInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'tag.label', default: 'Tag')])}</g:link>
</li>
</ul>

</div>

