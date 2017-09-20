<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<base href="http://<%=request.getServerName() %>:<%=request.getServerPort() %><%=request.getContextPath() %>/">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<%=basePath %>images/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath %>images/css/css.css" />
<script type="text/javascript" src="<%=basePath %>images/js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="<%=basePath %>images/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>images/js/sdmenu.js"></script>
<script type="text/javascript" src="<%=basePath %>images/js/laydate/laydate.js"></script>
</HEAD>
<%
	String username=(String)session.getAttribute("user");  
	if(username==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{ 
%>
<body>
<div class="left">
     
<script type="text/javascript">
var myMenu;
window.onload = function() {
	myMenu = new SDMenu("my_menu");
	myMenu.init();
};
</script>

<div id="my_menu" class="sdmenu">

	<div class="collapsed">
		<span>������Ϣ����</span>
		<a href="admin/system/editpwd.jsp" target="MainFrame">������Ϣ����</a> 
	</div>
	
	 <div class="collapsed">
		<span>ѧУ��������</span>
		<a href="admin/summary/libSummMana.jsp" target="MainFrame">ʵ���Ҹſ�����</a> 
	</div>
	<div class="collapsed">
		<span>���Ŷ�̬����</span>
		<a href="<%=basePath %>admin/news/index.jsp" target="MainFrame">���Ŷ�̬����</a> 
		<a href="<%=basePath %>admin/news/add.jsp?method=addxw" target="MainFrame">�������Ŷ�̬</a> 
		 <a href="<%=basePath %>admin/news/search.jsp" target="MainFrame">���Ŷ�̬��ѯ</a>  
	</div> 
	<div class="collapsed">
		<span>֪ͨ����</span>
		<a href="<%=basePath %>admin/notice/index.jsp" target="MainFrame">֪ͨ����</a> 
		<a href="<%=basePath %>admin/notice/add.jsp?method=addqc" target="MainFrame">����֪ͨ��Ϣ</a> 
		 <a href="<%=basePath %>admin/notice/search.jsp" target="MainFrame">֪ͨ��ѯ</a>  
	</div> 
	<div class="collapsed">
		<span>���ع���</span>
		<a href="<%=basePath %>admin/downloadFile/index.jsp" target="MainFrame">���ع���</a> 
		<a href="<%=basePath %>admin/downloadFile/add.jsp?method=addcs" target="MainFrame">������������</a> 
		 <a href="<%=basePath %>admin/downloadFile/search.jsp" target="MainFrame">�������ݲ�ѯ</a>  
	</div>  
	<div class="collapsed">
		<span>ѧ���о�����</span>
		<a href="<%=basePath %>admin/scienceResearch/scienceDir.jsp" target="MainFrame">�о��������</a> 
		<a href="<%=basePath %>admin/scienceResearch/sciencePro.jsp" target="MainFrame">�о���Ŀ����</a> 
	</div> 
	
	<div class="collapsed">
		<span>�˲���������</span>
		<div class="collapsed">
			<span style="color: red">�о�������</span>
			<a href="<%=basePath %>admin/talented/postgraduate/index.jsp" target="MainFrame">�о�����̬����</a> 
			<a href="<%=basePath %>admin/talented/postgraduate/add.jsp?method=addPost" target="MainFrame">����о���</a> 
			<a href="<%=basePath %>admin/talented/postgraduate/search.jsp" target="MainFrame">�о�����ѯ</a>  
		</div>
		<div class="collapsed">
			<span style="color: red">����������</span>
			<a href="<%=basePath %>admin/talented/undergraduate/index.jsp" target="MainFrame">��������̬����</a> 
			<a href="<%=basePath %>admin/talented/undergraduate/add.jsp?method=addGrad" target="MainFrame">��ӱ�����</a> 
			<a href="<%=basePath %>admin/talented/undergraduate/search.jsp" target="MainFrame">��������ѯ</a>  
		</div> 
		<div class="collapsed">
			<span style="color: red">ѧ����ɹ���</span>
			<a href="<%=basePath %>admin/talented/stuAppearance/index.jsp" target="MainFrame">ѧ����ɶ�̬����</a> 
			<a href="<%=basePath %>admin/talented/stuAppearance/add.jsp?method=addAppear" target="MainFrame">����ѧ����̬</a> 
			<a href="<%=basePath %>admin/talented/stuAppearance/search.jsp" target="MainFrame">ѧ����̬��ѯ</a>  
		</div>
		
	</div> 
	<div class="collapsed">
		<span>��ַ����</span>
		<a href="<%=basePath %>admin/contact/index.jsp" target="MainFrame">��ַ����</a> 
	</div> 
	 
 	<div class="collapsed">
		<span>ע���˳�ϵͳ</span>
		<a onclick="if (confirm('ȷ��Ҫ�˳���')) return true; else return false;" href="<%=basePath %>AdminServlet?method=adminexit" target="_top" >ע���˳�ϵͳ</a>
	</div> 
</div>
     </div>
     <div class="Switch"></div>
     <script type="text/javascript">
	$(document).ready(function(e) {
    $(".Switch").click(function(){
	$(".left").toggle();
	 
		});
});
</script> 
</body>
<%} %>

</html>
