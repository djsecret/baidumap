<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>

<%@ page import="com.file.domain.TData"%>
<%@ page import="com.file.tool.TDataTool"%>

<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.BufferedWriter"%>
<%@ page import="java.io.FileReader"%>
<%@ page import="java.io.FileWriter"%>
<%@ page import="java.lang.String"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>数据世系查询系统</title>
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
	String attr=request.getParameter("attr");
	System.out.println(id);
	System.out.println(attr);
	TDataTool tDataTool=new TDataTool();
	tDataTool.Search_Provenance(id,attr);
%>	
		<table align="center" border="1" width="800">
		<tr>
		<td align="center">编号</td>
        <td align="center">数据源编号</td>
        <td align="center">属性</td>
    	<td align="center">WHEN</td>
   		<td align="center">WHAT</td>
    	<td align="center">WHERE</td>
    	<td align="center">WHO</td>
    	<td align="center">HOW</td>
    	<td align="center">WHICH</td>
    	<td align="center">WHY</td>
    	</tr>
    	
<%		
	BufferedReader br = new BufferedReader(new FileReader("C:\\Users\\CHEN JINGRAN\\Workspaces\\MyEclipse 10\\Provenance\\Db\\SResult"));
	String data = null;
	String key=null;
	while((data = br.readLine())!=null)
	{
		String ary[] = data.trim().split("\\$");
		//int i=0;
		//while(ary[i]!=null)

		//System.out.println(ary[8]);		
%>
	<tr>
	<td align="center"><%=ary[0] %></td>
	<td align="center"><%=ary[1] %></td>
    <td align="center"><%=ary[3] %></td>
    <td align="center"><%=ary[2] %></td>
    <td align="center"><%=ary[4] %></td>
    <td align="center"><%=ary[5] %></td>
    <td align="center"><%=ary[6] %></td>
    <td align="center"><%=ary[7] %></td>
    <td align="center"><%=ary[8] %></td>
    <td align="center"><%=ary[9] %></td>
    </tr>
<%	
	key=ary[8];
	//System.out.println(key);
	}
%>    	
		</table>
	</center>
	
	<br><br><br><br><br><br>
	
	<center>
	<table align="center" border="1" width="800">
		<tr>
        <td align="center">编号</td>
        <td align="center">数据源编号</td>
        <td align="center">属性</td>
    	<td align="center">WHEN</td>
   		<td align="center">WHAT</td>
    	<td align="center">WHERE</td>
    	<td align="center">WHO</td>
    	<td align="center">HOW</td>
    	<td align="center">WHICH</td>
    	<td align="center">WHY</td>
    	</tr>
<%
	String[] a = key.trim().split(",");
	//char[] a=key.toCharArray();
	for(int j=0;j<a.length;j++){
	String b=a[j];
	//System.out.println(b);
	//char c=',';
	//if(b==c){}
	//else{
	int d=Integer.parseInt(b);
	tDataTool.Search_Source(d);
	//System.out.println(d);
	BufferedReader br1 = new BufferedReader(new FileReader("C:\\Users\\CHEN JINGRAN\\Workspaces\\MyEclipse 10\\Provenance\\Db\\SResult"));
	String data1 = null;
	while((data1= br1.readLine())!=null)
	{
		String[] ary = data1.trim().split("\\$");
%>
	<tr>
    <td align="center"><%=ary[0] %></td>
	<td align="center"><%=ary[1] %></td>
    <td align="center"><%=ary[3] %></td>
    <td align="center"><%=ary[2] %></td>
    <td align="center"><%=ary[4] %></td>
    <td align="center"><%=ary[5] %></td>
    <td align="center"><%=ary[6] %></td>
    <td align="center"><%=ary[7] %></td>
    <td align="center"><a href="deal-deep-research.jsp?id=<%=ary[8] %>"><%=ary[8] %></a></td>
    <td align="center"><%=ary[9] %></td>
    </tr>
<%	
	}
	}
	//}
%>
	</table>
	</center>
</body>
 