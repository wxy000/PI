package cn.pi.dao;

import java.util.List;

import cn.pi.model.Files;

public interface FilesDao extends BaseDao<Files> {
	
	public List<Files> findByUserIdAndType(int type);
	
	public void insert(Files files);
	
	public List<Files> findByPathAndUserId(String path);
	
	public int filesSum(int type);
	
}
