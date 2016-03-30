package com.zq.system.controller;

import com.zq.common.util.VerifyCodeUtil;
import com.zq.system.entity.UserInfo;
import com.zq.system.service.UserInfoService;
import com.zq.system.util.CommonConstants;

import net.sf.json.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
  

@Controller("LoginController")   
public class LoginController {
	@Autowired
	private UserInfoService userInfoService;
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
        		if(2==userInfo.getUserType()){
        			message="index";
        		}else{
        			message="../index";
        		}
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
