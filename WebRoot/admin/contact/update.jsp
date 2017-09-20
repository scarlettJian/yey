<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=gb2312"%>
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<%=basePath%>images/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>images/css/css.css" />
<script type="text/javascript"
	src="<%=basePath%>images/js/jquery1.9.0.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>images/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>images/js/sdmenu.js"></script>
<script type="text/javascript"
	src="<%=basePath%>images/js/laydate/laydate.js"></script>

<link rel="stylesheet"
	href="<%=basePath%>editor/themes/default/default.css" />
<link rel="stylesheet"
	href="<%=basePath%>editor/plugins/code/prettify.css" />
<script charset="utf-8" src="<%=basePath%>editor/kindeditor.js"></script>
<script charset="utf-8" src="<%=basePath%>editor/lang/zh_CN.js"></script>
<script charset="utf-8"
	src="<%=basePath%>editor/plugins/code/prettify.js"></script>

</head>
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

	String admin = (String) session.getAttribute("user");
	if (admin == null) {
		response.sendRedirect(path + "index.jsp");
	} else {
		String method = request.getParameter("method");
		String id = "";
		String address = "";
		String postcodes = "";
		String phone = "";
		String email = "";
		if (method.equals("upContact")) {
			id = request.getParameter("id");
			List jlist = cb.get1Com("select * from contact", 5);
			address = jlist.get(1).toString();
			postcodes = jlist.get(2).toString();
			phone = jlist.get(3).toString();
			email = jlist.get(4).toString();
		}
		
		
%>
<body>
	<div class="right_cont">
		<div class="title_right">
			<strong>地址管理</strong>
		</div>
		<div style="width: 900px; margin: auto;">
			<form action="<%=basePath%>ComServlet" method="post" name="form1" >
				
				<input type="hidden" name="method" value="<%=method%>" /> 
				<input type="hidden" name="id" value="<%=id%>" />
				<table class="table table-bordered">
					<tr>
						<td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">地址：</td>
						<td><input type="text" name="address" class="span4"
							value="<%=address%>" required /></td>
					</tr>

					<tr>
						<td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">邮编：</td>
						<td><input type="text" name="postcodes" class="span4"
							value="<%=postcodes%>" required /></td>
					</tr>
					<tr>
						<td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">联系电话：</td>
						<td><input type="text" name="phone" class="span4"
							value="<%=phone%>" required /></td>
					</tr>
					<tr>
						<td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">邮箱：</td>
						<td><input type="text" name="email" class="span4"
							value="<%=email%>" required /></td>
					</tr>

					<tr>
						<td class="text-center" colspan="2"><input type="submit"
							value="确定" class="btn btn-info  " style="width: 80px;" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
<%
	}
%>