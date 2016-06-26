package com.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Models.Response;
import com.Models.User;

@Controller
public class UserController {
	
	//@ResponseBody
	@RequestMapping(value = "/",method=RequestMethod.GET)
	public String defaultMethod() {
		// to send text only to browser use @ResponseBody
		 return "index";		
}
	
	@RequestMapping(value = "/chkUser",method=RequestMethod.POST)
	public @ResponseBody Response chkUser(@RequestBody User objUser) {
		// to send text only to browser use @ResponseBody
		Response response=new Response();
		if(objUser.getUser().toString()=="sandesh" && objUser.getPassword()=="lamsal"){
			response.setMsg("sucess");
		    return response;
		}
		else{
			response.setMsg("fail");
		   return response;	
		}
}
	
	
}



