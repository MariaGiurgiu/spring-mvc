package springmvc.entities;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="item")
public class Item {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="price")
	private BigDecimal price;
	
	@OneToMany(mappedBy="item", cascade={CascadeType.PERSIST, CascadeType.MERGE,
			CascadeType.DETACH, CascadeType.REFRESH })
	private List<OrderItem> orderItems;

	public Item() {}
	
	public Item(String name, BigDecimal price) {
		this.name = name;
		this.price = price;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	private List<OrderItem> getOrderItems(){
		return orderItems;
	}
	
	private void setOrderItems(List<OrderItem> ordersItems) {
		this.orderItems = orderItems;
	}

	public void add(OrderItem orderItem) {
		orderItems.add(orderItem);
		orderItem.setItem(this);
	}
	
	@Override
	public String toString() {
		return "Item [id=" + id + ", name=" + name + ", price=" + price + "]";
	}
	
	
	
	
	
}
