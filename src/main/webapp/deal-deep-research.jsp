<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>

<%@ page import="com.file.domain.TData"%>
<%@ page import="com.file.tool.TDataTool"%>

<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.BufferedWriter"%>
<%@ page import="java.io.FileReader"%>
<%@ page import="java.io.FileWriter"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>������ϵ��ѯϵͳ</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body background="image/3.jpg">
  <br><br><br><br><br><br>
	<center>
<%
	String id=request.getParameter("id");
	TDataTool tDataTool=new TDataTool();
	tDataTool.Search_By_Id(id);
%>			

	<table align="center" border="1" width="800">
		<tr>
        <td align="center">���</td>
    	<td align="center">ʱ��</td>
    	<td align="center">����Դ</td>
   		<td align="center">����</td>
    	<td align="center">γ��</td>
    	<td align="center">�¶�</td>
    	<td align="center">�ζ�</td>
    	</tr>
<%	
	
	BufferedReader br = new BufferedReader(new FileReader("C:\\Users\\CHEN JINGRAN\\Workspaces\\MyEclipse 10\\Provenance\\Db\\SResult"));
	String data = null;
	while((data = br.readLine())!=null)
	{
		String[] ary = data.trim().split("\\$");
%>
	<tr>
    <td align="center"><%=ary[0] %></td>
    <td align="center"><%=ary[1] %></td>
    <td align="center"><%=ary[2] %></td>
    <td align="center"><%=ary[3] %></td>
    <td align="center"><%=ary[4] %></td>
    <td align="center"><a href="deal-provenance-research.jsp?id=<%=ary[0] %>&attr=temp"><%=ary[5] %></a></td>
    <td align="center"><a href="deal-provenance-research.jsp?id=<%=ary[0] %>&attr=salt"><%=ary[6] %></a></td>
    </tr>
<%	
	}
%>
	</table>	

	</center>
</body>
 