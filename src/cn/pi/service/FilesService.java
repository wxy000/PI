package cn.pi.service;

import java.io.Serializable;
import java.util.List;

import cn.pi.model.Files;

public interface FilesService {
	
	public List<Files> findByUserIdAndType(int type);
	
	public void save(Files files);
	
	public List<Files> findByPathAndUserId(String path);
	
	public void delete(Files files);
	
	public Files findById(Serializable id);
	
	public int filesSum(int type);
	
}
