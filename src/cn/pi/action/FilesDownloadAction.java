package cn.pi.action;

import java.io.IOException;
import java.io.InputStream;

import org.apache.struts2.ServletActionContext;

import cn.pi.model.Files;
import cn.pi.service.FilesService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class FilesDownloadAction extends ActionSupport implements ModelDriven<Files> {

	private static final long serialVersionUID = 1L;
	
	private FilesService filesService;
	public void setFilesService(FilesService filesService) {
		this.filesService = filesService;
	}

	private Files files = new Files();
	@Override
	public Files getModel() {
		// TODO Auto-generated method stub
		return files;
	}
	
	private String filenamex;
	private String contentTypex;

	public String getFilenamex() {
		return filenamex;
	}

	public void setFilenamex(String filenamex) {
		this.filenamex = filenamex;
	}

	public String getContentTypex() {
		return contentTypex;
	}

	public void setContentTypex(String contentTypex) {
		this.contentTypex = contentTypex;
	}

	public InputStream getDownloadFile() throws IOException{
		Files filess = filesService.findById(files.getFileid());
		this.contentTypex = filess.getPath().substring(filess.getPath().lastIndexOf("."));
		this.filenamex = new String((filess.getFilename()+filess.getPath().substring(filess.getPath().lastIndexOf("."))).getBytes(),"ISO-8859-1");
		String filepath = filess.getPath();
		return ServletActionContext.getServletContext().getResourceAsStream(filepath);
	}
	
	public String execute() throws Exception{
		return SUCCESS;
	}
	
}
