<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=gb2312"%>
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta charset="gb2312">
<meta name="robots" content="index, follow">
<meta name="googlebot" content="index, follow">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<link rel="stylesheet" href="<%=basePath%>images/style.css?v=0310"
	media="all" id="base">

<script language="javascript"
	src="<%=basePath%>images/jquery-1.7.1.min.js"></script>
<script language="javascript" src="<%=basePath%>images/jquery.main.js"></script>
<script language="javascript"
	src="<%=basePath%>images/slides.min.jquery.js"></script>
<script language="javascript"
	src="<%=basePath%>images/jquery.KinSlideshow.js?v=0123"></script>
<script>
	window.onerror = function() {
		return true;
	}
</script>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<style type="text/css">
.nav table th  .nav2List a, 
.nav table th  .nav2List a:active, 
.nav table th  .nav2List a:visited
	{
	font-size: 14px;
	padding: 0 11px;
}

.header-link {
	right: 20px;
}

.header-link .setlang, .header-link .setlang:active, .header-link .setlang:visited
	{
	width: 50px;
}


</style>
<script>
	$(function() {
		var adli = $('.ad-thumbs-list');
		if (adli.length == 1) {
			var adw = $('.ad-thumbs-list img').length * 86;
			//document.title+=adw;
			$('.ad-thumbs-list').width(adw);
		}
		//$('.ad-thumbs-list').width(8000);
	});
</script>
</head>
<body>

	<div class="body">
		<div class="headerWrap">
			<!-- ͼƬ -->
			<div class="header">
				<div><span>�˹�����ʵ����</span></div>
				<div class="header-link">
					<a class="sethome" href="####"><span>��Ϊ��ҳ</span></a> &nbsp;&nbsp; &nbsp;&nbsp; 
					<a class="sethome" href="####" target="_blank"><span>�����ղ�</span></a>&nbsp;&nbsp; 
					<a class="sethome" href="<%=basePath%>contact.jsp" target="_blank"><span>��ϵ����</span></a>&nbsp;&nbsp; 
					<a class="sethome" href="<%=basePath%>login.jsp" ><span>��վ��̨</span></a>
				</div>
			</div>

			
			
			</div> --%>
			<div class="nav">
				
				<table id="menu">
					<tbody>
						<tr>

							<th><a class="nav1" href="<%=basePath%>index.jsp"><span>��ҳ</span></a>
							</th>
							<th><a class="nav1" href="<%=basePath%>libSummary.jsp"><span>��Ա</span></a>
							</th>

							<th><a class="nav1" href="<%=basePath%>scienceResearch.jsp"><span>�о�</span></a>
								<!-- <ul>
									<li><a href="###">�о�����</a></li>
									<li><a href="###">�о���Ŀ</a></li>
								</ul> -->
							</th>

							<th><a class="nav1" href="<%=basePath%>interflow.jsp"><span>�ɹ�</span></a>
							</th> 

							<%-- <th><a class="nav1" href="<%=basePath%>partner.jsp"><span>������λ</span></a>
							</th>


							<th><a class="nav1" href="<%=basePath%>talentedPost.jsp"><span>�˲�����</span></a>
							</th>

							<th><a class="nav1" href="<%=basePath%>contact.jsp"><span>��ϵ����</span></a>
							</th> --%>
						</tr>
					</tbody>
				</table> 
			</div>
		</div>
	</div>
	<%
		String message = (String) request.getAttribute("message");
		if (message == null) {
			message = "";
		}
		if (!message.trim().equals("")) {
			out.println("<script language='javascript'>");
			out.println("alert('" + message + "');");
			out.println("</script>");
		}
		request.removeAttribute("message");
	%>