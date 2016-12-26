package com.hb.pro.admin.controller;

import java.io.*;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hb.pro.admin.model.AdminDao;
import com.hb.pro.admin.model.AdminVo;
import com.hb.pro.admin.model.CookVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class AdminController {
	@Autowired
	private AdminDao adminDao;
	private int result;
	
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public String adminLogin(Model model,HttpServletRequest request, HttpSession session) {
		String id = request.getParameter("adminId");
		String pw = request.getParameter("adminPw");
		Map<String, String> map = new HashMap();
		map.put("parameter1", id);
		map.put("parameter2", pw);
		int result = adminDao.adminLogin(map);
		if(result>0){
			session.setAttribute("id", id);
		}
		model.addAttribute("alist", adminDao.selectAll());
		return "admin/main";
	}
	@RequestMapping(value="/logout.do",method=RequestMethod.GET)
	public String adminLogout(HttpSession session,Model model){
		if(session.getAttribute("id")!=null){
			session.removeAttribute("id");
		}
		if(session.getAttribute("str")!=null){
			session.removeAttribute("str");
		}
		return "redirect:/";
	}
	@RequestMapping(value="/join.do",method=RequestMethod.GET)
	public String adminJoin(HttpSession session,Model model){
		session.setAttribute("str",1);
		model.addAttribute("alist", adminDao.selectAll());
		return "admin/main";
	}
	
	@RequestMapping(value="/idck.do",method=RequestMethod.POST)
	public void adminId(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id").trim();
		PrintWriter out = response.getWriter();
		
		result = adminDao.idchk(id);
		if(result>0){
			out.write("NO");
		}
		else{
			out.write("YES");
		}
	}
	
	@RequestMapping(value="/insert.do",method=RequestMethod.POST)
	public String adminInsert(AdminVo bean,HttpServletRequest request,HttpServletResponse response,Model model){
			adminDao.insertOne(bean);
			return "redirect:/";
		}
	
	@RequestMapping(value="/cooklist.do",method=RequestMethod.GET)
	public String guestList(Model model) {
		model.addAttribute("alist", adminDao.selectAll());
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/cookinsert.do",method=RequestMethod.POST)
	public String cookInsert(AdminVo bean,HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		 request.setCharacterEncoding("UTF-8");
		 
		 String title="";
		 String mat ="";
		 String text="";
		 
		 String realFolder = "";
		 String filename1 = "";
		 int maxSize = 1024*1024*5;
		 String encType = "utf-8";
		 String savefile = "/resources/img";
		 ServletContext scontext = request.getSession().getServletContext();
		 realFolder = scontext.getRealPath(savefile);
		 
		  try{
		  MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		  Enumeration files = multi.getFileNames();
		     String file1 = (String)files.nextElement();
		     filename1 = multi.getFilesystemName(file1);
		     title = multi.getParameter("cooktitle");
		     mat = multi.getParameter("cookmat");
		     text = multi.getParameter("cooktext");
		 } catch(Exception e) {
			 e.printStackTrace();
		 }
		 String path = "http:///203.236.209.195:8080/pro/resources/img/"+filename1;
		 mat = mat.replace("\r\n","<br>");
		 text = text.replace("\r\n","<br>");
		  Map<String, String> map = new HashMap();
			map.put("title", title);
			map.put("mat", mat);
			map.put("text", text);
			map.put("path", path);
			
			adminDao.insertCook(map);
			return "redirect:/";
		}
	
	@RequestMapping(value="/cookOne.do/{cook_num}", method=RequestMethod.GET)
	public String cookOne(Model model,@PathVariable("cook_num") int cook_num,CookVo bean) {
		model.addAttribute("alist", adminDao.selectAll());
		model.addAttribute("bean", adminDao.selectOne(cook_num));
		return "admin/list";
	}
	
	@RequestMapping(value="/cookmodify.do/{cook_num}",method=RequestMethod.POST)
	public String cookModify(CookVo bean,@PathVariable("cook_num") int cook_num,HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		 request.setCharacterEncoding("UTF-8");
		 
		 String title="";
		 String mat ="";
		 String text="";
		 
		 String realFolder = "";
		 String filename1 = "";
		 int maxSize = 1024*1024*5;
		 String encType = "utf-8";
		 String savefile = "/resources/img";
		 ServletContext scontext = request.getSession().getServletContext();
		 realFolder = scontext.getRealPath(savefile);
		 
		  try{
		  MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		  Enumeration files = multi.getFileNames();
		     String file1 = (String)files.nextElement();
		     filename1 = multi.getFilesystemName(file1);
		     title = multi.getParameter("modifytitle");
		     mat = multi.getParameter("modifymat");
		     text = multi.getParameter("modifytext");
		 } catch(Exception e) {
			 e.printStackTrace();
		 }
		 String path = "http:///203.236.209.195:8080/pro/resources/img/"+filename1;
		 mat = mat.replace("\r\n","<br>");
		 text = text.replace("\r\n","<br>");
		
			bean.setCook_num(cook_num);
			bean.setTitle(title);
			bean.setMat(mat);
			bean.setText(text);
			bean.setPath(path);
			
			adminDao.updateOne(bean);
			return "redirect:/cookOne.do/"+cook_num;
			//return "admin/list";
		}
	@RequestMapping(value="/cookDel.do/{cook_num}",method=RequestMethod.DELETE)
		public String guestDelete(@PathVariable("cook_num") int cook_num,HttpServletRequest request){
		
		String path = request.getParameter("str");
		
		adminDao.deleteOne(cook_num);
		path = path.replace("http:///203.236.209.195:8080","C:/sts/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps");
		System.out.println(path);
		
		File file = new File(path);
				if(file.exists() == true){
				file.delete();
		}
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/search.do",method=RequestMethod.POST)
	public void titleSearch(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		
		
		List<CookVo> list = adminDao.searchAll();
		ArrayList<String> resultlist = new ArrayList<String>();
		 for(CookVo bean : list){
			 resultlist.add(bean.getTitle());
		 }
		
		String searchValue = request.getParameter("searchValue");
		JSONArray arrayObj=new JSONArray();
		JSONObject jsonObj = null;


		//뽑은 후 json파싱
		for(String str : resultlist) {
		   	jsonObj = new JSONObject();
		   	jsonObj.put("data", str);
		    arrayObj.put(jsonObj);
		}

		PrintWriter pw = response.getWriter();
		pw.print(arrayObj);
		pw.flush();
		pw.close();
	
	}
	
	@RequestMapping(value="/searchTitle.do",method=RequestMethod.POST)
	public String test2(HttpServletRequest request, HttpServletResponse response,Model model){
		response.setContentType("text/html;charset=UTF-8");
		String title = request.getParameter("tags");
		model.addAttribute("search",adminDao.searchTitle(title));
		model.addAttribute("alist", adminDao.selectAll());
		return "admin/search";
	}
	
	@RequestMapping(value="/test.do",method=RequestMethod.POST)
	public String test(HttpServletRequest request, HttpServletResponse response,Model model) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		
		
		List<CookVo> list = adminDao.searchAll();
		ArrayList<String> resultlist = new ArrayList<String>();
		 for(CookVo bean : list){
			 resultlist.add(bean.getTitle());
		 }
		
		 //String searchValue = request.getParameter("searchValue");
		// model.addAttribute("search",adminDao.searchTitle(searchValue));
		 
		
		JSONArray arrayObj=new JSONArray();
		JSONObject jsonObj = null;

		//////////// 임의의 데이터(db라 가정하자) ////////////  
//		ArrayList<String> dblist = new ArrayList<String>();
//		dblist.add("Afghanistan");
//		dblist.add("Albania");
//		dblist.add("Algeria");
//		dblist.add("American");
//		dblist.add("Samoa");
//		dblist.add("Andorra");

//		for(String str : dblist) {
//		    if(str.toLowerCase().startsWith(searchValue)) {
//		    	resultlist.add(str);
//		    }
//		}
		///////////resultlist를 db에서 조회후 뽑아온 list라고 가정한다.///////////

		//뽑은 후 json파싱
		for(String str : resultlist) {
		   	jsonObj = new JSONObject();
		   	jsonObj.put("data", str);
		    arrayObj.put(jsonObj);
		}

		PrintWriter pw = response.getWriter();
		pw.print(arrayObj);
		pw.flush();
		pw.close();
	
		return "admin/test4";
	}
	
	
}
