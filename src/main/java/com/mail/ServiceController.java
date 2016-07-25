package com.mail;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.easycart.utils.DateHelper;
import com.mail.logic.SendMail;

@Controller
@RequestMapping(value="/mail")
public class ServiceController {

	private static Logger logger = LogManager.getLogger(ServiceController.class);
	@Autowired
	private SendMail sendMail;
	
	@RequestMapping(value="/",method=RequestMethod.POST)
	public ModelAndView mailSender(){
		return new ModelAndView("index");
	}
	
	@RequestMapping(value="/send",method=RequestMethod.GET)
	public void mailSender(
			@RequestParam(value="website") String website,
			@RequestParam(value="subject") String subject,
			@RequestParam(value="content") String content,
			HttpServletRequest request,
			HttpServletResponse response
			){
		
		logger.debug(subject +" 发送邮件时间：" + DateHelper.getMMDDYYYYHHMMSS());
		sendMail.sendHtmlMail(website, subject,  content,"");
	}
}
