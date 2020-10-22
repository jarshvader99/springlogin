package com.jshdevco.springsecuritydemo.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PublicController 
{
	@RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) 
	{
        if (error != null)
            model.addAttribute("errorMsg", "Your username or password is incorrect.");

        if (logout != null)
            model.addAttribute("msg", "You have been logged out successfully.");

        return "login";
    }
	
	@RequestMapping(value="/custom-logout", method = RequestMethod.GET)
	public String customLogout(HttpServletRequest request, HttpServletResponse response, Model model) {
	    // Get the Spring Authentication object of the current request.
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	
	    // In case you are not filtering the users of this request url.
	    if (authentication != null){    
	        new SecurityContextLogoutHandler().logout(request, response, authentication); // <= This is the call you are looking for.
	    }
	    model.addAttribute("msg", "You have been logged out successfully.");
	    return "login";
	}
}