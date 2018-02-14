package cn.pi.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

@SuppressWarnings("serial")
public class LoginInterceptor extends AbstractInterceptor{
    @Override
    public String intercept(ActionInvocation invocation) throws Exception {

    	String methodName = invocation.getProxy().getMethod();
        ActionContext ac = invocation.getInvocationContext();

        Object obj = ac.getSession().get("userInfo");

        if(!("login".equals(methodName) || "register".equals(methodName))) {
            if(obj == null) {
                return "nonlogin";
            } else {
                return invocation.invoke();
            }
        }
        return invocation.invoke(); 
    }
}
