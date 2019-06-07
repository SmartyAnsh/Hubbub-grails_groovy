<%@ page contentType="text/html;charset=ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="userLayout" />
<title>Advance Search</title>
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<script type="text/javascript">
	function validateSearch() {
		$('#errorMessage').addClass('hideOnLoad')
		$('#errorMessage').text('')
		var fullName = $('#fullName').val().trim()
		var email = $('#email').val().trim()
		var country = $('#country').val().trim()
		var valid = true
		if (fullName == '' && email == '' && country == '') {
			$('#errorMessage').text('Please fill atleast one search Criteria');
			$('#errorMessage').removeClass('hideOnLoad')
			valid= false
		}
		return valid
	}
</script>

</head>

<body>
	<div style="margin: 10px 10px 10px 20px">
		<div id="errorMessage" class="errorMessage hideOnLoad" style="font-size: 12px!important;"></div>
		<h1>Advance Search for Friends</h1>
		<g:form action="advResults">
			<table style="width: 30% !important;">
				<tbody>
					<tr>
						<td><label for="fullName">Name</label></td>
						<td><g:textField name="fullName" id="fullName" /></td>
					</tr>
					<tr>
						<td><label for="email">Email</label></td>
						<td><g:textField name="email" id="email" /></td>
					</tr>
					<tr>
						<td><label for="country">Country</label></td>
						<td><g:textField name="country" id="country" /></td>
					</tr>
					<tr>
						<td><label for="queryType">Query Type</label></td>
						<td><g:radio name="queryType" value="and" checked="checked"/>&nbsp;And&nbsp;&nbsp;<g:radio
								name="queryType" value="or" />&nbsp;Or &nbsp;&nbsp;<g:radio
								name="queryType" value="not" />&nbsp;Not</td>
					</tr>


				</tbody>

			</table>
			<span style="margin: 0 20px"><g:submitButton name="search"
					value="Search" onclick="if(!validateSearch()) return false" /></span>

		</g:form>
		
	</div>
</body>
</html>