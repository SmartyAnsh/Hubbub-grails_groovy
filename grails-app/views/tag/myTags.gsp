<%@page import="com.getsocio.User"%>
<%@ page contentType="text/html;charset=ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="userLayout" />
<title><g:if test="${user}">Tags of ${user.profile.fullName }
	</g:if> <g:else>No User with given Id</g:else></title>

</head>
<body>
	<div style="margin: 20px 20px 20px 20px">
		<g:form action="post">
			<g:if test="${user}">
				<%--<h1>
					<span style="text-decoration: underline;">Tags of
					${user.profile.fullName }</span>
				</h1>
				--%><g:if test="${flash.message }">
					<div style="color: blue; font-size: 13px">
						${flash.message }
					</div>
				</g:if>
				<g:hiddenField name="id" value="${user.profile.id }" />
				<div class="allTags">
					<g:if test="${!tags}">
						<span style="color:red;	">You are not tagged anywhere!</span>		
					</g:if>
					<g:else>
							<g:each in="${tags}" var="tag">
								<div style="margin: 10px 10px 10px 10px">
									<div class="tagName">
										<table>
											<thead>
												<tr>
													<td style="font-weight: bold;">Tag Name</td>
													<td style="font-weight: bold">Posts</td>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>
														${tag.name }
													</td>
													<td>
														${tag.posts.toString().substring(1,tag.posts.toString().size()-1) }
													</td>
												</tr>
											</tbody>
										</table>
		
									</div>
									<hr>
								</div>
							</g:each>
						</g:else>
						</div>
					</g:if>
					<g:else>
			No user with this Id
			</g:else>
		</g:form>
		<g:link action="create" controller="tag">Add Tags</g:link>
	</div>
</body>
</html>