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

import springmvc.entities.Item;
import springmvc.entities.User;
import springmvc.service.ItemService;

@Controller
public class ItemController {
	
	@Autowired
	private ItemService itemService;;
	
	@RequestMapping("/admin/items")
	public String getItems(Model model) {
		
		List<Item> items = itemService.getAll();
		
		model.addAttribute("items", items);
		model.addAttribute("item", new Item());
		
		return "items";
	}
	
	@RequestMapping(value = "/admin/item", method = RequestMethod.POST)
	public String deleteItem(@RequestParam(value = "id")int id,
			ModelMap model) {
		
		itemService.delete(id);
		
		return "redirect:/admin/items";
		
	}
	
	@RequestMapping(value = "/admin/addItem", method = RequestMethod.POST)
	public String addItem(@ModelAttribute("item")Item item) {
		
		itemService.add(item);
		
		return "redirect:/admin/items";
		
	}
	
	@RequestMapping(value = "/admin/editItemForm", method = RequestMethod.GET)
	public String editUserForm(@RequestParam(value = "id")int id, 
			ModelMap model) {
		Item item = itemService.get(id);
		model.addAttribute("item", item);
		return "edititemform";
		
	}
	
	@RequestMapping(value = "/admin//editItem", method = RequestMethod.POST)
	public String editUser(@ModelAttribute("item")Item item,
			ModelMap model) {
		
		itemService.update(item);
		return "redirect:items";
	}
}
