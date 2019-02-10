package springmvc.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import springmvc.entities.User;
import springmvc.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/admin/users", method = RequestMethod.GET)
	public String admin(Model model) {
		List<User> users = userService.getAll();
		
		model.addAttribute("users", users);
		return "users";
	}
	
	
	@RequestMapping(value = "/admin/user", method = RequestMethod.POST)
	public String deleteUser(@RequestParam(value = "id")int id,
			ModelMap model) {
		
		userService.delete(id);
		
		return "redirect:users";
		
	}
	
	@RequestMapping(value = "/admin/editUserForm", method = RequestMethod.GET)
	public String editUserForm(@RequestParam(value = "id")int id, 
			ModelMap model) {
		User user = userService.get(id);
		model.addAttribute("user", user);
		return "edituserform";
		
	}
	
	@RequestMapping(value = "/admin//editUser", method = RequestMethod.POST)
	public String editUser(@ModelAttribute("user")User user,
			ModelMap model) {
		
		userService.update(user);
		return "redirect:users";
	}
	
	
}
