<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=gb2312"%>
<%@ include file="base/head.jsp"%>
<!-- ѧ���о����� -->
<link href="images/css/style.css" rel="stylesheet" type="text/css">

<div class="main">
	<div class="narea">
		<div>
			<img height="126" src="<%=basePath%>images/zgm.jpg" width="1020">
		</div>
	</div>
	<table>
		<tr>
			<td width="240">
				<ul class="ul">
					<li class="li"><A class="hover" href="scienceResearch.jsp">�о�����</A></li>
					<li class="li"><A href="scienceResearchPro.jsp">�о���Ŀ</A></li>
				</ul>

			</td>
			
			<td width="20"></td>

			<td width="800">
				<div >
					<h2>�о�����</h2>
				</div>
				<div>
					<img alt="" src="images/content_line.png">
				</div>
				<%
				List dirList=cb.getCom("select * from Direction ",2);
				if(!dirList.isEmpty()){
					for(int i = 0;i < dirList.size();i++){
						List list = (ArrayList)dirList.get(i);
				%>
				
				<div><%=list.get(1).toString() %></div>
				
				<% 
					}
				}
				%>
				
			</td>



		</tr>
	</table>


</div>






<%@ include file="base/foot.jsp"%>