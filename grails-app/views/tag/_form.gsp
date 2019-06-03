<%@page import="com.getsocio.Profile"%>
<%@ page import="com.getsocio.Tag" %>



<div class="fieldcontain ${hasErrors(bean: taggingOfUserInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="taggingOfUser.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${taggingOfUserInstance?.name}"/>
</div>

<%--<div class="fieldcontain ${hasErrors(bean: taggingOfUserInstance, field: 'posts', 'error')} ">
	<label for="posts">
		<g:message code="tag.posts.label" default="Posts" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="post" name="post.id" from="${com.getsocio.Profile)}" optionKey="id" required="" value="${Post?.user?.id}" class="many-to-one"/>
</div>

--%><div class="fieldcontain ${hasErrors(bean: taggingOfUserInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="taggingOfUser.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="userFullName" name="userFullName" from="${com.getsocio.Profile.getAll()}" optionKey="id" required="" value="${taggingOfUserInstance?.user?.id}" class="many-to-one"/>
</div>

