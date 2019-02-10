package springmvc.controller;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import springmvc.entities.Item;
import springmvc.entities.Order;
import springmvc.entities.OrderItem;
import springmvc.entities.User;
import springmvc.service.ItemService;
import springmvc.service.OrderService;
import springmvc.service.UserService;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "/billing", method = RequestMethod.POST)
	public ModelAndView billing() {
		return new ModelAndView("tables");
	}
	
	@RequestMapping(value = "/tables", 
			params = {"table"},
			method = RequestMethod.GET)
	public String table(@RequestParam(value = "table")int table,
			ModelMap model) {
	
		Order order = new Order();
		order.setPlace(table);
		
		model.addAttribute("order", order);
		List<Item> items = new ArrayList<>();
		model.addAttribute("allItems", items);
		model.addAttribute("name", "Select Item");
		
		LocalDateTime localDateTime = LocalDateTime.now();
		order.setAt(localDateTime);
		order.setTotal(new BigDecimal(0));
		order.setId(orderService.getLastId() + 1);
		
		ItemService itemService = new ItemService();
		model.addAttribute("order", order);
		model.addAttribute("allItems", itemService.getAll());
		model.addAttribute("item", new Item());

		
		System.out.println(table);
		
		return "order";
	}
	
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String order(@ModelAttribute("order")Order order ,ModelMap model) {
		
		LocalDateTime localDateTime = LocalDateTime.now();
		order.setAt(localDateTime);
		order.setTotal(new BigDecimal(0));		
		ItemService itemService = new ItemService();
		model.addAttribute("order", order);
		model.addAttribute("allItems", itemService.getAll());
		model.addAttribute("item", new Item());
		
		List<OrderItem> orderItems = new ArrayList();
		model.addAttribute("orderItems", orderItems);

		System.out.println(order.getAt());
		return "order";
	}
	
	@RequestMapping(value = "/addItem", method = RequestMethod.POST)
	public String addItem(
			@ModelAttribute("item") Item itemReceived,
			HttpServletRequest request, 
			@RequestParam(value = "at")LocalDateTime at, 
			@RequestParam(value = "place")int place, 
			@RequestParam(value = "name")int itemId, 
			@RequestParam(value = "quantity") int quantity, ModelMap model) {
		
		UserService userService = new UserService();
		ItemService itemService = new ItemService();
		
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
		
		Item item = itemService.get(itemId);
		User user = userService.get(userId);
		Order order = new Order(at, user, place, BigDecimal.ZERO);
		user.add(order);
		
		
		OrderItem orderItem = new OrderItem(order, item, quantity);
		order.add(orderItem);
		
		model.addAttribute("orderItems", order.getOrderItems());
		
		return "ex";		
		
	}
}