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
	 * ʹ��Query��ѯȫ��
	 */
	@Test
	public void findAll_hqlTest() {
		// 1.�õ�һ��Session
		Session session = HibernateUtils.getSession();
		// ��������
		session.beginTransaction();
		// 2.��дHQL
		String hql = "from User";//User���������
		// 3.����session.createQuery ������ѯ����
		Query query = session.createQuery(hql); 
		// 4.ʹ��query.list()������ѯ���ݣ��������ݷ���һ��list����
		List<User> list = query.list();
		for(User c : list){ //ѭ����������е�����
			System.out.println(c);
		}
		// �ύ����
		session.getTransaction().commit();
		// �ر���Դ
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
