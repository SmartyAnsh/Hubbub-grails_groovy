<%@ page import="com.getsocio.Profile"%>


<g:hiddenField id="isDOBEmpty" name="isDOBEmpty" value="${profileInstance?.dateOfBirth}" />
	
	
<div id="successMessage" class="successMessage"></div>
<div id="errorMessage" class="hideOnLoad errorMessage"></div>

<div
	class="fieldcontain ${hasErrors(bean: profileInstance, field: 'fullName', 'error')} ">
	<label for="fullName"> <g:message
			code="profile.fullName.label" default="Full Name" />

	</label>
	<g:textField name="fullName" value="${profileInstance?.fullName}"
		id="fullName" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: profileInstance, field: 'dateOfBirth', 'error')} ">
	<label for="dateOfBirth"> <g:message
			code="profile.dateOfBirth.label" default="Date Of Birth" />
	</label>
	<g:datePicker name="dateOfBirth" id="dateOfBirth"
		value="${profileInstance?.dateOfBirth}" noSelection="['':'-Choose-']"  precision="day"
		years="${1900..new Date().getYear().plus(1900)}" />
		
		<g:javascript>
		
		$( document ).ready(function() {
		if($("#isDOBEmpty").val()==''){
		  $("#dateOfBirth_day").val('');
		  $("#dateOfBirth_month").val('');
		  $("#dateOfBirth_year").val('');
		  }
		});
		
		</g:javascript>
</div>

<div
	class="fieldcontain ${hasErrors(bean: profileInstance, field: 'bio', 'error')} ">
	<label for="bio"> <g:message code="profile.bio.label"
			default="Bio" />

	</label>
	<g:textField name="bio" maxlength="100"
		value="${profileInstance?.bio}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: profileInstance, field: 'homepage', 'error')} ">
	<label for="homepage"> <g:message
			code="profile.homepage.label" default="Homepage" />

	</label>
	<g:field type="url" name="homepage"
		value="${profileInstance?.homepage}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: profileInstance, field: 'photo', 'error')} ">
	<label for="photo"> <g:message code="profile.photo.label"
			default="Photo" />

	</label>
	<g:if test="${profileInstance.photo}">

		<img
			src="<g:createLink controller='image' action='renderImage' id = "${profileInstance.fullName}" params="[fullNameParamId:true]"/>"
			style="width: 100px; height: 100px" id="profilePhoto" />
		<input class="linkLikeButton"
			onclick="if(!removeImage(${profileInstance.id})) return false"
			value="Remove Photo" type="button" id="removeImageButton">

		<%--
		<g:remoteLink action="removeImage" controller="Image"
			id="${profileInstance.fullName}" update="imageRemoved" onComplete="removeImage()" >Remove Photo</g:remoteLink>
	--%>
	</g:if>
	<input type="file" id="photo" name="photo" value="" />

</div>
<div
	class="fieldcontain ${hasErrors(bean: profileInstance, field: 'country', 'error')} ">
	<label for="country"> <g:message
			code="profile.country.label" default="Country" />

	</label>
	<g:textField name="country" value="${profileInstance?.country}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: profileInstance, field: 'timezone', 'error')} ">
	<label for="timezone"> <g:message
			code="profile.timezone.label" default="Timezone" />

	</label>
	<g:textField name="timezone" value="${profileInstance?.timezone}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: profileInstance, field: 'email', 'error')} ">
	<label for="email"> <g:message code="profile.email.label"
			default="Email" />

	</label>
	<g:field type="email" name="email"
		value="${profileInstance?.email}" />
</div>

