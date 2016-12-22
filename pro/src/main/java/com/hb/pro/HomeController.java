package com.hb.pro;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hb.pro.admin.model.AdminDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private AdminDao adminDao;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session,Model model) {
		if(session.getAttribute("str")!=null){
			session.removeAttribute("str");
		}
		model.addAttribute("alist", adminDao.selectAll());
			//return "admin/main";
		return "admin/main";
	}
	
	
	
	
	
	
}








