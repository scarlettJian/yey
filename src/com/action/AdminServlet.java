package com.action;
/**
 * ����Ա��½ ���� �޸� ɾ��  
 */
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean; 
import com.util.Constant;
import com.util.MD5;

public class AdminServlet extends HttpServlet {

	public AdminServlet() {
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
		String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		try{
			String method=request.getParameter("method").trim();
			ComBean cBean = new ComBean();
			HttpSession session = request.getSession();   
			if(method.equals("one")){//����Ա��¼
				String username = request.getParameter("username");
				String password = request.getParameter("password");  
				String str=cBean.getString("select realname from admin where username='"+username+"' and  password='"+password+"' ");
				if(str==null){
					request.setAttribute("message", "��¼��Ϣ����");
					request.getRequestDispatcher("login.jsp").forward(request, response); 
				} else{
					session.setAttribute("user", username); 
					request.getRequestDispatcher("admin/index.jsp").forward(request, response); 
				}  
			} else if(method.equals("uppwd")){//�޸�����
				String username=(String)session.getAttribute("user"); 
				String oldpwd = request.getParameter("oldpwd"); 
				String newpwd = request.getParameter("newpwd"); 
				String str=cBean.getString("select id from admin where username='"+username+"' and  password='"+oldpwd+"'");
				if(str==null){
					request.setAttribute("message", "ԭʼ������Ϣ����");
					request.getRequestDispatcher("admin/system/editpwd.jsp").forward(request, response); 
				} else{
					int flag=cBean.comUp("update admin set password='"+newpwd+"' where username='"+username+"'");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "�����ɹ���");
						request.getRequestDispatcher("admin/system/editpwd.jsp").forward(request, response); 
					} else { 
						request.setAttribute("message", "����ʧ�ܣ�");
						request.getRequestDispatcher("admin/system/editpwd.jsp").forward(request, response); 
					}
				}
			} else if(method.equals("adminexit")){//�˳���¼
				session.removeAttribute("user");  
				request.getRequestDispatcher("index.jsp").forward(request, response); 
			} else if(method.equals("addm")){//����ϵͳ�û�
				String username = request.getParameter("username"); 
				String password = request.getParameter("password"); 
				String realname = request.getParameter("realname"); 
				String sex = request.getParameter("sex"); 
				String age = request.getParameter("age"); 
				String address = request.getParameter("address"); 
				String tel = request.getParameter("tel");
				String str=cBean.getString("select id from admin where username='"+username+"'");
				if(str==null){ 
						int flag=cBean.comUp("insert into admin(username,password,realname,sex,age,address,tel,addtime) " +
								"values('"+username+"','"+password+"','"+realname+"','"+sex+"','"+age+"','"+address+"','"+tel+"','"+date+"')");
						if(flag == Constant.SUCCESS){ 
							request.setAttribute("message", "�����ɹ���");
							request.getRequestDispatcher("admin/system/index.jsp").forward(request, response); 
						} else { 
							request.setAttribute("message", "����ʧ�ܣ�");
							request.getRequestDispatcher("admin/system/index.jsp").forward(request, response); 
						} 
				} else{
					request.setAttribute("message", "���û����Ѵ��ڣ�");
					request.getRequestDispatcher("admin/system/index.jsp").forward(request, response); 
				} 
			} else if(method.equals("upm")){//�޸�ϵͳ�û�
				String id = request.getParameter("id");
				String password = request.getParameter("password");
				String realname = request.getParameter("realname"); 
				String sex = request.getParameter("sex"); 
				String age = request.getParameter("age"); 
				String address = request.getParameter("address"); 
				String tel = request.getParameter("tel"); 
				int flag=cBean.comUp("update admin set password='"+password+"',realname='"+realname+"',sex='"+sex+"',age='"+age+"'," +
						"address='"+address+"',tel='"+tel+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/system/index.jsp").forward(request, response); 
				} else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/system/index.jsp").forward(request, response); 
				}
			} else if(method.equals("delm")){//ɾ��ϵͳ�û�
				String id = request.getParameter("id");  
				int flag=cBean.comUp("delete from admin where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/system/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/system/index.jsp").forward(request, response); 
				}
			} else{//�޲�������ת������ҳ��
				request.getRequestDispatcher("error.jsp").forward(request, response);
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
