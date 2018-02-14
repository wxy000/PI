package cn.pi.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.pi.dao.BaseDao;

public class BaseDaoImpl<T> extends HibernateDaoSupport implements BaseDao<T> {

	private Class<T> beanClass;
	@SuppressWarnings("unchecked")
	public BaseDaoImpl() {
		
		ParameterizedType parameterizedType = (ParameterizedType) this.getClass().getGenericSuperclass();

		beanClass = (Class<T>) parameterizedType.getActualTypeArguments()[0];
	}

	public void save(T t) {
		this.getHibernateTemplate().save(t);
	}

	public void update(T t) {
		this.getHibernateTemplate().update(t);
	}

	public void saveOrUpdate(T t) {
		this.getHibernateTemplate().saveOrUpdate(t);
	}

	public void delete(T t) {
		this.getHibernateTemplate().delete(t);
	}

	public T findById(Serializable id) {
		return this.getHibernateTemplate().get(beanClass, id);
	}

	@SuppressWarnings("unchecked")
	public List<T> findAll() {
		
		return this.getHibernateTemplate() .find("from " + beanClass.getName());
	}

	@SuppressWarnings("unchecked")
	public List<T> findAll(String condition, Object... params) {
		String hql = "from " + beanClass.getName() + " where 1=1 " + condition;
		return this.getHibernateTemplate().find(hql , params);
	}
}