package cn.pi.action;

import it.sauronsoftware.jave.Encoder;
import it.sauronsoftware.jave.MultimediaInfo;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.jaudiotagger.audio.mp3.MP3AudioHeader;
import org.jaudiotagger.audio.mp3.MP3File;
import org.jaudiotagger.tag.id3.AbstractID3v2Tag;

import cn.pi.model.Files;
import cn.pi.model.User;
import cn.pi.service.FilesService;
import cn.pi.service.UserService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class FilesAction extends ActionSupport implements ModelDriven<Files>,SessionAware {
	
	private static final long serialVersionUID = 1900957086513597761L;

	// 接收框架运行时候传入的代表session对象的map
	private Map<String, Object> session;
	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session = session;
	}
	
	private Files files = new Files();
	@Override
	public Files getModel() {
		// TODO Auto-generated method stub
		return files;
	}
	
	//需要spring注入 service 
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	private FilesService filesService;
	public void setFilesService(FilesService filesService) {
		this.filesService = filesService;
	}
	
	HttpServletRequest request = ServletActionContext.getRequest();
	User user = (User)request.getSession().getAttribute("userInfo");
	
	//提交过来的文件
	private File file;
	//提交过来的file的名字
	private String fileFileName;
	//提交过来的file的类型
	private String fileContentType;

	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	
	/**
	 * 文件上传
	 */
	String str = null;
	public String upload() throws Exception{
		//文件输入流
    	InputStream is = new FileInputStream(file);
    	if(files.getType() == 1){
    		str = "/system/doc";
    	}else if(files.getType() == 2){
    		str = "/system/music";
    	}else if(files.getType() == 3){
    		str = "/system/video";
    	}else if(files.getType() == 4){
    		str = "/system/images/content";
    	}
    	//把真实文件名保存
    	String realName = this.getFileFileName();
    	if(files.getType() == 1 || files.getType() == 4){
    		setPhotoOrOfficeName();
    	}
    	//设置文件保存的目录
        String uploadPath = ServletActionContext.getServletContext()
                             .getRealPath(str);
        
        //设置目标文件
        File toFile = new File(uploadPath, this.getFileFileName());
        //文件输出流
        OutputStream os = new FileOutputStream(toFile);
        byte[] buffer = new byte[8192];
        int length = 0;
        //读取file文件输出到toFile文件中
        while(-1 != (length = is.read(buffer, 0, buffer.length))){
            os.write(buffer);
        }
        //关闭输入流和输出流
        is.close();
        os.close();

        List<Files> filesList = filesService.findByPathAndUserId(str+"/"+this.getFileFileName());
        if(filesList.size() <= 0){
        	if(files.getType() == 1){
        		/*String path = request.getSession().getServletContext().getRealPath("");
        		path = path.replaceAll("\\\\", "/");
        		String source = path+str+"/"+this.getFileFileName(); 
        		String target = path+str+"/"+this.getFileFileName().substring(0, this.getFileFileName().lastIndexOf("."))+".pdf";
        		
        		//System.out.println(source);
        		//System.out.println(target);
        		//取得文件后缀名
        		String zui = this.getFileFileName().substring(this.getFileFileName().lastIndexOf("."));
        		
        		//System.out.println(zui);
        		Office2Pdf pdf = new Office2Pdf();
        		if(".doc".equals(zui) || ".docx".equals(zui)){
        			pdf.word2pdf(source, target);
        		}else if(".xls".equals(zui) || ".xlsx".equals(zui)){
        			pdf.excel2pdf(source, target);
        		}else if(".ppt".equals(zui) || ".pptx".equals(zui)){
        			pdf.ppt2pdf(source, target);
        		}*/
        		so = realName.substring(0, realName.lastIndexOf("."));
        	}else if(files.getType() == 2){
        		System.out.println("开始获取信息！");
                getXinxi(str, this.getFileFileName());
                System.out.println("信息获取完毕！");
        	}else if(files.getType() == 3){
        		getShipin(str, this.getFileFileName());
        		so = this.getFileFileName().substring(0, this.getFileFileName().lastIndexOf("."));
        	}else if(files.getType() == 4){
        		so = this.getFileFileName().substring(0, this.getFileFileName().lastIndexOf("."));
        	}
            User user1 = userService.findByUserid(user.getUserId());
            files.setUser(user1);
            files.setFilename(so);
            files.setSinger(si);
            files.setAuthor(au);
            files.setTime(ti);
            files.setType(files.getType());
            files.setPath(str+"/"+this.getFileFileName());
            filesService.save(files);
            list();
        }
        
        return "c";
	}
	/**
	 * 获取音乐信息
	 */
	private static MP3File mp3File;
	private static final int START = 6;
	private int ti;
	private String so;
	private String si;
	private String au;
	private void getXinxi(String s1, String s2){
		String path = request.getSession().getServletContext().getRealPath("");
		path = path.replaceAll("\\\\", "/");
		//System.out.println(path);
		//String mp3Path = "http://127.0.0.1:8080/PI"+s1+"/"+s2;
		String mp3Path = path+s1+"/"+s2;
		try{
			
			System.out.println("获取信息中。。。");
			
			System.out.println(mp3Path);
			
			mp3File = new MP3File(mp3Path);//封装好的类
			MP3AudioHeader header = mp3File.getMP3AudioHeader();
			AbstractID3v2Tag id3v2tag = mp3File.getID3v2Tag();
			String songName=id3v2tag.frameMap.get("TIT2").toString();  
			String singer=id3v2tag.frameMap.get("TPE1").toString();  
			String author=id3v2tag.frameMap.get("TALB").toString(); 

			ti = header.getTrackLength();
			so = songName.substring(START, songName.length()-3);
			si = singer.substring(START,singer.length()-3);
			au = author.substring(START,author.length()-3);
			
		}catch(Exception e){
			System.out.println("没有得到信息！");
		}
		
	}
	/**
	 * 获取视频时长
	 */
	private void getShipin(String s1, String s2){
		String path = request.getSession().getServletContext().getRealPath("");
		path = path.replaceAll("\\\\", "/");
		File source = new File(path+s1+"/"+s2);  
        Encoder encoder = new Encoder();  
        try {  
             MultimediaInfo m = encoder.getInfo(source);  
             ti = (int)m.getDuration();  
        } catch (Exception e) {  
            e.printStackTrace();
        }
	}
	/**
	 * 修改照片和文档名称，防止重名覆盖
	 */
	private void setPhotoOrOfficeName(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssS");//格式化时间输出
    	String Rname = sdf.format(new Date());//取得当前时间，Date()是java.util包里的，这作为真实名称
    	String name = this.getFileFileName();//得到上传文件的原名称
    	int i = name.lastIndexOf(".");//原名称里倒数第一个”.”在哪里
    	String ext = name.substring(i+1);//取得后缀，及”.”后面的字符
    	name = name.substring(0, i)+Rname+"."+ext;//拼凑而成
        this.fileFileName = name;
	}

	/**
	 * 文件列表
	 */
	public void list(){
		List<Files> filesList = filesService.findByUserIdAndType(files.getType());
		session.put("filesList", filesList);
	}
	public String shuji(){
		list();
		return "fileslist";
	}
	public String yinyue(){
		list();
		return "fileslist";
	}
	public String shipin(){
		list();
		return "fileslist";
	}
	public String zhaopian(){
		list();
		return "fileslist";
	}
	/**
	 * 删除文件
	 */
	public String delete(){
		filesService.delete(files);
		list();
		if(files.getType() == 1){
			return "doc";
		}else if(files.getType() == 2){
			return "music";
		}else if(files.getType() == 3){
			return "video";
		}
		return "photo";
	}

}
