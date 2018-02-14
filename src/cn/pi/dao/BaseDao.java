package cn.pi.dao;

import java.util.List;

public interface BaseDao<T> {

	public void save(T t);

	public void update(T t);

	public void saveOrUpdate(T t);

	public void delete(T t);

	public T findById(java.io.Serializable id);

	public List<T> findAll();
	
	public List<T> findAll(String condition, Object ... params);
}