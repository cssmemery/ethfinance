<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Com.FrameWork.Page.PagedList<Model.Help>>" %>
<%@ Import Namespace="Com.FrameWork.Page" %>
<%@ Import Namespace="Model" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title></title>
<script type="text/javascript" src="/Scripts/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="/Scripts/MicrosoftAjax.js"></script>
<script type="text/javascript" src="/Scripts/MicrosoftMvcAjax.js"></script>
<script type="text/javascript" src="/Scripts/pub.js"></script>
<link rel="stylesheet" type="text/css" href="/Content/skin/css/base.css"/>
<script type="text/javascript">
    function search() {
        $("#form1").attr("action", "/admin/HelpList");
        $("#form1").submit();
    }
    function create() {
        $("#form1").attr("action", "/admin/CreateHelp");
        $("#form1").submit(); 
    }
</script>
</head>
<body>
<form id="form1" action="/admin/HelpList">
<%
    Help help = ViewData["SearchModel"] as Help;
    var title = "";    
    if (help != null)
    {
        title = help.title;
    }
%>
<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="12" background="/Content/skin/images/tbg.gif">帮助信息维护</td>
</tr>
<tr bgcolor="#FAFAF1">
 <td width="90">标题：</td>
 <td width="100">
  <input type="text" name="title" value="<%:title %>" id="title" class="tb" style="width:150px;"/>
 </td>
<td colspan="5">
    <input name="btnsearch" id="btnsearch" onclick="search();" value="查询" type="button" class="btn" />
    <input name="btnsearch" id="btnAdd" onclick="create();" value="添加" type="button" class="btn" />
</td>
</tr>
<%Html.RenderPartial("AjaxHelp", Model); %>
</table>
</form>
</body>
</html>
