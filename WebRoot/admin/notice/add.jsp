<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=gb2312"%>
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
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
<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content1"]', {
				cssPath : '<%=basePath%>editor/plugins/code/prettify.css',
				uploadJson : '<%=basePath%>editor/jsp/upload_json.jsp',
				fileManagerJson : '<%=basePath%>editor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
				var self = this;
				K.ctrl(document, 13, function() {
					self.sync();
					document.forms['form1'].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
					document.forms['form1'].submit();
				});
			}
		});
		prettyPrint();
	});
</script>
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
		String mc = "";
		String zz = "";
		String fl = "";
		String pic = "";
		String nr = "";
		if (method.equals("upqc")) {
			id = request.getParameter("id");
			List jlist = cb.get1Com("select * from qc where id='" + id + "'", 6);
			mc = jlist.get(1).toString();
			zz = jlist.get(2).toString();
			fl = jlist.get(3).toString();
			pic = jlist.get(4).toString();
			nr = jlist.get(5).toString();
			htmlData = nr;
		}
%>
<body>
	<div class="right_cont">
		<div class="title_right">
			<strong>�׶�԰��ɹ���</strong>
		</div>
		<div style="width: 900px; margin: auto;">
			<form action="<%=basePath%>UpServlet" method="post" name="form1"
				enctype="multipart/form-data">
				<table class="table table-bordered">
					<tr>
						<input type="hidden" name="method" value="<%=method%>" />
						<input type="hidden" name="id" value="<%=id%>" />
						<td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">��Ϣ���⣺</td>
						<td><input type="text" name="mc" class="span4"
							value="<%=mc%>" required /></td>
					</tr>

					<tr>
						<td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">��Ϣ���ͣ�</td>
						<td><input type="text" name="zz" class="span4"
							value="<%=zz%>" required /></td>
					</tr>
					<tr>
						<td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">ѧϰ�ص㣺</td>
						<td><input type="text" name="fl" class="span4"
							value="<%=fl%>" required /></td>
					</tr>
					<%
						if (method.equals("upqc")) {
					%>
					<tr>
						<td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">�ϴ�ͼƬ��</td>
						<td><input type=file name="pic" class="span4" /> jpg��ʽͼƬ</td>
					</tr>
					<%
						} else {
					%>
					<tr>
						<td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">�ϴ�ͼƬ��</td>
						<td><input type=file name="pic" class="span4" required />
							jpg��ʽͼƬ</td>
					</tr>
					<%
						}
					%>
					<tr>
						<td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">��ϸ˵����</td>
						<td><textarea name="content1" cols="100" rows="8"
								style="width: 700px; height: 400px; visibility: hidden;"><%=htmlspecialchars(htmlData)%></textarea></td>
					</tr>
					<tr>
						<td class="text-center" colspan="2"><input type="submit"
							value="ȷ��" class="btn btn-info  " style="width: 80px;" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
<%
	}
%>
<%!private String htmlspecialchars(String str) {
		str = str.replaceAll("&", "&amp;");
		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");
		str = str.replaceAll("\"", "&quot;");
		return str;
	}%>