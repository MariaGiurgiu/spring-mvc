package springmvc.entities;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="orderItem")
public class OrderItem {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE,
						CascadeType.DETACH, CascadeType.REFRESH })
	@JoinColumn(name="order_id")
	private Order order;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE,
						CascadeType.DETACH, CascadeType.REFRESH })
	@JoinColumn(name="item_id")
	private Item item;
	
	@Column(name="quantity")
	private int quantity;
	
	public OrderItem() {}

	public OrderItem(Order order, Item item, int quantity) {
		super();
		this.order = order;
		this.item = item;
		this.quantity = quantity;
	}
	
	public int getId() {
		return this.id;
	}
	
	public void serId(int id) {
		 this.id = id;
	}
	
	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "OrderItem [id=" + id + ", order=" + order + ", item=" + item + ", quantity=" + quantity + "]";
	}

	
	
}
