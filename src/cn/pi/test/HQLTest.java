package cn.pi.test;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.pi.model.User;
import cn.pi.service.UserService;
import cn.pi.utils.HibernateUtils;

public class HQLTest {
	/**
	 * 使用Query查询全部
	 */
	@Test
	public void findAll_hqlTest() {
		// 1.得到一个Session
		Session session = HibernateUtils.getSession();
		// 开启事务
		session.beginTransaction();
		// 2.编写HQL
		String hql = "from User";//User代表的是类
		// 3.调用session.createQuery 创建查询对象
		Query query = session.createQuery(hql); 
		// 4.使用query.list()方法查询数据，并将数据放入一个list集合
		List<User> list = query.list();
		for(User c : list){ //循环输出集合中的数据
			System.out.println(c);
		}
		// 提交事务
		session.getTransaction().commit();
		// 关闭资源
		session.close();
	}
	@Test
	public void test01(){
		User user = new User();
		user.setUserName("hlk1135");
		user.setPassword("123456");
		String xmlpath = "applicationContext.xml";
		ApplicationContext applicationContext=new ClassPathXmlApplicationContext(xmlpath);
		UserService userService=applicationContext.getBean("userService",UserService.class);
		userService.loginUser(user);
	}
}
