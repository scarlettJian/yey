<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=gb2312"%>
<%@ include file="base/head.jsp"%>
<!-- 学校概述 -->
<%
	List list = cb.get1Com("select * from jj where fl='xx'", 3);
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
					<span>实验室概述</span>
				</div>
				<div class="rcontent"><%=list.get(1).toString()%></div>
				<div class="rdmark"></div>
			</div>
		</div>
	</div>
</div>
<%@ include file="base/foot.jsp"%>
