package com.zq.system.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zq.common.util.VerifyCodeUtil;
import com.zq.system.entity.UserAdmin;
import com.zq.system.entity.UserInfo;
import com.zq.system.service.UserAdminService;
import com.zq.system.service.UserInfoService;
import com.zq.system.util.CommonConstants;
  

@Controller("LoginController")   
public class LoginController {
	@Autowired
	private UserInfoService userInfoService;
	@Autowired
	private UserAdminService userAdminService;
    /** 
     * 获取验证码图片和文本(验证码文本会保存在HttpSession中) 
     */  
    @RequestMapping("/getVerifyCodeImage")  
    public void getVerifyCodeImage(HttpServletRequest request, HttpServletResponse response) throws IOException {  
        //设置页面不缓存  
        response.setHeader("Pragma", "no-cache");  
        response.setHeader("Cache-Control", "no-cache");  
        response.setDateHeader("Expires", 0);  
        response.setContentType("image/jpeg");  
        VerifyCodeUtil vCode = new VerifyCodeUtil(75,30,4,50);   
        request.getSession().setAttribute("verifyCode", vCode.getCode());   
        vCode.write(response.getOutputStream());   
    }  
      
      
    /** 
     * 用户登录 
     */  
    @RequestMapping(value="/login", method=RequestMethod.POST,produces = "text/html;charset=UTF-8")
    public Object login(HttpServletRequest request){  
    	String message="../login1";
    	
    	
//    	String data = request.getParameter("data");
//    	
//    	JSONObject json = JSONObject.fromObject(data);
        String username = request.getParameter("account");  
        String password = request.getParameter("password");
       
        UserInfo userInfo = userInfoService.getOneUserInfo(username);
        if(userInfo!=null){
        	if(password.equals(userInfo.getPassword())){
        		request.getSession().setAttribute(CommonConstants.SEESION_MEMBER, userInfo);
        			message="../index";
                return message;
        	}else{
        		request.setAttribute("message_login", "用户名或密码不正确");  
        	}
        }else{
        	request.setAttribute("message_login", "用户名或密码不正确");  
        }
        return message;
    }  
    
    /** 
     * 用户登录 
     */  
    @RequestMapping(value="/loginAdmin", method=RequestMethod.POST,produces = "text/html;charset=UTF-8")
    @ResponseBody
    public Object loginAdmin(HttpServletRequest request){  
    	String message="用户名密码错误!";
    	
    	
    	String data = request.getParameter("data");
    	
    	JSONObject json = JSONObject.fromObject(data);
        String username = json.getString("account");  
        String password = json.getString("password");
        UserAdmin user = new UserAdmin();
        user.setAccount(username);
        UserAdmin userInfo = userAdminService.getUserAdmin(user);
        if(userInfo!=null){
        	if(password.equals(userInfo.getPassword())){
        		request.getSession().setAttribute(CommonConstants.SEESION_MEMBER_ADMIN, userInfo);
        		message="success";
                return message;
        	}
        }
        return message;
    }  
      
    /** 
     * 用户登出 
     */  
    @RequestMapping(value="/logout",method=RequestMethod.GET)  
    public String logout(HttpServletRequest request){  
    	request.getSession().removeAttribute(CommonConstants.SEESION_MEMBER);
         return "../login1"; 
    }
    @RequestMapping("/test")  
    @ResponseBody
    public Object test(HttpServletRequest request){
    	System.out.println("dfsdfsfsdfsdfsd");
    	return "dfsfs";
    }
    
}  
