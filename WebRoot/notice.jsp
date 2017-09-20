<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=gb2312"%>
<%@ include file="base/head.jsp"%>
<!-- 幼儿园风采 -->
<script type="text/javascript">
function top2() {//首页
	form3.action="<%=basePath %>notice.jsp?page=1";
	form3.submit(); 
}
function last2() {//尾页
	 if(form3.pageCount.value==0){//如果总页数为0，那么最后一页为1，也就是第一页，而不是第0页
	    	form3.action="<%=basePath%>notice.jsp?page=1";
	    	form3.submit();
		}else{
			form3.action="<%=basePath%>notice.jsp?page="+form3.pageCount.value;
	    	form3.submit();
		}
}
function pre2(){//上一页
  var page=parseInt(form3.page.value);
  if(page<=1){
    alert("已至第一页");
  }else{
    form3.action="<%=basePath%>notice.jsp?page="+(page-1);
    form3.submit();
  }
}
function next2(){//下一页
	  var page=parseInt(form3.page.value);
	  var pageCount=parseInt(form3.pageCount.value);
	  if(page>=pageCount){
	    alert("已至最后一页");
	  }else{
	    form3.action="<%=basePath%>notice.jsp?page="+(page+1);
	    form3.submit();
	  }
}

</script>
<div class="main">
	<div class="narea">
		<div>
			<img height="126" src="<%=basePath%>images/zgm.jpg" width="1020">
		</div>
	</div>
	<div class="rmain">
		<div class="tom">
			<div class="totitle">
				<span> </span>
			</div>
		</div>
		<div class="rlist">
			<table width="100%" border="0" align="left" cellpadding="4"
				cellspacing="0" class="rtable">
				<tbody>
					<tr class="tr1">
						<td class="rldate daslist">通知公告</td>
						<td class="rldate daslist">发布时间</td>
					</tr>
					<%
						cb.setEVERYPAGENUM(10);
						int cou = cb.getMessageCount("select count(*) from qc");//得到信息总数			        
						String page1 = request.getParameter("page");
						if (page1 == null) {
							page1 = "1";
						}
						session.setAttribute("busMessageCount", cou + "");
						session.setAttribute("busPage", page1);
						List pagelist1 = cb.getMessage(Integer.parseInt(page1), "select * from qc order by id desc", 7);
						session.setAttribute("qqq", pagelist1);
						int pageCount = cb.getPageCount(); //得到页数  
						session.setAttribute("busPageCount", pageCount + "");
						List pagelist3 = (ArrayList) session.getAttribute("qqq");
						if (!pagelist3.isEmpty()) {
							for (int i = 0; i < pagelist3.size(); i++) {
								List pagelist2 = (ArrayList) pagelist3.get(i);
					%>
					<tr class="tr<%=(i) % 2%>">
						<td class="rltitle dotlist">
							<a href="<%=basePath%>noticeInfo.jsp?id=<%=pagelist2.get(0).toString()%>"><%=pagelist2.get(1).toString()%></a></td>
						<td class="rldate daslist"><%=pagelist2.get(6).toString()%></td>
					</tr>
					<%
							}
						}
					%>
				</tbody>
			</table>
			<div class="blk15"></div>
			<div class="rpage">
				<form action="" method="post" name="form3">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tbody>
							<tr>
								<td align="center"><input type="hidden" name="pageCount"
									value="<%=session.getAttribute("busPageCount").toString()%>" />
								<!--//用于给上面javascript传值--> <input type="hidden" name="page"
									value="<%=session.getAttribute("busPage").toString()%>" />
								<!--//用于给上面javascript传值--> <a href="#" onClick="top2()">首页</a>&nbsp;&nbsp;&nbsp;
									<a href="#" onClick="pre2()">上一页</a>&nbsp;&nbsp;&nbsp; 共<%=session.getAttribute("busMessageCount").toString()%>条记录,共计<%=session.getAttribute("busPageCount").toString()%>页,当前第<%=session.getAttribute("busPage").toString()%>页&nbsp;&nbsp;&nbsp;
									<a href="#" onClick="next2()">下一页</a>&nbsp;&nbsp;&nbsp; <a
									href="#" onClick="last2()">尾页</a> <!-- 第<input name="busjump"
									type="text" size="3" />页 <a href="#" onClick="bjump2()">转到</a> -->
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="base/foot.jsp"%>
