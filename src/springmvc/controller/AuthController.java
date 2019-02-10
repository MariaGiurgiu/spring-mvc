package springmvc.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import springmvc.entities.Item;
import springmvc.entities.User;
import springmvc.service.ItemService;
import springmvc.service.UserService;

@Controller
public class AuthController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm(Model model) {
		
		model.addAttribute("user", new User());
		return "loginform";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletResponse response, Model model) {
		
		Cookie cookie = new Cookie("name", "");
        cookie.setMaxAge(0);
        response.addCookie(cookie);
		return "redirect:loginForm";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(HttpServletResponse response, @ModelAttribute("user")User user,
			ModelMap model) {
		User userResult = userService.checkUserExists(user.getEmail(), user.getPassword());	
		if(userResult != null) {
			
			model.addAttribute("user", userResult);
			Cookie myCookie = new Cookie("name", String.valueOf(userResult.getId()));
			response.addCookie(myCookie);
			return new ModelAndView("home", "command", userResult);
		} else {
			return new ModelAndView("registerform", "command", null);


		}	
	}
	
	@RequestMapping(value = "/registerForm", method = RequestMethod.GET)
	public String registerForm(Model model) {
		model.addAttribute("user", new User());
		return "registerform";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String addStudent(@ModelAttribute("user")User user, 
			Model model) {
		
		model.addAttribute("user", user);
		userService.addUser(user);
		
		return "loginform";
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model) {
		
		UserService userService = new UserService();
		
		int userId = 0;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
		 for (Cookie cookie : cookies) {
		   if (cookie.getName().equals("name")) {
		     userId = Integer.valueOf(cookie.getValue());
		     break;
		    }
		  }
		}
		
		User userToSend = userService.get(userId);
		model.addAttribute("user", userToSend);
		
		return "home";
	}
}
