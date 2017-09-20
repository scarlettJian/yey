<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.DBO"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=gb2312"%>
<%@ include file="base/head.jsp"%>
<!-- 人才培养 -->
<link href="images/css/style.css" rel="stylesheet" type="text/css">
<style>
.BMV_Content {
	width: 735px;
	text-align: left;
	vertical-align: top;
	clear: left;
	color: #666;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 16px;
	padding-top: 2px;
	padding-bottom: 5px;
	padding-left: 0px;
	margin-top: 5px;
	margin-right: 0px;
	margin-bottom: 10px;
}

.nameLine {
	float: left;
	padding: 3px;
	font-size: 16px;
	margin-top: 2px;
	margin-right: 12px;
	margin-bottom: 3px;
	margin-left: 12px;
	color: #00F;
	width: 64px;
}

.nameLine a:hover {
	color: red;
}
</style>
<div class="main">
	<div class="narea">
		<div>
			<img height="126" src="<%=basePath%>images/zgm.jpg" width="1020">
		</div>
	</div>

	<div class="narea">
		<table>
			<tr>
				<td width="240">
					<ul class="ul">
						<li class="li"><A class="hover" href="talentedPost.jsp">硕士研究生</A></li>
						<li class="li"><A href="talentedStu.jsp">本科生</A></li>
						<li class="li"><A href="stuAppearance.jsp">学生风采</A></li>
					</ul>
				</td>

				<td width="20"></td>


				<td width="800">
					<div class="rmain">
						<div class="rlist">
							<table width="100%" border="0" align="center" cellpadding="4" cellspacing="0" class="rtable">
								<tr class="tr1">
									<td class="rldate daslist"><h2>学生风采</h2></td>
									<td class="rldate daslist"></td>
								</tr>
								<%
									cb.setEVERYPAGENUM(15);
									int cou = cb.getMessageCount("select count(*) from stuAppearance");//得到信息总数			        
									String page1 = request.getParameter("page");
									if (page1 == null) {
										page1 = "1";
									}
									session.setAttribute("busMessageCount", cou + "");
									session.setAttribute("busPage", page1);
									List pagelist1 = cb.getMessage(Integer.parseInt(page1), "select * from stuAppearance order by id desc", 4);
									session.setAttribute("qqq", pagelist1);
									int pageCount = cb.getPageCount(); //得到页数  
									session.setAttribute("busPageCount", pageCount + "");
									List pagelist3 = (ArrayList) session.getAttribute("qqq");
									if (!pagelist3.isEmpty()) {
										for (int i = 0; i < pagelist3.size(); i++) {
											List pagelist2 = (ArrayList) pagelist3.get(i);
								%>
								<tr class="tr<%=(i) % 2%>">
									<td class="rltitle dotlist"><a
										href="<%=basePath%>stuAppearanceInfo.jsp?id=<%=pagelist2.get(0).toString()%>"><%=pagelist2.get(1).toString()%></a></td>
									<td class="rldate daslist"><%=pagelist2.get(3).toString()%></td>
								</tr>
								<%
									}
									}
								%>
							</table>


							<div class="blk15"></div>
							<div class="rpage">
								<form action="" method="post" name="form3">
									<table width="100%" border="0" align="center" cellpadding="0"
										cellspacing="0">
										<tbody>
											<tr>
												<td align="center"><input type="hidden"
													name="pageCount"
													value="<%=session.getAttribute("busPageCount").toString()%>" />
													<!--//用于给上面javascript传值--> <input type="hidden" name="page"
													value="<%=session.getAttribute("busPage").toString()%>" />
													<!--//用于给上面javascript传值--> <a href="#" onClick="top2()">首页</a>&nbsp;&nbsp;&nbsp;
													<a href="#" onClick="pre2()">上一页</a>&nbsp;&nbsp;&nbsp; 共<%=session.getAttribute("busMessageCount").toString()%>条记录,共计<%=session.getAttribute("busPageCount").toString()%>页,当前第<%=session.getAttribute("busPage").toString()%>页&nbsp;&nbsp;&nbsp;
													<a href="#" onClick="next2()">下一页</a>&nbsp;&nbsp;&nbsp; <a
													href="#" onClick="last2()">尾页</a> 第<input name="busjump"
													type="text" size="3" />页 <a href="#" onClick="bjump2()">转到</a>
												</td>
											</tr>
										</tbody>
									</table>
								</form>
							</div>
						</div>



					</div>
				</td>

			</tr>
		</table>


	</div>



</div>
<%@ include file="base/foot.jsp"%>