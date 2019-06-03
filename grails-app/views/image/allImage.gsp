<%@ page import="com.getsocio.Profile"%>
<html>
<div style="width:auto;height:auto;">
		<g:each in="${com.getsocio.Profile.getAll()}">
			<g:if test="${it.photo.size() != 4358}">
				<img src="<g:createLink controller='image' action='renderImage' id="${it.id}" params="[profileShowPage:true]"/>"
				style="width: 150px; height: 150px" />
			</g:if>
		</g:each>
		
		
</div>

</html>