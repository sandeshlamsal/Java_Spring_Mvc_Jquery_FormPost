<html>
<head>
<title></title>
<script type="text/javascript">

function frmsubmitJquery(){
	
	$(document).ready(function(){
		$('#frmuser').on('submit',function(event){
			event.preventDefault();
			data=JSON.stringify(serializeObject($('#frmuser')));
			$.ajax({
			url:'/SpringMvcJqueryFormPost/chkUser/',
			type:'POST',
			dataType:"json",
			contentType:'application/json',
			success: function(message){
			console.log(message);
			if(message.msg=='sucess'){
				alert("The validation pass");
			}
			else{
			alert("The validation failed");
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
<h2>Hello World!</h2>

<div id="user">

<form id="frmuser" name="frmuser" method="post">
User :: <input type="text" id="txtuser" name="txtuser">

<br><br>
Password ::
<input type="password" id="txtpassword" name="txtpassword">
 
<input type="submit" name="submit" onClick="frmsubmitJquery">
</form>
</div>
</body>
</html>
