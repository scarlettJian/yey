package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;
/**
 * �����û�ע��
 * @author jiandiluoluo
 *
 */
public class MemberServlet extends HttpServlet {

	public MemberServlet() {
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
		String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		String method = request.getParameter("method");
		if(method.equals("mreg")){ //�û�ע��
			String username = request.getParameter("username"); 
			String password = request.getParameter("password"); 
			String realname = request.getParameter("realname"); 
			String sex = request.getParameter("sex"); 
			String age = request.getParameter("age"); 
			String address = request.getParameter("address"); 
			String email = request.getParameter("email");
			
			if(username.equals("admin")){
				request.setAttribute("message", "�Ƿ����û�����");
				request.getRequestDispatcher("reg.jsp").forward(request, response); 
			} else{
				String str=cBean.getString("select id from member where username='"+username+"'");
				if(str==null){
					int flag=cBean.comUp("insert into member(username,password,realname,sex,age,address,email,regtime) " +
							"values('"+username+"','"+password+"','"+realname+"','"+sex+"','"+age+"','"+address+"','"+email+"','"+date+"')");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "ע��ɹ����¼��");
						request.getRequestDispatcher("login.jsp").forward(request, response); 
					} else { 
						request.setAttribute("message", "����ʧ�ܣ�");
						request.getRequestDispatcher("reg.jsp").forward(request, response); 
					}
				} else{
					request.setAttribute("message", "���û����Ѵ��ڣ�");
					request.getRequestDispatcher("reg.jsp").forward(request, response); 
				} 
			}
			
		} else if(method.equals("mupreg")){ //�û��޸�ע������
			String member=(String)session.getAttribute("member"); 
			String realname = request.getParameter("realname"); 
			String sex = request.getParameter("sex"); 
			String age = request.getParameter("age"); 
			String address = request.getParameter("address"); 
			String email = request.getParameter("email"); 
			int flag=cBean.comUp("update member set realname='"+realname+"',sex='"+sex+"',age='"+age+"'," +
					"address='"+address+"',email='"+email+"' where username='"+member+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("member/info/index.jsp").forward(request, response); 
			} else { 
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("member/info/index.jsp").forward(request, response); 
			}
		} else if(method.equals("mlogin")){//�û���¼ 
			String username = request.getParameter("username"); 
			String password = request.getParameter("password");  
			 
				String str=cBean.getString("select id from member where username='"+username+"' and  password='"+password+"'  and ifuse='����'");
				if(str==null){
					request.setAttribute("message", "��¼��Ϣ����");
					request.getRequestDispatcher("login.jsp").forward(request, response); 
				}
				else{
					session.setAttribute("member", username); 
					request.getRequestDispatcher("member/index.jsp").forward(request, response); 
				} 
		} else if(method.equals("lost")){ //��ʧ����
			request.setAttribute("message", "�������Ѿ�����ע�����䣡");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} else if(method.equals("memberexit")){ //�˳���¼
			session.removeAttribute("member");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} else if(method.equals("muppwd")){//�û��޸�����
			String member=(String)session.getAttribute("member"); 
			String oldpwd = request.getParameter("oldpwd"); 
			String newpwd = request.getParameter("newpwd"); 
			String str=cBean.getString("select id from member where username='"+member+"' and  password='"+oldpwd+"'");
			if(str==null){
				request.setAttribute("message", "ԭʼ������Ϣ����");
				request.getRequestDispatcher("member/info/editpwd.jsp").forward(request, response); 
			} else{
				int flag=cBean.comUp("update member set password='"+newpwd+"' where username='"+member+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("member/info/editpwd.jsp").forward(request, response); 
				} else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("member/info/editpwd.jsp").forward(request, response); 
				}
			}
		} else if(method.equals("delm")){//ɾ���û�
			String id = request.getParameter("id");  
			int flag=cBean.comUp("delete from member where id='"+id+"'");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/member/index.jsp").forward(request, response); 
			} else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/member/index.jsp").forward(request, response); 
			}
		} else if(method.equals("ifusem")){//ͣ��/���� �û�
			String id = request.getParameter("id");  
			String sql="";
			String str=cBean.getString("select ifuse from member where id='"+id+"'");
			if(str.equals("����")){
				sql="update member set ifuse='ͣ��' where id='"+id+"'";
			} else{
				sql="update member set ifuse='����' where id='"+id+"'";
			}
			int flag=cBean.comUp(sql);
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/member/index.jsp").forward(request, response); 
			} else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/member/index.jsp").forward(request, response); 
			}
		} else if(method.equals("delm2")){//ɾ���û�
			String id = request.getParameter("id");  
			int flag=cBean.comUp("delete from member where id='"+id+"'");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/member/index2.jsp").forward(request, response); 
			} else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/member/index2.jsp").forward(request, response); 
			}
		} else if(method.equals("ifusem2")){//ͣ��/���� �û�
			String id = request.getParameter("id");  
			String sql="";
			String str=cBean.getString("select ifuse from member where id='"+id+"'");
			if(str.equals("����")){
				sql="update member set ifuse='ͣ��' where id='"+id+"'";
			} else{
				sql="update member set ifuse='����' where id='"+id+"'";
			}
			int flag=cBean.comUp(sql);
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/member/index2.jsp").forward(request, response); 
			} else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/member/index2.jsp").forward(request, response); 
			}
		} else if(method.equals("delm3")){//ɾ���û�
			String id = request.getParameter("id");  
			int flag=cBean.comUp("delete from member where id='"+id+"'");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/member/index3.jsp").forward(request, response); 
			} else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/member/index3.jsp").forward(request, response); 
			}
		} else if(method.equals("ifusem3")){//ͣ��/���� �û�
			String id = request.getParameter("id");  
			String sql="";
			String str=cBean.getString("select ifuse from member where id='"+id+"'");
			if(str.equals("����")){
				sql="update member set ifuse='ͣ��' where id='"+id+"'";
			} else{
				sql="update member set ifuse='����' where id='"+id+"'";
			}
			int flag=cBean.comUp(sql);
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/member/index3.jsp").forward(request, response); 
			} else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/member/index3.jsp").forward(request, response); 
			}
		}
	}
	
	public void init() throws ServletException {
		// Put your code here
	}

}
