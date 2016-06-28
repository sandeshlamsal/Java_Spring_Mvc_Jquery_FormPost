<html>
<head>
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<script type="text/javascript">

function frmsubmitJquery(){
	
	$(document).ready(function(){
		$('#frmuser').on('submit',function(event){
			console.log("The form submit button clicked.")
			
			event.preventDefault();
			var jsn = serializeObject($('#frmuser'));
			console.log("json is"+ jsn);
			
			var data=JSON.stringify(jsn);
			console.log("data is"+data);
			// hello are you there??
			$.ajax({
				url:'/SpringMvcJqueryFormPost/chkUser/',
				type:'POST',
				data: data,
				dataType:"json",
				contentType:'application/json',
				success: function(message){
					console.log(message);
					if(message.msg=='sucess'){
						console.log("The validation pass");
						alert("User and Password Matched");
						$("#msg").text("password matched");
						
					}
				else{
					console.log("The validation failed");
					alert("User and Password Failed");
					$("#msg").text("password Mis-Matched");
				}
			},  //sucess
			
			error: function(err){
				console.log(err);
				alert('error in request'+err);
			}//error
			
		});//ajax
		
	});

	
function serializeObject(form){
	var jsonObject={};
	var a=form.serializeArray();
	$.each(a,function(){
		if(jsonObject[this.name]!=undefined){
			if(!jsonObject[this.name].push){
				jsonObject[this.name]=[jsonObject[this.name]];
			}
			jsonObject[this.name].push(this.value||'');
		}else
			{
			jsonObject[this.name]=this.value||'';
			}
	});
	return jsonObject;
};
});

}//end of function	
</script>
</head>
<body>
<h2 id="msg">Hello World!</h2>

<div id="user">

<form id="frmuser" name="frmuser" method="post">
	User :: <input type="text" value="abc" id="user" name="user">
	
	<br><br>
	Password ::
	<input type="password" id="password" value="def" name="password">
	 <br/>
	<input type="submit" value="submit" onclick="frmsubmitJquery()"/>
	
</form>
</div>
</body>
</html>
