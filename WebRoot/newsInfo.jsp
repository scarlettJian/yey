<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=gb2312"%>
<%@ include file="base/head.jsp"%>
<%
	String id = request.getParameter("id");
	List list = cb.get1Com("select * from xw where id='" + id + "'", 5);
%>
<div class="main">
	<div class="narea">
		<div>
			<img height="126" src="<%=basePath%>images/zgm.jpg" width="1020">
		</div>
	</div>
	<div class="cmain">
		<div class="rmain">
			<div class="rdetail">
				<div class="rdtitle">
					<span><%=list.get(1).toString()%></span>
				</div>
				<div class="rdmark">
					��Ϣ��Դ��<%=list.get(2).toString()%>
					����ʱ�䣺<%=list.get(4).toString()%>
				</div>
				<div class="rcontent"><%=list.get(3).toString()%></div>
				<div class="rdmark"></div>
			</div>
		</div>
	</div>
</div>
<%@ include file="base/foot.jsp"%>
