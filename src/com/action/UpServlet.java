package com.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;
import com.util.SmartFile;
import com.util.SmartUpload;
/**
 * 处理上传、下载
 * @author jiandiluoluo
 *
 */
public class UpServlet extends HttpServlet {

	private ServletConfig config;
	
	public UpServlet() {
		super();
	}

	final public void init(ServletConfig config) throws ServletException{
        this.config = config;  
    }

    final public ServletConfig getServletConfig(){
        return config;
    }
	
	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		response.setContentType(Constant.CONTENTTYPE);
		String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		String method = "";;
		ComBean cb = new ComBean(); 
		SmartUpload mySmartUpload = new SmartUpload();//init
		int count = 0;
		HttpSession session = request.getSession();
		try{
			mySmartUpload.initialize(config,request,response);
            mySmartUpload.upload(); 
            method = mySmartUpload.getRequest().getParameter("method").trim();
            if(method.equals("addqc")){// 通知 上传  
            	//String bt="";String gs="";String sj="";String pic="";String nr=""; 
            	String mc = mySmartUpload.getRequest().getParameter("mc");  
            	String zz = mySmartUpload.getRequest().getParameter("zz");  
            	String fl = mySmartUpload.getRequest().getParameter("fl");   
            	String nr = mySmartUpload.getRequest().getParameter("content1");    
            	SmartFile file = mySmartUpload.getFiles().getFile(0);
            	String fileExt=file.getFileExt();	            
            	String path="upfile";
            	count = mySmartUpload.save(path);   
        		int flag=cb.comUp("insert into qc(mc,zz,fl,url,nr,sj ) " +
        				"values('"+mc+"','"+zz+"','"+fl+"','"+path+"/"+file.getFileName()+"','"+nr+"','"+date2+"' )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/notice/index.jsp").forward(request, response); 
				}else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/notice/index.jsp").forward(request, response); 
				}  
            } else if(method.equals("upqc")){//修改  
            	String id = mySmartUpload.getRequest().getParameter("id");
            	String mc = mySmartUpload.getRequest().getParameter("mc");  
            	String zz = mySmartUpload.getRequest().getParameter("zz");  
            	String fl = mySmartUpload.getRequest().getParameter("fl");   
            	String nr = mySmartUpload.getRequest().getParameter("content1");    
            	SmartFile file = mySmartUpload.getFiles().getFile(0);
            	String fileExt=file.getFileExt();	            
            	String path="upfile";
            	count = mySmartUpload.save(path);  
            		if(count==0){
                		int flag=cb.comUp("update qc set mc='"+mc+"',zz='"+zz+"',fl='"+fl+"', nr='"+nr+"'  where id='"+id+"'");
        				if(flag == Constant.SUCCESS){ 
        					request.setAttribute("message", "操作成功！");
        					request.getRequestDispatcher("admin/notice/index.jsp").forward(request, response); 
        				}else { 
        					request.setAttribute("message", "操作失败！");
        					request.getRequestDispatcher("admin/notice/index.jsp").forward(request, response); 
        				}
                	}else{ 
                		int flag=cb.comUp("update qc set mc='"+mc+"',zz='"+zz+"',fl='"+fl+"' ,url='"+path+"/"+file.getFileName()+"',nr='"+nr+"' where id='"+id+"'"); 
                		if(flag == Constant.SUCCESS){ 
        					request.setAttribute("message", "操作成功！");
        					request.getRequestDispatcher("admin/notice/index.jsp").forward(request, response); 
        				}else { 
        					request.setAttribute("message", "操作失败！");
        					request.getRequestDispatcher("admin/notice/index.jsp").forward(request, response); 
        				}
                	}      
            } 
            
            else if(method.equals("addsp")){// 上传  
            	//String bt="";String gs="";String sj="";String pic="";String nr=""; 
            	String mc = mySmartUpload.getRequest().getParameter("mc");  
            	String zz = mySmartUpload.getRequest().getParameter("zz");  
            	String fl = mySmartUpload.getRequest().getParameter("fl");   
            	String nr = mySmartUpload.getRequest().getParameter("content1");    
            	SmartFile file = mySmartUpload.getFiles().getFile(0);
            	String fileExt=file.getFileExt();	            
            	String path="upfile";
            	count = mySmartUpload.save(path);   
        		int flag=cb.comUp("insert into sp(mc,zz,fl,url,nr,sj ) " +
        				"values('"+mc+"','"+zz+"','"+fl+"','"+path+"/"+file.getFileName()+"','"+nr+"','"+date2+"' )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/sp/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/sp/index.jsp").forward(request, response); 
				}  
            } 					
            else if(method.equals("upsp")){//修改  
            	String id = mySmartUpload.getRequest().getParameter("id");
            	String mc = mySmartUpload.getRequest().getParameter("mc");  
            	String zz = mySmartUpload.getRequest().getParameter("zz");  
            	String fl = mySmartUpload.getRequest().getParameter("fl");   
            	String nr = mySmartUpload.getRequest().getParameter("content1");    
            	SmartFile file = mySmartUpload.getFiles().getFile(0);
            	String fileExt=file.getFileExt();	            
            	String path="upfile";
            	count = mySmartUpload.save(path);  
            		if(count==0){
                		int flag=cb.comUp("update sp set mc='"+mc+"',zz='"+zz+"',fl='"+fl+"', nr='"+nr+"'  where id='"+id+"'");
        				if(flag == Constant.SUCCESS){ 
        					request.setAttribute("message", "操作成功！");
        					request.getRequestDispatcher("admin/sp/index.jsp").forward(request, response); 
        				}
        				else { 
        					request.setAttribute("message", "操作失败！");
        					request.getRequestDispatcher("admin/sp/index.jsp").forward(request, response); 
        				}
                	}else{ 
                		int flag=cb.comUp("update sp set mc='"+mc+"',zz='"+zz+"',fl='"+fl+"' ,url='"+path+"/"+file.getFileName()+"',nr='"+nr+"' where id='"+id+"'"); 
                		if(flag == Constant.SUCCESS){ 
        					request.setAttribute("message", "操作成功！");
        					request.getRequestDispatcher("admin/sp/index.jsp").forward(request, response); 
        				} else { 
        					request.setAttribute("message", "操作失败！");
        					request.getRequestDispatcher("admin/sp/index.jsp").forward(request, response); 
        				}
                	}      
            } 
             
		}catch(Exception e){
			e.printStackTrace();
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
