function checkValidate(formName) {
	var formName = formName;
	resetErrorMessage();
	$('#errorMessageDiv').html('');
	var validationArray = [];
	var isValid = true;
	var isError = false;
	if(formName == 'loginForm')
	{
		var fields = $('#loginForm').find("input[type='text'],input[type='password']");
	}
	else
	{
		var fields = $('#signUpForm').find("input[type='text'],input[type='password']");
	}

	var requiredFields = fields.filter(function() {
		return $(this).data('required') == true
	});
	requiredFields.each(function() {
		var $this = $(this);
		value = $this.val().replace(/^\s+|\s+$/g, '');
		if (!value || value == 'null' || value == '-1') {
			isValid = false;
			isError = true;
			var field = $this.prev();
			validationArray.push({
				field : field,
				error : 'Field is required'});
			field.removeClass('hideOnLoad');
			$this.addClass('error-field');
		}
	});
	if(isError)
	{
		isValid = false;
		var validationResponse = {isError:isError, fields:validationArray}
		$.each(validationResponse.fields, function(count, obj){			
			obj.field.text(obj.error).show();
		});	
	}
	return isValid;
}

function resetErrorMessage()
{
	var errorFields = $('form').find("input[class='error-field']");
	var errorMessages = $('form').find("div[class='errorMessage']");
	errorFields.each(function()
			{
		$(this).removeClass('error-field');
			}
	);
	errorMessages.each(function()
			{
		$(this).text("");
		$(this).addClass('hideOnLoad');
			}
	);
}

function checkPassword() {
	var pass = document.getElementById('signUpPassword').value;
	var confpass = document.getElementById('userConfirmPassword').value;
	var valid = false;
	if (pass != "" || confpass != "") {
		if (pass != confpass) {
			document.getElementById("alert").innerHTML = 'Please enter same value in both Password and Confirm Password';
			valid = false;
		} else {
			valid = true;
		}
	}
	return valid;
}

function checkValidateuserId()
{
	resetErrorMessage()
	$('#successMessage').text("");
	var userId = $('#userId').val()
	var valid = true;
	var contextPath = $("#contextPath").val()
	if(userId == '')
	{
		valid = false;
		$('#userId').prev().text('Field is required');
		$('#userId').prev().removeClass('hideOnLoad');
		$('#userId').addClass('error-field');
	}
	else
	{
		$.ajax({
			url : contextPath+"/UserData/checkUserIdAvailability",
			type : 'POST',
			data : {
				userId : userId
			},
			dataType : 'json',
			success : function(data)
			{
				if (data.isAvailable == true) 
				{
					$('#successMessage').text('User Id is Available')
					valid = true
				}

				else
				{				
					$('#errorMessage').text('User Id is Not Available');
					$('#errorMessage').removeClass('hideOnLoad');
					$('#userId').addClass('error-field');
					valid = false;
				}	
			}		
		});	
	}
	return valid;
}

function checkUserIdErrorMessage()
{
	var userIdErrorMessage = $('#errorMessage').text()
	var isValid = true
	if(userIdErrorMessage != '')
	{
		isValid = false;
	}
	return isValid;
}
function validateUserId()
{
	var userId = $('#userId').val()
	var valid = false;
	$.ajax({
		url : "../UserData/checkUserIdAvailability",
		type : 'POST',
		data : {
			userId : userId
		},
		dataType : 'json',
		success : function(data)
		{
			if (data.isAvailable == true) 
			{
				$('#successMessage').text('User Id is Available')
				valid = true
			}

			else
			{				
				$('#errorMessage').text('User Id is Not Available');
				$('#errorMessage').removeClass('hideOnLoad');
				$('#userId').addClass('error-field');
				valid = false;
			}	
		}		
	});	
	return valid;
}

function validateChangePassword(formName)
{
	var formName = formName;
	resetErrorMessage();
	$('#errorMessageDiv').html('');
	var validationArray = [];
	var isValid = true;
	var isError = false;
	if(formName == 'changePassword')
	{
		var fields = $('#changePassword').find("input[type='text'],input[type='password']");
	}
	else
	{
		var fields = $('#forgetPassword').find("input[type='text'],input[type='password']");
	}

	var requiredFields = fields.filter(function() {
		return $(this).data('required') == true
	});
	requiredFields.each(function() {
		var $this = $(this);
		value = $this.val().replace(/^\s+|\s+$/g, '');
		if (!value || value == 'null' || value == '-1') {
			isValid = false;
			isError = true;
			var field = $this.prev();
			validationArray.push({
				field : field,
				error : 'Field is required'});
			field.removeClass('hideOnLoad');
			$this.addClass('error-field');
		}
	});
	if(isError)
	{
		isValid = false;
		var validationResponse = {isError:isError, fields:validationArray}
		$.each(validationResponse.fields, function(count, obj){			
			obj.field.text(obj.error).show();
		});	
	}
	return isValid;
}