package springmvc.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Service;

import springmvc.HibernateConfig;
import springmvc.entities.Item;
import springmvc.entities.User;

@Service
public class ItemService {
	
	public List<Item> getAll() {
		
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
			return result;
		}else {
			return null;
		}
	}
	
	public void delete(int id) {
		
		Session sessionObj = HibernateConfig.buildSessionFactory().openSession();
		try {
			sessionObj.beginTransaction();
			
			Item item = sessionObj.get(Item.class, id);
			
			sessionObj.delete(item);
			
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
	
	public void add(Item item) {
			
			Session sessionObj = HibernateConfig.buildSessionFactory().openSession();
		
			try {
				sessionObj.beginTransaction();
				
				sessionObj.save(item);
	
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
	
	public Item get(int id) {
		
		Item item = null;
		Session sessionObj = HibernateConfig.buildSessionFactory().openSession();
		try {
			sessionObj.beginTransaction();
			
			item = sessionObj.get(Item.class, id);
							
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
		return item;
	}
	
public void update(Item item) {
		
		Session sessionObj = HibernateConfig.buildSessionFactory().openSession();
		try {
			sessionObj.beginTransaction();
			
			Item i = (Item) sessionObj.get(Item.class, item.getId());
			i.setName(item.getName());
			i.setPrice(item.getPrice());
			

			sessionObj.save(i);

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
