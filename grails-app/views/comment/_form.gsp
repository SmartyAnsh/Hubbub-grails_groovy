<%@ page import="com.getsocio.Comment" %>

<div class="fieldcontain ${hasErrors(bean: commentByUserOnPostInstance, field: 'commentByUser', 'error')} required">
	<label for="commentByUser">
		<g:message code="commentByUserOnPost.commentByUser.label" default="Comment By User" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="commentByUser" required="" value="${commentByUserOnPostInstance?.commentByUser}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commentByUserOnPostInstance, field: 'byUser', 'error')} required">
	<label for="byUser">
		<g:message code="commentByUserOnPost.byUser.label" default="By User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="byUser" name="byUser.id" from="${com.getsocio.UserData.list()}" optionKey="id" required="" value="${commentByUserOnPostInstance?.byUser?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commentByUserOnPostInstance, field: 'onPost', 'error')} required">
	<label for="onPost">
		<g:message code="commentByUserOnPost.onPost.label" default="On Post" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="onPost" name="onPost.id" from="${com.getsocio.Post.list()}" optionKey="id" required="" value="${commentByUserOnPostInstance?.onPost?.id}" class="many-to-one"/>
</div>

