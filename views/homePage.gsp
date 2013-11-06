<%@page import="hubbub.Role"%>
<%@ page import="hubbub.ProfileOfUser"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="userLayout">
<g:set var="entityName"
	value="${message(code: 'profileOfUser.label', default: 'ProfileOfUser')}" />
<title>HomePage of ${userName?.profile?.fullName}</title>
<script type="text/javascript"
	src="${resource(dir:'js', file:'homePage.js') }"></script>
</head>
<body>
	<a href="#show-profileOfUser" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div id="show-profileOfUser" class="content scaffold-show" role="main">
		<%--<div
			style="width: 40% !important; float: left; margin: 10px 10px 10px 20px; border: 2px solid lightgray;position: fixed;">
			--%>
		<div
			style="width: 40% !important; float: left; margin: 10px 10px 10px 20px; border: 2px solid lightgray;">
			<div>
				<h1>
					<g:if test="${fromWall==true }">
						${userName?.profile?.fullName}'s Details
				</g:if>
					<g:else>
						<g:message code="My Details" />
					</g:else>
				</h1>
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>

				<div class="userDetails" style="width: 50%; float: left"
					id="userDetails">
					<g:if test="${userName?.profile?.fullName !=null}">
						<span class="userName">
							${userName?.profile?.fullName}
						</span>
					</g:if>
					<br>
					<g:if test="${userName?.profile?.country !=null}">
						${userName?.profile?.country}
					</g:if>
					<br>
					<g:if test="${userName?.profile?.email !=null}">
						${userName?.profile?.email}
					</g:if>
				</div>
				<div style="width: 44%; float: right;">
					<g:if test="${userName?.profile?.photo}">
						<img src="<g:createLink controller='image' action='renderImage'/>"
							style="width: 100px; height: 100px" />
					</g:if>
				</div>
				<br>
			</div>
			<div>
				<br>
				<div style="margin-top: 70px">
					<h1>
						<g:if test="${fromWall==true }">
							${userName?.profile?.fullName} Follow
				</g:if>
						<g:else>
							<g:message code="I Follow" />
						</g:else>

					</h1>
				</div>
				<div class="followers"
					style="height: 80px; overflow: auto; width: 90%">
					<g:if test="${followingNames != null }">
						<g:each in="${followingNames}" var="name">

							<g:if test="${name?.profile?.fullName != null }">
								<g:link action="showProfile" controller="profileOfUser"
									params="[name:name?.profile?.fullName]">
									<span style="color: gray" onmouseout="hideProfileOfUser(this)"
										onmouseover="showProfileOfUser(this)" title="Check Profile"> ${name?.profile?.fullName }
									</span>
								</g:link>
								<br>
							</g:if>

							<g:else>
								${name}<br>
							</g:else>
						</g:each>
					</g:if>
				</div>
			</div>
			<div>
				<h1>
					<g:if test="${fromWall==true }">
						${userName?.profile?.fullName}'s Followers
				</g:if>
					<g:else>
						<g:message code="My Followers" />
					</g:else>
				</h1>
				<div class="followers"
					style="height: 80px; overflow: auto; width: 90%">
					<g:if test="${followers != null }">
						<g:each in="${followers}" var="follower">
							<g:if test="${follower?.profile?.fullName != null }">
								${follower?.profile?.fullName }<br>
							</g:if>
							<g:else>
								${follower}<br>
							</g:else>

						</g:each>
					</g:if>
				</div>
			</div>
		</div>
		<div>

			<div
				style="width: 40% !important; margin: 10px 10px 10px 20px; float: right; height: 440px; overflow: auto">
				<h1>
					<g:if test="${fromWall==true }">
						${userName?.profile?.fullName}'s Wall
				</g:if>
					<g:else>
						<g:message code="My Wall" />
					</g:else>
				</h1>
				<div style="margin: 10px 10px 10px 30px;">
					<g:if test="${postsList != null }">

						<g:each in="${postsList}" var="postName" status="index">
							<div style="float: left; width: 15%">
								<g:if test="${postUser.getAt(index)!="Me"}">
									<img
										src="<g:createLink controller='image' action='renderImage' id='${postUser.getAt(index)}'/>"
										style="width: 50px; height: 50px" id="profilePhoto" />
								</g:if>
								<g:else>
									<img
										src="<g:createLink controller='image' action='renderImage' id='${userName?.profile?.fullName}'/>"
										style="width: 50px; height: 50px" id="profilePhoto" />
								</g:else>
							</div>

							<div style="float: left; width: 85%" id="postDataDiv">
								<span class="postName"> ${postName }
								</span><br>
								<g:if test="${postUser.getAt(index) != "Me"}">
									<g:link action="homePage" controller="userData"
										params="[name:postUser.getAt(index)]">
										<span style="color: gray; font-style: italic;"
											class="userName" onmouseover="showProfileOfUser(this)" title="Check Wall"
											onmouseout="hideProfileOfUser(this)"> ${postUser.getAt(index) }
										</span>
									</g:link>
								</g:if>
								<g:else>
									<span style="color: gray; font-style: italic;"> ${postUser.getAt(index) }
									</span>
								</g:else>
								<br> <span
									style="color: red; font-style: italic; font-size: small;" title="${postName.dateCreated }">
									${postTimeList.getAt(index) }
								</span> <br> <input class="linkLikeButton"
									onclick="fetchComments(this);" value="Comments" type="button" title="Check Comments"
									id="seeComments">
								<%--<input class="linkLikeButton"
									onclick="enableComment(this);" value="Comment"
									type="button" id="enableComment">
								--%>
								<div class="comment hideOnLoad" id="commentDiv"></div>
								<div id="spinner" class="hideOnLoad spinnerClass">
									<img src="../images/spinner.gif">
								</div>
							</div>
							<div style="float: left; width: 100%;">
								<br>
								<hr width="60%" color="teal">
								<br>
							</div>
						</g:each>
					</g:if>
				</div>
			</div>
		</div>

	</div>
</body>
</html>
