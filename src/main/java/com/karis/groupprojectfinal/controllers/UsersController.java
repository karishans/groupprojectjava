package com.karis.groupprojectfinal.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.karis.groupprojectfinal.models.Prices;
import com.karis.groupprojectfinal.models.StringArrayFunctions;
import com.karis.groupprojectfinal.models.User;
import com.karis.groupprojectfinal.services.UserService;
import com.karis.groupprojectfinal.validators.UserValidation;





@Controller
public class UsersController
{
	
	@Autowired
    private UserService userService;
	@Autowired
	private UserValidation validation;



	@RequestMapping("/")
	public String registerForm(@ModelAttribute("user") User user) {
	    return "main.jsp";
	}

	@RequestMapping("/home")
	public String home(Model model, HttpSession session)
	{
		if (session.getAttribute("user_id") == null)
		{
			return "redirect:/";
		}
		long user_id = (Long) session.getAttribute("user_id");
		User usr = userService.findUserById(user_id);
		
		model.addAttribute("user", usr);

		
		return "home.jsp";
	}
	
	@RequestMapping(value="/registering", method=RequestMethod.POST)
	public String registerUser(@Valid @ModelAttribute("user") User user,
								BindingResult result, HttpSession session)
	{
		validation.validate(user, result);
		if(result.hasErrors())
		{
			return "main.jsp";
		}
		
		
		User newUser = this.userService.registerUser(user);
		session.setAttribute("user_id", newUser.getId());
		return "redirect:/home";
	}
	
	
    @RequestMapping(value="/loggingIn", method=RequestMethod.POST)
    public String loginUser(@RequestParam("email") String email,
    					@RequestParam("password") String password,
    					Model model,
    					HttpSession session,
    					RedirectAttributes redirectAttr) {
    	if(!this.userService.authenticateUser(email, password))
    	{
    		redirectAttr.addFlashAttribute("loginError", "Invalid Credentials!");
    		return "redirect:/";
    		
    	}
    	User this_user = this.userService.findByEmail(email);
  	  	session.setAttribute("user_id", this_user.getId());
  	  	return "redirect:/home";
    }

    
	@RequestMapping(value="/edit/user")
	public String editComment(Model model, 
	  						HttpSession session)
	{
		if (session.getAttribute("user_id") == null)
		{
			return "redirect:/";
		}
		Long user_id = (Long)session.getAttribute("user_id");
		User usr = this.userService.findUserById(user_id);
		model.addAttribute("user", usr);
		return "edituser.jsp";
	}
	@RequestMapping(value="/editing/user/{id}", method=RequestMethod.POST)
	public String editingComment(@Valid @ModelAttribute("user") User user,
	  							BindingResult result,
	  							@PathVariable("id") Long userId,
	  							HttpSession session,
	  							Model model)
	{
		if (session.getAttribute("user_id") == null)
		{
			return "redirect:/";
		}
		Long user_id = (Long)session.getAttribute("user_id");
		User usr = this.userService.findUserById(user_id);
		System.out.println("usr email: "+usr.getEmail()+" user email: "+user.getEmail());
		

		if ((usr.getEmail().equals(user.getEmail())))
		{
			validation.editValidate(false, user, result);
		}
		else
		{
			validation.editValidate(true, user, result);
		}
		
        if (result.hasErrors())
        {
            return "edituser.jsp";
        }
        else
        {
//        	System.out.println("usr pw: "+usr.getPassword());
//        	System.out.println("user pw: "+user.getPassword());
//        	System.out.println("user pwc: "+user.getPasswordConfirmation());
//        	System.out.println("BCrypt: "+BCrypt.checkpw(user.getPassword(), usr.getPassword()));
    		if ( (usr.getPassword().equals(user.getPassword())) && 
    				(user.getPassword().equals(user.getPasswordConfirmation())) )
			{
    			this.userService.save(user);
        		return "redirect:/home";
    		}
			this.userService.registerUser(user);
    		return "redirect:/home";
        }
	}
	  

  @RequestMapping("/logout")
  public String logout(HttpSession session)
  {
		if (session.getAttribute("user_id") == null)
		{
			return "redirect:/";
		}
	  	session.invalidate();
	  	return "redirect:/";
  }

	
	
}