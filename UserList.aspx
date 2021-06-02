<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Com.FrameWork.Page.PagedList<Model.User>>" %>
<%@ Import Namespace="Com.FrameWork.Page" %>
<%@ Import Namespace="Model" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
<script type="text/javascript" src="/Scripts/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="/Scripts/MicrosoftAjax.js"></script>
<script type="text/javascript" src="/Scripts/MicrosoftMvcAjax.js"></script>
<script type="text/javascript" src="/Scripts/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript" src="/Scripts/artDialog/artDialog.iframeTools.source.js"></script>
<script type="text/javascript">
    function CreateUser() {
        var url = "/admin/CreateUser";
        art.dialog.open(url, { title: '添加用户信息', width: '700px', height: '260px', lock: true, background: 'White', opacity: 0.7 });
    }
    function edit(id) {
        var url = "/admin/EditUser?id=" + id + "";
        art.dialog.open(url, { title: '编辑用户信息', width: '700px', height: '400px', lock: true, background: 'White', opacity: 0.7 });
    }
    function Search() {
        $("#form1").attr("action", "/admin/UserList");
        $("#form1").submit(); 
    }
</script>
<link rel="stylesheet" type="text/css" href="/Content/skin/css/base.css"/>
</head>
<body>
<form id="form1" action="/admin/UserList">
<%
    User user = ViewData["SearchModel"] as User;
    var useruser = "";
    var username = "";
    if(user != null)
    {
        useruser = user.useruser;
        username = user.username;       
    }
%>
<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="12" background="/Content/skin/images/tbg.gif">用户信息管理</td>
</tr>
<tr bgcolor="#FAFAF1">
 <td width="90">登录账号：</td>
 <td width="100">
  <input type="text" name="useruser" value="<%:useruser %>" id="useruser" class="tb"/>
 </td>
 <td width="90">用户名：</td>
 <td width="100">
  <input type="text" name="username" value="<%:username %>" id="username" class="tb"/>
 </td>
<td colspan="5">
    <input name="btnsearch" id="btnsearch" onclick="Search();" value="查询" type="button" class="btn" />
    <input name="btnsearch" id="btnAdd" onclick="CreateUser();" value="添加" type="button" class="btn" />
</td>
</tr>
<%Html.RenderPartial("AjaxUser", Model); %>
</table>
</form>
</body>
</html>
