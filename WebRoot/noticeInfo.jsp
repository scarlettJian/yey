<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=gb2312"%>
<%@ include file="base/head.jsp"%>
<%
	String id = request.getParameter("id");
	if (id == null)
		id = (String) request.getAttribute("id");
	List list = cb.get1Com("select * from qc where id='" + id + "'", 7);
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
					通知来源：<%=list.get(2).toString()%>
					时间：<%=list.get(6).toString()%>
				</div>
				<%-- <div class="rcontent">
					<center>
						<img src="<%=basePath + list.get(1).toString()%>" border="0">
					</center>
				</div> --%>
				<div class="rcontent"><%=list.get(5).toString()%></div>
				<div class="rdmark"></div>

			</div>
		</div>
	</div>
	<%@ include file="base/foot.jsp"%>