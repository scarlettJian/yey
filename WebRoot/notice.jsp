<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=gb2312"%>
<%@ include file="base/head.jsp"%>
<!-- �׶�԰��� -->
<script type="text/javascript">
function top2() {//��ҳ
	form3.action="<%=basePath %>notice.jsp?page=1";
	form3.submit(); 
}
function last2() {//βҳ
	 if(form3.pageCount.value==0){//�����ҳ��Ϊ0����ô���һҳΪ1��Ҳ���ǵ�һҳ�������ǵ�0ҳ
	    	form3.action="<%=basePath%>notice.jsp?page=1";
	    	form3.submit();
		}else{
			form3.action="<%=basePath%>notice.jsp?page="+form3.pageCount.value;
	    	form3.submit();
		}
}
function pre2(){//��һҳ
  var page=parseInt(form3.page.value);
  if(page<=1){
    alert("������һҳ");
  }else{
    form3.action="<%=basePath%>notice.jsp?page="+(page-1);
    form3.submit();
  }
}
function next2(){//��һҳ
	  var page=parseInt(form3.page.value);
	  var pageCount=parseInt(form3.pageCount.value);
	  if(page>=pageCount){
	    alert("�������һҳ");
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
						<td class="rldate daslist">֪ͨ����</td>
						<td class="rldate daslist">����ʱ��</td>
					</tr>
					<%
						cb.setEVERYPAGENUM(10);
						int cou = cb.getMessageCount("select count(*) from qc");//�õ���Ϣ����			        
						String page1 = request.getParameter("page");
						if (page1 == null) {
							page1 = "1";
						}
						session.setAttribute("busMessageCount", cou + "");
						session.setAttribute("busPage", page1);
						List pagelist1 = cb.getMessage(Integer.parseInt(page1), "select * from qc order by id desc", 7);
						session.setAttribute("qqq", pagelist1);
						int pageCount = cb.getPageCount(); //�õ�ҳ��  
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
								<!--//���ڸ�����javascript��ֵ--> <input type="hidden" name="page"
									value="<%=session.getAttribute("busPage").toString()%>" />
								<!--//���ڸ�����javascript��ֵ--> <a href="#" onClick="top2()">��ҳ</a>&nbsp;&nbsp;&nbsp;
									<a href="#" onClick="pre2()">��һҳ</a>&nbsp;&nbsp;&nbsp; ��<%=session.getAttribute("busMessageCount").toString()%>����¼,����<%=session.getAttribute("busPageCount").toString()%>ҳ,��ǰ��<%=session.getAttribute("busPage").toString()%>ҳ&nbsp;&nbsp;&nbsp;
									<a href="#" onClick="next2()">��һҳ</a>&nbsp;&nbsp;&nbsp; <a
									href="#" onClick="last2()">βҳ</a> <!-- ��<input name="busjump"
									type="text" size="3" />ҳ <a href="#" onClick="bjump2()">ת��</a> -->
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
