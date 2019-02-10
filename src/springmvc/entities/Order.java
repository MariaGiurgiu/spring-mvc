package springmvc.entities;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="order")
public class Order {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="at")
	private LocalDateTime at;
	
	@Column(name="place")
	private  int place;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE,
						CascadeType.DETACH, CascadeType.REFRESH })
	@JoinColumn(name="user_id")
	private User user;
	
	@Column(name="total")
	private BigDecimal total;
	
	@OneToMany(mappedBy="order", cascade={CascadeType.PERSIST, CascadeType.MERGE,
			CascadeType.DETACH, CascadeType.REFRESH })
	private List<OrderItem> orderItems;

	public Order() {}
	
	public Order(LocalDateTime at, User user, int place, BigDecimal total) {
		this.at = at;
		this.user = user;
		this.place = place;
		this.total = total;
	}
	
	public int getId() {
		return this.id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public LocalDateTime getAt() {
		return at;
	}

	public void setAt(LocalDateTime at) {
		this.at = at;
	}

	public int getPlace() {
		return place;
	}

	public void setPlace(int place) {
		this.place = place;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	
	public List<OrderItem> getOrderItems(){
		return orderItems;
	}
	
	public void setOrderItems(List<OrderItem> ordersItems) {
		this.orderItems = orderItems;
	}

	public void add(OrderItem orderItem) {
		orderItems.add(orderItem);
		orderItem.setOrder(this);
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", at=" + at + ", place=" + place + ", user=" + user + ", total=" + total
				+ ", orderItems=" + orderItems + "]";
	}

	
	
	
	
	
	
	
}
