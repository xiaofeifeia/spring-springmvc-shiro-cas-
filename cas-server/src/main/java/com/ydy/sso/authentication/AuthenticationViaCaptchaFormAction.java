package com.ydy.sso.authentication;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jasig.cas.authentication.Credential;
import org.jasig.cas.web.flow.AuthenticationViaFormAction;
import org.jasig.cas.web.support.WebUtils;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.util.StringUtils;
import org.springframework.webflow.execution.RequestContext;

import com.ydy.sso.model.UsernamePasswordCaptchaCredential;

/**
 * 自定义的处理验证码登录逻辑的Action
 * @create 2015-7-14 下午4:28:55
 * @author 玄玉<http://blog.csdn.net/jadyer>
 */
public class AuthenticationViaCaptchaFormAction extends AuthenticationViaFormAction {
	public final String validateCaptcha(final RequestContext context, final Credential credential, final MessageContext messageContext){
		final HttpServletRequest request = WebUtils.getHttpServletRequest(context);
		HttpSession session = request.getSession();
		String checkCode = (String)session.getAttribute("checkCode");
		
		UsernamePasswordCaptchaCredential upc = (UsernamePasswordCaptchaCredential)credential;
		String captcha = upc.getCaptcha();
		
		if(StringUtils.isEmpty(upc.getUsername())){
			messageContext.addMessage(new MessageBuilder().error().code("required.username").build());
			return "error";
		}
		if(StringUtils.isEmpty(upc.getPassword())){
			messageContext.addMessage(new MessageBuilder().error().code("required.password").build());
			return "error";
		}
		if(!StringUtils.hasText(checkCode) || !StringUtils.hasText(captcha)){
			messageContext.addMessage(new MessageBuilder().error().code("required.captcha").build());
			return "error";
		}
		if(!captcha.equalsIgnoreCase(checkCode)){
			messageContext.addMessage(new MessageBuilder().error().code("error.authentication.captcha.bad").build());
			return "error";
		}
		return "success";
	}
}