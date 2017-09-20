package com.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;
/**
 * 
 * @author jiandiluoluo
 *
 */
public class ComServlet extends HttpServlet {

	public ComServlet() {
		super();
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

		response.setContentType(Constant.CONTENTTYPE);
		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		HttpSession session = request.getSession();
		ComBean cBean = new ComBean();
		String date=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		//String date2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String method = request.getParameter("method");
		
		if(method.equals("addxw")){  //���Ŷ�̬     
			String bt = request.getParameter("bt"); 
			String fl = request.getParameter("fl"); 
			String nr = request.getParameter("content1"); 
			if(nr==null)nr="����";
			int flag = cBean.comUp("insert into xw(bt,fl,nr,sj)  values('"+bt+"','"+fl+"','"+nr+"','"+date+"')");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/news/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/news/index.jsp").forward(request, response);
			} 
		}else if(method.equals("upxw")){ //�޸����Ŷ�̬ 
			String id=request.getParameter("id");
			String bt = request.getParameter("bt"); 
			String fl = request.getParameter("fl"); 
			String nr = request.getParameter("content1"); 
			if(nr==null){
				nr="����";
			}
			int flag = cBean.comUp("update xw set bt='"+bt+"',fl='"+fl+"',nr='"+nr+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/news/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/news/index.jsp").forward(request, response);
			}  
		}else if(method.equals("delxw")){//ɾ�����Ŷ�̬
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from xw where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/news/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "ϵͳά���У����Ժ����ԣ�");
				request.getRequestDispatcher("admin/newss/index.jsp").forward(request, response);
			}
		}
		
		
		else if(method.equals("delqc")){//ɾ��֪ͨ
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from qc where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/notice/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "ϵͳά���У����Ժ����ԣ�");
				request.getRequestDispatcher("admin/notice/index.jsp").forward(request, response);
			}
		}  
	
		else if(method.equals("addcs")){  //��� ��������
			String xz = request.getParameter("xz"); 
			String td = request.getParameter("td"); 
			String nr = request.getParameter("content1"); 
			if(nr==null)nr="����";
			int flag = cBean.comUp("insert into cs(xz,td,content,sj)  values('"+xz+"','"+td+"','"+nr+"','"+date+"')");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/downloadFile/index.jsp").forward(request, response);
			}else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/downloadFile/index.jsp").forward(request, response);
			} 
		} else if(method.equals("upcs")){ //�޸� ��������
			String id=request.getParameter("id");
			String xz = request.getParameter("xz"); 
			String td = request.getParameter("td"); 
			String nr = request.getParameter("content1"); 
			if(nr==null)nr="����";
			int flag = cBean.comUp("update cs set xz='"+xz+"',td='"+td+"',content='"+nr+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/downloadFile/index.jsp").forward(request, response);
			}else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/downloadFile/index.jsp").forward(request, response);
			}  
		}else if(method.equals("delcs")){//ɾ�� �����ļ�
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from cs where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/downloadFile/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "ϵͳά���У����Ժ����ԣ�");
				request.getRequestDispatcher("admin/downloadFile/index.jsp").forward(request, response);
			}
		} 
		 
		
		else if(method.equals("xx")){  //ʵ���Ҹſ�
			String nr = request.getParameter("content1"); 
			if(nr==null){
				nr="����";
			}
			int flag = cBean.comUp("update jj set content='"+nr+"' where fl='xx'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/summary/libSummMana.jsp").forward(request, response);
			}else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/summary/libSummMana.jsp").forward(request, response);
			}  
		} 
		
		else if(method.equals("direction")){  //�о�����
			String nr = request.getParameter("content1"); 
			if(nr==null){
				nr="����";
			}
			int flag = cBean.comUp("update Direction set content='"+nr+"' where id = "+1);
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/scienceResearch/scienceDir.jsp").forward(request, response);
			}else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/scienceResearch/scienceDir.jsp").forward(request, response);
			}  
		}else if(method.equals("project")){  //�о���Ŀ
			String nr = request.getParameter("content1"); 
			if(nr==null){
				nr="����";
			}
			int flag = cBean.comUp("update Project set content='"+nr+"' where id = "+1);
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/scienceResearch/sciencePro.jsp").forward(request, response);
			}else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/scienceResearch/sciencePro.jsp").forward(request, response);
			}  
		} 
		
		else if(method.equals("upContact")){  //��ַ
			String id = request.getParameter("id"); 
			int i = Integer.parseInt(id);
			String address = request.getParameter("address"); 
			String postcodes = request.getParameter("postcodes"); 
			String phone = request.getParameter("phone"); 
			String email = request.getParameter("email"); 
//			System.out.println(id + address + postcodes + phone + email);
//			if(address==null){
//				address="����";
//			}
//			if(postcodes==null){
//				postcodes="����";
//			}
//			if(phone==null){
//				phone="����";
//			}
//			if(email==null){
//				email="����";
//			}
			int flag = cBean.comUp("update contact set address='"+address+"',postcodes='"+postcodes+"',phone='"+phone+"',email='"+email+"' where id="+i);
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/contact/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/contact/index.jsp").forward(request, response);
			}  
		} 
		
		else if(method.equals("addPost")){  //�о�����Ϣ    
			String level = request.getParameter("level"); 
			String name = request.getParameter("name"); 
			String content = request.getParameter("content1"); 
			if(content==null)content="����";
			int flag = cBean.comUp("insert into postgraduate(level,name,content)  values('"+level+"','"+name+"','"+content+"')");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/talented/postgraduate/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/talented/postgraduate/index.jsp").forward(request, response);
			} 
		} else if(method.equals("upPost")){ //�޸� �о�����Ϣ 
			String id=request.getParameter("id");
			String level = request.getParameter("level"); 
			String name = request.getParameter("name"); 
			String content = request.getParameter("content1"); 
			if(content==null){
				content="����";
			}
			int flag = cBean.comUp("update postgraduate set level='"+level+"',name='"+name+"',content='"+content+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/talented/postgraduate/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/talented/postgraduate/index.jsp").forward(request, response);
			}  
		}else if(method.equals("delPost")){//ɾ�� �о�����Ϣ
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from postgraduate where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/talented/postgraduate/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "ϵͳά���У����Ժ����ԣ�");
				request.getRequestDispatcher("admin/talented/postgraduate/index.jsp").forward(request, response);
			}
		}
		
		else if(method.equals("addAppear")){  //ѧ�����   
			String title = request.getParameter("title"); 
			String content = request.getParameter("content1"); 
			if(content==null)content="����";
			int flag = cBean.comUp("insert into stuAppearance(title,content,date)  values('"+title+"','"+content+"','"+date+"')");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/talented/stuAppearance/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/talented/stuAppearance/index.jsp").forward(request, response);
			} 
		} else if(method.equals("upAppear")){ //�޸� ѧ�����
			String id=request.getParameter("id");
			String title = request.getParameter("title");  
			String content = request.getParameter("content1"); 
			if(content==null){
				content="����";
			}
			int flag = cBean.comUp("update stuAppearance set title='"+title+"',content='"+content+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/talented/stuAppearance/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/talented/stuAppearance/index.jsp").forward(request, response);
			}  
		}else if(method.equals("delAppear")){//ɾ�� ѧ�����
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from stuAppearance where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/talented/stuAppearance/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "ϵͳά���У����Ժ����ԣ�");
				request.getRequestDispatcher("admin/talented/stuAppearance/index.jsp").forward(request, response);
			}
		}
		
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
