package springmvc.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Service;

import springmvc.HibernateConfig;
import springmvc.entities.Item;
import springmvc.entities.OrderItem;

@Service
public class OrderService {
	
	public int getLastId() {
		
		Session sessionObj = HibernateConfig.buildSessionFactory().openSession();
		
		
		List<Item> result = new ArrayList<>();

		try {
			sessionObj.beginTransaction();
			
			Query<Item> query = sessionObj.createQuery("from Item", Item.class);
			
			result = query.getResultList();

			sessionObj.getTransaction().commit();
			
		} catch (Exception sqlException) {
			if (null != sessionObj.getTransaction()) {
				sessionObj.getTransaction().rollback();
			}
			sqlException.printStackTrace();
		} finally {
			if (sessionObj != null) {
				sessionObj.close();
			}
		}
		
		if(result.size() > 0) {
			return result.get(result.size()-1).getId();
		}else {
			return 0;
		}
	}
	
	public void add(OrderItem orderItem) {
		Session sessionObj = HibernateConfig.buildSessionFactory().openSession();
		
		try {
			sessionObj.beginTransaction();
			sessionObj.save(orderItem);

			sessionObj.getTransaction().commit();
		} catch (Exception sqlException) {
			if (null != sessionObj.getTransaction()) {
				sessionObj.getTransaction().rollback();
			}
			sqlException.printStackTrace();
		} finally {
			if (sessionObj != null) {
				sessionObj.close();
			}
		}
	}
}
