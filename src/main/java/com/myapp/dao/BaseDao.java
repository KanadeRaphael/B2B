package com.myapp.dao;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.List;
import java.util.Map;

/**
 * 基础数据库操作类
 * 
 * 其他DAO继承此类获取常用的数据库操作方法
 * 
 * @author 孙宇
 * 
 * @param <T>
 *            模型
 */
public interface BaseDao<T> {

	public Serializable save(T o);

	public void delete(T o);

	public void update(T o);

	public void saveOrUpdate(T o);

	public T get(Class<T> c, Serializable id);
	public T get(String hql);
	public T get(String hql, Map<String, Object> params);

	public List<T> find(String hql);
	public List<T> find(String hql, Map<String, Object> params);
	public List<T> find(String hql, int page, int rows);
	public List<T> find(String hql, Map<String, Object> params, int page, int rows);

	public Long count(String hql);
	public Long count(String hql, Map<String, Object> params);

	public int executeHql(String hql);
	public int executeHql(String hql, Map<String, Object> params);

	public List<Object[]> findBySql(String sql);
	public List<Object[]> findBySql(String sql, int page, int rows);
	public List<Object[]> findBySql(String sql, Map<String, Object> params);
	public List<Object[]> findBySql(String sql, Map<String, Object> params, int page, int rows);

	public int executeSql(String sql);
	public int executeSql(String sql, Map<String, Object> params);

	public BigInteger countBySql(String sql);
	public BigInteger countBySql(String sql, Map<String, Object> params);

}
