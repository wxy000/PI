package cn.pi.action;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.pi.model.User;
import cn.pi.service.UserService;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
public class UserHeaderUploadAction extends ActionSupport{	    
	private static final long serialVersionUID = 1L;

	//需要spring注入 service 
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	//提交过来的文件
	private File file;
	//提交过来的file的名字
	private String fileFileName;
    //提交过来的file的类型
    private String fileContentType;
    public File getFile(){
        return file;
    }
    public void setFile(File file){
        this.file = file;
    }
    public String getFileFileName(){
        return fileFileName;
    }
    public void setFileFileName(String fileFileName){
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssS");//格式化时间输出
    	String Rname = sdf.format(new Date());//取得当前时间，Date()是java.util包里的，这作为真实名称
    	String name = fileFileName;//得到上传文件的原名称
    	int i = name.lastIndexOf(".");//原名称里倒数第一个”.”在哪里
    	String ext = name.substring(i+1);//取得后缀，及”.”后面的字符
    	name = Rname+"."+ext;//拼凑而成
        this.fileFileName = name;
    }
    public String getFileContentType(){
        return fileContentType;
    }
    public void setFileContentType(String fileContentType){
        this.fileContentType = fileContentType;
    }
    public String uploadHeader() throws Exception{
    	//文件输入流
    	InputStream is = new FileInputStream(file);
    	//设置文件保存的目录
        String uploadPath = ServletActionContext.getServletContext()
                             .getRealPath("/system/images/header");
        //System.out.println("/system/images/header/"+this.getFileFileName());
        //System.out.println(this.getUserId());
        
        
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
        HttpServletRequest request = ServletActionContext.getRequest();
		User user = (User)request.getSession().getAttribute("userInfo");
        user.setPhotopath("/system/images/header/"+this.getFileFileName());
        int ret = userService.updateUserHeader(user);
		if(ret == 1){
			User userInfo = userService.findByUserid(user.getUserId());
			ActionContext context = ActionContext.getContext();
			if(userInfo != null){
				context.getSession().put("userInfo", userInfo);
			}
		}
        //关闭输入流和输出流
        is.close();
        os.close();
        String str = "{\"code\": \"0\",\"msg\": \"1\"}";
        Gson gs = new Gson();
        String a = gs.toJson(str);
        System.out.println(a);
        return a;
	}
}
