<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Com.FrameWork.Page.PagedList<Model.Parmer>>" %>
<%@ Import Namespace="Com.FrameWork.Page" %>
<%@ Import Namespace="Model" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title></title>
<script type="text/javascript" src="/Scripts/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="/Scripts/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript" src="/Scripts/artDialog/artDialog.iframeTools.source.js"></script>
<script type="text/javascript">
    function CreateUser() {
        var url = "/admin/CreateParmer";
        art.dialog.open(url, { title: '添加参数值信息', width: '600px', height: '260px', lock: true, background: 'White', opacity: 0.7 });
    }
    function edit(id) {
        var url = "/admin/EditParmer?id=" + id + "";
        art.dialog.open(url, { title: '编辑参数值信息', width: '700px', height: '400px', lock: true, background: 'White', opacity: 0.7 });
    }
    function Search() {
        $("#form1").attr("action", "/admin/ParmerList");
        $("#form1").submit();
    }   
</script>
<link rel="stylesheet" type="text/css" href="/Content/skin/css/base.css"/>
</head>
<body>
<form id="form1" action="/admin/ParmerList">
<%
    Parmer user = ViewData["SearchModel"] as Parmer;
    var pname = "";    
    if(user != null)
    {
        pname = user.pname;           
    }
    IList<Parmer> plist = ViewData["plist"] as IList<Parmer>;
%>
<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="12" background="/Content/skin/images/tbg.gif">常用信息管理</td>
</tr>
<tr bgcolor="#FAFAF1">
 <td width="90">名称：</td>
 <td width="100">
  <input type="text" name="pname" value="<%:pname %>" id="pname" class="tb"/>
 </td>
<td colspan="5">
    <input name="btnsearch" id="btnsearch" onclick="Search();" value="查询" type="button" class="btn" />
    <input name="btnsearch" id="btnAdd" onclick="CreateUser();" value="添加" type="button" class="btn" />
    <a href="/admin/Flushparmer">刷新缓存</a>
    <a href="/admin/ExecuteDate">执行接口基础数据</a>
</td>
</tr>
<tr>    
	<td>序号</td>
	<td>参数名称</td>	
	<td>参数值</td>
    <td>参数描述</td> 
    <td>操作日期</td>   
    <td>操作</td>
</tr>
<%int k = 0; %>
<%
    if (plist != null && plist.Count > 0)
    {
        foreach (var item in plist)
        {
            k++;
         %>
         <tr bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" >
	        <td><%:k %></td>	
	        <td><%:item.pname %></td>
            <td><span title="<%:item.pvalue %>"><%:item.pvalue.Length>20?item.pvalue.Substring(0,20):item.pvalue %></span></td>
            <td><%:item.pdesc %></td>
            <td><%:item.pubdate %></td>
            <td>               
                <a href="javascript:edit('<%:item.id %>');">编辑</a>
                <a href="/admin/deleteParmer?id=<%:item.id %>">删除</a>
            </td>   
        </tr>
         <%      
        }    
    }
%>
</table>
</form>
</body>
</html>
