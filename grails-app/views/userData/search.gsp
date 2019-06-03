<%@ page contentType="text/html;charset=ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="userLayout" />
<title>Search</title>
<g:set var="entityName"
	value="${message(code: 'userData.label', default: 'UserData')}" />

<script type="text/javascript">
	function validateSearch() {
		$("#errorMessage").addClass('hideOnLoad')
		$("#errorMessage").text('')
		var userId = $("#userId").val().trim()
		var valid = false
		if (userId != '') {
			valid = true
		} else {
			$("#errorMessage").text("Data is required")
			$("#errorMessage").removeClass('hideOnLoad')
		}
		return valid
	}
</script>
</head>
<body>
	<div style="margin: 10px 10px 10px 20px;">
		<a href="../userData/advSearch"
			style="color: teal; font-weight: bold; float: right; margin-right: 40px">Advance
			Search</a>
		<h1>Search for Friends</h1>

		<g:form action="results">
			<table style="width: 40%">
				<tr>
					<td>User Id / Name :</td>
					<td>

						<div id="errorMessage" class="hideOnLoad errorMessage"></div> <g:textField
							name="userId" id="userId" />
					</td>
				</tr>
				<tr>
					<td><g:submitButton name="search" value="Search"
							onclick="if(!validateSearch()) return false" /></td>
				</tr>
			</table>

		</g:form>
		<br>
	</div>
</body>
</html>