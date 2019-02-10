package springmvc.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Service;

import springmvc.HibernateConfig;
import springmvc.entities.User;

@Service
public class UserService {

	public void addUser(User u) {
		
		Session sessionObj = HibernateConfig.buildSessionFactory().openSession();
	
		try {
			sessionObj.beginTransaction();
			sessionObj.save(u);

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
	
	public User checkUserExists(String email, String password) {
		Session sessionObj = HibernateConfig.buildSessionFactory().openSession();
		
		List<User> result = new ArrayList<>();
		try {
			sessionObj.beginTransaction();
			Query<User> query = sessionObj.createQuery("FROM User WHERE email = :email AND password = :password", User.class);
			query.setParameter("email", email);
			query.setParameter("password", password);
	
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
			return result.get(0);
		}else {
			return null;
		}
	}
	
	public List<User> getAll() {
		Session sessionObj = HibernateConfig.buildSessionFactory().openSession();
		List<User> result = new ArrayList<>();

		try {
			sessionObj.beginTransaction();
			
			Query<User> query = sessionObj.createQuery("from User", User.class);
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
			
			User user = sessionObj.get(User.class, id);
			
			sessionObj.delete(user);
			
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
	
	public void update(User user) {
		
		Session sessionObj = HibernateConfig.buildSessionFactory().openSession();
		try {
			sessionObj.beginTransaction();
			
			User u = (User) sessionObj.get(User.class, user.getId());
			u.setEmail(user.getEmail());
			u.setPassword(user.getPassword());
			u.setFirstName(user.getFirstName());
			u.setLastName(user.getLastName());
			u.setPhone(user.getPhone());

			sessionObj.save(u);

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
	
	public User get(int id) {
			
			User user = null;
			Session sessionObj = HibernateConfig.buildSessionFactory().openSession();
			try {
				sessionObj.beginTransaction();
				
				user = sessionObj.get(User.class, id);
								
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
			return user;
		}
}
