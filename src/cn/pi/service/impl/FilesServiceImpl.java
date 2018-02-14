package cn.pi.service.impl;

import java.io.Serializable;
import java.util.List;

import cn.pi.dao.FilesDao;
import cn.pi.model.Files;
import cn.pi.service.FilesService;

public class FilesServiceImpl implements FilesService {
	
	private FilesDao filesDao;
	public void setFilesDao(FilesDao filesDao) {
		this.filesDao = filesDao;
	}

	@Override
	public List<Files> findByUserIdAndType(int type) {
		// TODO Auto-generated method stub
		return this.filesDao.findByUserIdAndType(type);
	}

	@Override
	public void save(Files files) {
		// TODO Auto-generated method stub
		this.filesDao.insert(files);
	}

	@Override
	public List<Files> findByPathAndUserId(String path) {
		// TODO Auto-generated method stub
		return this.filesDao.findByPathAndUserId(path);
	}

	@Override
	public void delete(Files files) {
		// TODO Auto-generated method stub
		this.filesDao.delete(files);
	}

	@Override
	public Files findById(Serializable id) {
		// TODO Auto-generated method stub
		return this.filesDao.findById(id);
	}

	@Override
	public int filesSum(int type) {
		// TODO Auto-generated method stub
		return this.filesDao.filesSum(type);
	}

}
