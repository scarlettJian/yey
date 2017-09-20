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
		<span>密码信息管理</span>
		<a href="admin/system/editpwd.jsp" target="MainFrame">密码信息管理</a> 
	</div>
	
	 <div class="collapsed">
		<span>学校概述管理</span>
		<a href="admin/summary/libSummMana.jsp" target="MainFrame">实验室概况管理</a> 
	</div>
	<div class="collapsed">
		<span>新闻动态管理</span>
		<a href="<%=basePath %>admin/news/index.jsp" target="MainFrame">新闻动态管理</a> 
		<a href="<%=basePath %>admin/news/add.jsp?method=addxw" target="MainFrame">增加新闻动态</a> 
		 <a href="<%=basePath %>admin/news/search.jsp" target="MainFrame">新闻动态查询</a>  
	</div> 
	<div class="collapsed">
		<span>通知管理</span>
		<a href="<%=basePath %>admin/notice/index.jsp" target="MainFrame">通知管理</a> 
		<a href="<%=basePath %>admin/notice/add.jsp?method=addqc" target="MainFrame">增加通知信息</a> 
		 <a href="<%=basePath %>admin/notice/search.jsp" target="MainFrame">通知查询</a>  
	</div> 
	<div class="collapsed">
		<span>下载管理</span>
		<a href="<%=basePath %>admin/downloadFile/index.jsp" target="MainFrame">下载管理</a> 
		<a href="<%=basePath %>admin/downloadFile/add.jsp?method=addcs" target="MainFrame">新增下载内容</a> 
		 <a href="<%=basePath %>admin/downloadFile/search.jsp" target="MainFrame">下载内容查询</a>  
	</div>  
	<div class="collapsed">
		<span>学术研究管理</span>
		<a href="<%=basePath %>admin/scienceResearch/scienceDir.jsp" target="MainFrame">研究方向管理</a> 
		<a href="<%=basePath %>admin/scienceResearch/sciencePro.jsp" target="MainFrame">研究项目管理</a> 
	</div> 
	
	<div class="collapsed">
		<span>人才培养管理</span>
		<div class="collapsed">
			<span style="color: red">研究生管理</span>
			<a href="<%=basePath %>admin/talented/postgraduate/index.jsp" target="MainFrame">研究生动态管理</a> 
			<a href="<%=basePath %>admin/talented/postgraduate/add.jsp?method=addPost" target="MainFrame">添加研究生</a> 
			<a href="<%=basePath %>admin/talented/postgraduate/search.jsp" target="MainFrame">研究生查询</a>  
		</div>
		<div class="collapsed">
			<span style="color: red">本科生管理</span>
			<a href="<%=basePath %>admin/talented/undergraduate/index.jsp" target="MainFrame">本科生动态管理</a> 
			<a href="<%=basePath %>admin/talented/undergraduate/add.jsp?method=addGrad" target="MainFrame">添加本科生</a> 
			<a href="<%=basePath %>admin/talented/undergraduate/search.jsp" target="MainFrame">本科生查询</a>  
		</div> 
		<div class="collapsed">
			<span style="color: red">学生风采管理</span>
			<a href="<%=basePath %>admin/talented/stuAppearance/index.jsp" target="MainFrame">学生风采动态管理</a> 
			<a href="<%=basePath %>admin/talented/stuAppearance/add.jsp?method=addAppear" target="MainFrame">新增学生动态</a> 
			<a href="<%=basePath %>admin/talented/stuAppearance/search.jsp" target="MainFrame">学生动态查询</a>  
		</div>
		
	</div> 
	<div class="collapsed">
		<span>地址管理</span>
		<a href="<%=basePath %>admin/contact/index.jsp" target="MainFrame">地址管理</a> 
	</div> 
	 
 	<div class="collapsed">
		<span>注销退出系统</span>
		<a onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="<%=basePath %>AdminServlet?method=adminexit" target="_top" >注销退出系统</a>
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
