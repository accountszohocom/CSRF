<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="apple-touch-icon" href="https://img.zohostatic.com/iam/m4004.31/images/apple-touch-icon.png">

</head>
<title>ZOHO Accounts</title>
	<style type="text/css">
	
			body {margin: 0px;padding:0px;font-family: "Open sans";font-weight: 300}
			h3 {margin:0px;font-size:14px;}
			.hide {display:none;}
			
	</style>
    <link href="https://css.zohostatic.com/iam/m4004.31/css/iam3login.css" rel="stylesheet">
	<body>
	<table width="100%" id="outertable" class="mobile-login" style="">
	     <tbody><tr valign="top">
		<td>
			<div class="logocolor mlogin"><span class="colorred"></span><span class="colorgreen"></span><span class="colorblue"></span><span class="coloryellow"></span></div>
		</td>
	    </tr>
	    <tr>
			<td align="center">
		</td>
		</tr>
		 <tr>
		     <td align="center">
					<div class="mobilelogo"></div>
		    		<div class="logo-top"></div>
		    		<form name="login" id="login" action="/login" onsubmit="" method="post" style="width: 500px;height: 100%;margin-left:-20px;" class="">
						<table width="100%" id="table">
						<tbody>
						<tr>
						<td> Email / Phone :</td>
						<td>
                          <input type="text" name="Emailid" id="Emailid" class="unauthinputText" placeholder="Email / Phone">
                      	</td>
                      	</tr>
                      <tr>
						<td> Current Password:</td>
						<td>
                          <input type="password" name="password" id="password" class="unauthinputText" onkeyup="animatePlaceHolder(this);if(event.keyCode == 13){checkIEAndSubmit(document.login);return false;}" placeholder="Current Password">
                     	</td>
                     	</tr>
                      <tr>
						<td> New Password:</td>
						<td>
                          <input type="password" name="newpassword" id="newpassword" class="unauthinputText"  onkeyup="animatePlaceHolder(this);if(event.keyCode == 13){checkIEAndSubmit(document.login);return false;}" placeholder="New Password">
                      </td>
                      </tr>
                      <tr>
						<td> Confirm Password:</td>
						<td>
                          <input type="password" name="confirmpassword" id="confirmpassword" class="unauthinputText" onkeyup="animatePlaceHolder(this);if(event.keyCode == 13){checkIEAndSubmit(document.login);return false;}" placeholder="Confirm Password">
                      </td>
                      </tr>
                      <tr>
                      <td>
							<input class="loginbut" type="button" value="Submit" onclick="Login()"> 
					  </td>                    
                      </tr>
                      </tbody>
                      </table>
                      </form>
              </td>
		  </tr>
		  </tbody>
		  </table>
		  <div id="response" style="visibility:hidden;">
		  </div> 
		  <script>
		  function Login()
		 	{
		 		xmlHttp=createXmlHttpRequest();
		 		var Email=document.getElementById("Emailid").value;
		 		var password=document.getElementById("password").value;
		 		var newPassword=document.getElementById("newpassword").value
		 		var confirmPassword=document.getElementById("confirmpassword").value
				xmlHttp.open("POST","loginaction.action",true);
		 		xmlHttp.onreadystatechange=handleStateChange;
		 		xmlHttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		 		//xmlHttp.send("Email="+Email+"Password="+password+"NewPassword="+newPassword+"ConfirmPassword="+confirmPassword);
		 		xmlHttp.send("Email="+Email);
		 
		 		//xmlHttp.send("Password="+password)
		 	}


		 	function createXmlHttpRequest()
		 	{

		 		if(window.ActiveXObject)
		 		{
		 			xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
		 		}
		 		else if(window.XMLHttpRequest)
		 		{
		 			xmlHttp=new XMLHttpRequest();
		 		}
		 		return xmlHttp;
		 	}
		 	function handleStateChange()
		 	{

		 		if(xmlHttp.readyState==4)
		 		{
		 		
		 			if(xmlHttp.status==200)
		 			{
	 					document.getElementById('outertable').style.visibility = "hidden"; 
						document.getElementById('table').style.visibility = "hidden"; 
	 					document.getElementById('response').style.visibility = "visible"; 
	 					document.getElementById('response').innerHTML = xmlHttp.responseText;
		 			}

		 			else
		 			{
		 					document.write("Error loading page"+xmlHttp.status+":"+xmlHttp.statusText);
		 			}

		 		}
		 	}
			</script>
	<script>
		 	function validate(){
		 	        var newPassword = document.getElementById("newpassword").value;
		 	        var confirmPassword = document.getElementById("confirmpassword").value;
		 	        if (newPassword != confirmPassword) {
		 	            alert("Passwords do not match.");
		 	            return false;
		 	        }
		 	        return true;
		 	        
		 	    }
		 	 
		 	</script>
</body>
</html>