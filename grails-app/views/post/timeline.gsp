<%@page import="com.getsocio.UserData"%>
<%@ page contentType="text/html;charset=ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="userLayout" />
<title><g:if test="${user}">Timeline of ${user.profile.fullName }
	</g:if> <g:else>No User with given Id</g:else></title>

</head>
<body>
	<div style="margin: 20px 20px 20px 20px">
		<g:form action="post">
			<g:if test="${user}">
				<h1>
					Timeline for
					<span id="userName">
					${user.profile.fullName }</span>
				</h1>
				<g:if test="${flash.message }">
					<div style="color: blue; font-size: 13px">
						${flash.message }
					</div>
				</g:if>
				<g:hiddenField name="id" value="${user.profile.id }" />
				<h4>What is in my mind</h4>
				<g:textArea name="content" value=""
					style="width:600px;margin:10px 0 20px 0px" />
				<br>
				<g:submitButton name="Post" value="Post" />
				
				<div class="allPosts">
					<g:each in="${userPostsList}" var="post" status="index">
						<div style="margin: 10px 10px 10px 10px;">
							<span class="postContent"> ${post.content }
							</span>					<%--<span class="postDate"> ${post.dateCreated}</span> 
							--%><span style="float: right;"><g:link action="edit"
									controller="post" class="buttonLikeLink" id="${post.id }">Edit</g:link></span>
							<br>
							<div style="color: gray; font-style: italic;" title=" ${post.dateCreated}">
								${postTimeList.getAt(index) }
							</div>
							<input class="linkLikeButton"
								onclick="fetchCommentsOnTimeLine(this);" value="Comments"
								type="button" id="seeComments">
							<div class="commentOnTimeline hideOnLoad" id="commentDiv"></div>
							<div id="spinner" class="hideOnLoad"><img src="../images/spinner.gif" ></div>
						</div>
						<hr>

					</g:each>
				</div>
			</g:if>
			<g:else>
	No user with this Id
	</g:else>
		</g:form>
	</div>
</body>
</html>