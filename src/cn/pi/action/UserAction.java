package cn.pi.action;

import cn.pi.model.User;
import cn.pi.service.UserService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User> {
	private static final long serialVersionUID = 1900957086513597761L;
	//封装数据 
	private User user = new User();
	
	public User getModel() {
		return user;
	}
	
	//需要spring注入 service 
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public String login() {
		User userInfo = userService.loginUser(user);
		//System.out.println(user);
		ActionContext context = ActionContext.getContext();
		if(userInfo != null) {
			context.getSession().put("userInfo", userInfo);
			return "index";
		} else {
			context.getSession().put("loginfaild","• 用户名或密码错误！");
			return "login";
		}
	}
	
	/** * 注销重新登陆 */
	public String logout(){
		ActionContext context = ActionContext.getContext();
		context.getSession().remove("userInfo");
		context.getSession().remove("loginfaild");
		context.getSession().remove("regissuccess");
		context.getSession().remove("regisfaild");
		context.getSession().remove("mimadui");
		context.getSession().remove("mimacuowu");
		context.getSession().remove("mimawujie");
		return "login";
	}
	
	public String register(){
		boolean regisInfo = userService.register(user);
		ActionContext context = ActionContext.getContext();
		//System.out.println(user);
		if(regisInfo){
			context.getSession().put("regissuccess", "注册成功！");
		}else{
			context.getSession().put("regisfaild", "注册失败（用户名重复）！");
		}
		return "register";
	}
	
	public String update(){
		int ret = userService.updateUser(user);
		if(ret == 1){
			User userInfo = userService.findByUserid(user.getUserId());
			ActionContext context = ActionContext.getContext();
			if(userInfo != null){
				context.getSession().put("userInfo", userInfo);
			}
		}
		return "jibenziliao";
	}
	
	
	private String password1;
	private String password3;
	public String getPassword1() {
		return password1;
	}

	public void setPassword1(String password1) {
		this.password1 = password1;
	}

	public String getPassword3() {
		return password3;
	}

	public void setPassword3(String password3) {
		this.password3 = password3;
	}

	public String xiugaimima(){

		User userInfo = userService.findByUserid(user.getUserId());
		ActionContext context = ActionContext.getContext();
		if(userInfo.getPassword() == this.getPassword1() || userInfo.getPassword().equals(this.getPassword1())){
			User u = new User();
			u.setUserId(user.getUserId());
			u.setPassword(this.getPassword3());
			int ret = userService.updateUserPwd(u);
			if(ret == 1){
				context.getSession().put("mimadui", "修改成功！");
				return "xiugaimima";
			}
			context.getSession().put("mimawujie", "遇到未知错误，密码无法修改！");
			return "xiugaimima";
		}else{
			context.getSession().put("mimacuowu", "原密码错误！");
			return "xiugaimima";
		}
	}
}
