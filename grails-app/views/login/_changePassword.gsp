${isValid }

-----

${isChangedPassword }

<g:if test="${isValid == true  }">
	<tr>
		<td>New Password :</td>
		<td><g:passwordField name="newPassword" id="newPassword" /></td>
	</tr>
	<tr>
		<td>Confirm Password :</td>
		<td><g:passwordField name="confirmPassword" id="confirmPassword" />
		</td>
	</tr>
	<tr>
	<td>
	<g:actionSubmit name="changePassword" action="changePassword" value="Change Password" />
	
	</td>
	<td>
	<g:link controller="user" action="homePage" class="buttonLikeLink">Cancel</g:link>
	</td>
	</tr>
</g:if>
<g:elseif test="${isValid == false && isChangedPassword == true }">
	<div style="margin: 20px 20px 20px 20%">
		<span style="color: red">Wrong credentials</span> <br><br>
		<g:link action="homePage" controller="user">Click here</g:link>
		to go back to HomePage
	</div>
</g:elseif>
<g:if test="${isValid == false && isChangedPassword == false }">
<div style="margin: 20px 20px 20px 20%">
		<span style="color: red">Wrong credentials</span> <br><br>
		<g:link action="logout" controller="login">Click here</g:link>
		to go back to Login Page
	</div>

</g:if>