<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=gb2312"%>
<%@ include file="base/head.jsp"%>
<div class="bannerWrap">
	<div class="bannerOver"></div>

	<!-- 首页 -->

	<div id="slides">
		<div class="slides_control" style="position: relative; width: 3060px; height: 12px; left: -1020px;">

			<a style="position: absolute; top: 0px; left: 1020px; z-index: 0; display: none;">
				<img src="<%=basePath%>images/01.jpg" width=1018 height=265></a> 
			<a style="position: absolute; top: 0px; left: 1020px; z-index: 0; display: none;">
				<img src="<%=basePath%>images/02.jpg" width=1018 height=265></a> 
			<a style="position: absolute; top: 0px; left: 1020px; z-index: 0; display: none;">
				<img src="<%=basePath%>images/03.jpg" width=1018 height=265></a> 
			<a style="position: absolute; top: 0px; left: 1020px; z-index: 0; display: none;">
				<img src="<%=basePath%>images/04.jpg" width=1018 height=265></a>
		</div>

	</div>
</div>

<div class="main">
	<div class="rmain">

		<div class="rlist">
			<table width="100%" border="0" align="center" cellpadding="4" cellspacing="0" class="rtable">
				<tr>
					<!-- 实验室新闻动态 -->
					<td width="310" >
						<table width="100%" border="0" cellspacing="0" cellpadding="0" >
							<tr>
								<td height="40" >
									<h2>
										<span>新闻动态</span>
										<a href="news.jsp" target="_blank"><span style="float: right;"> More ...</span> </a>										
									</h2>
								</td>
							</tr>
							
							<%
							List pagelist3 = cb.getCom("select * from xw order by id desc limit 10 ", 5);
							if (!pagelist3.isEmpty()) {
								for (int i = 0; i < pagelist3.size(); i++) {
									List pagelist2 = (ArrayList) pagelist3.get(i);
							%>
							<tr class="tr<%=(i) % 2%>">
								<td class="rltitle dotlist"  width="120">
									<a  href="<%=basePath%>newsInfo.jsp?id=<%=pagelist2.get(0).toString()%>">[<%=pagelist2.get(4).toString()%>]<%=pagelist2.get(1).toString()%></a>
								</td>
							</tr>
							<%
								}
							}
							%> 
						</table>
					</td>
					
					<td width="20"></td>
					
					<!-- 通知 -->
					<td width="310" >
						<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 0">
							<tr>
								<td height="40">
									<h2>
										<span>通知</span>
										<a href="notice.jsp" target="_blank"><span style="float: right;"> More ...</span> </a>										
									</h2>
								</td>
							</tr>
							<%
							List ttlist = cb.getCom("select * from qc order by id desc limit 10", 7);
							if (!ttlist.isEmpty()) {
								for (int i = 0; i < ttlist.size(); i++) {
									List list2 = (ArrayList) ttlist.get(i);
							%>
							<tr class="tr<%=(i) % 2%>">
								<td class="rltitle dotlist">
									<a href="<%=basePath%>noticeInfo.jsp?id=<%=list2.get(0).toString()%>">[<%=list2.get(6).toString()%>]<%=list2.get(1).toString()%></a>
								</td>
					
							</tr>
							<%
								}
							}
							%> 
						</table>
					</td>
					
					<td width="20"></td>
					
					<!-- 下载内容 -->
					<td width="310" >
						<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 0"  >
							<tr>
								<td height="40">
									<h2>
										<span>文件下载</span>
										<a href="downloadFile.jsp" target="_blank"><span style="float: right;"> More ...</span> </a>										
									</h2>
								</td>
							</tr>
							<%
							List downList = cb.getCom("select * from cs order by id desc limit 10", 5);
							if (!downList.isEmpty()) {
								for (int i = 0; i < downList.size(); i++) {
									List downList2 = (ArrayList) downList.get(i);
							%>
							<tr class="tr<%=(i) % 2%>">
								<td class="rltitle dotlist">
									<a href="<%=basePath%>downloadFileInfo.jsp?id=<%=downList2.get(0).toString()%>">[<%=downList2.get(4).toString()%>]<%=downList2.get(1).toString()%></a>
								</td>
					
							</tr>
								<%
									}
								}
								%> 
						</table>
					</td>
					
				</tr>
				
			</table>
			
			
		</div>
	</div>
</div>
<%@ include file="base/foot.jsp"%>
