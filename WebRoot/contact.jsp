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
					<li class="li"><A class="hover" href="index.jsp">��ҳ</A></li>
					<li class="li"><A href="libSummary.jsp">�ſ�</A></li>
					<li class="li"><A href="scienceResearch.jsp">ѧ���о�</A></li>
					<li class="li"><A href="interflow.jsp">���Ž���</A></li>
					<li class="li"><A href="partner.jsp">������λ</A></li>
					<li class="li"><A href="talentedPost.jsp">�˲�����</A></li>
					<li class="li"><A href="contact.jsp">��ϵ����</A></li>
				</ul>

			</td>
			
			<td width="20"></td>

			<td width="800">
				<%
				List list = cb.get1Com("select * from contact", 5);
				System.out.println(list);
				%>
				<table width="100%" border="0" >
					<tr>
						<td>
						
							<table width="100%" border="0" cellspacing="4" cellpadding="4">
								<tr>
									<td><span>��ַ��</span></td>
									<td><span><%=list.get(1).toString() %></span></td>
								</tr>
								<tr>
									<td><span>�ʱࣺ</span></td>
									<td><span><%=list.get(2).toString() %></span></td>
								</tr>
								<tr>
									<td><span>�绰��</span></td>
									<td><span><%=list.get(3).toString() %></span></td>
								</tr>
								<tr>
									<td><span>Email��</span></td>
									<td><span><%=list.get(4).toString() %></span></td>
								</tr>
							</table>
						
						</td>
					</tr>
					
					<!-- ��ͼ -->
					<tr>
						<td></td>
					</tr>
					
				
				</table>
				
				
				
			</td>



		</tr>
	</table>


</div>
<%@ include file="base/foot.jsp"%>