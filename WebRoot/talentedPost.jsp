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
.nameLine a:hover{
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
					<div>
						<h2>硕士研究生</h2>
					</div>
					<div>
						<img alt="" src="images/content_line.png">
					</div>
					
					<%
					DBO dbo = new DBO();
					dbo.open();
					String sql1 = "select count(*) from (select level from postgraduate group by level order by level desc) ss ";
					int count = cb.getMessageCount(sql1);
					List levelList = cb.getCom("select level from postgraduate group by level order by level desc", 1);
					for (int i = 0; i < levelList.size(); i++) {
							List list = (ArrayList) levelList.get(i);
							%>		
					<!-- 研究生年级 -->	
					<div class="BMV_Content"><h3 style="color:#33a3dc "><%=list.get(0).toString() %>&nbsp;级</h3></div>
							
					<% 
							List list2 = cb.getCom("select * from postgraduate where level = "+list.get(0).toString(), 4);
							//System.out.println(list2);
							if(!list2.isEmpty()){
								for(int j = 0;j < list2.size();j++){
									List list3 = (ArrayList)list2.get(j);
									%>
					<!-- 研究生信息 -->
					<div class="nameLine">
							<a href="##" target="_blank"><%=list3.get(2).toString() %></a>
					</div>
					<div></div>
					<%									
								}
							}
					
					}
					
					%>
					
					
				</td>



			</tr>
		</table>
	</div>



</div>
<%@ include file="base/foot.jsp"%>