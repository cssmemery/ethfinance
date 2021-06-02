<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Com.FrameWork.Page.PagedList<Model.Pick>>" %>
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
    function sub()
    {        
        $("#form1").submit();
    }
    function check(id) {
        var url = "/admin/CheckPick?id=" + id + "";
        art.dialog.open(url, { title: '处理提现申请单信息', width: '600px', height: '200px', lock: true, background: 'White', opacity: 0.7 });
    }
</script>
<link rel="stylesheet" type="text/css" href="/Content/skin/css/base.css"/>
</head>
<body>
<form id="form1" name="form1" action="/admin/PickList">
<%
    Pick pick = ViewData["SearchModel"] as Pick;
    var zfb = "";
    var zfbname = "";
    if(pick != null)
    {
        zfb = pick.zfb;
        zfbname = pick.zfbname;   
    }
%>
<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="9" background="/Content/skin/images/tbg.gif">提现申请管理</td>
</tr>
<tr bgcolor="#FAFAF1">
 <td width="100">支付宝账号：</td>
 <td style="width:120px;">
  <input type="text" name="zfb" value="<%:zfb %>" id="zfb" class="tb"/>
 </td>
 <td width="70">真实姓名：</td>
<td style="width:120px;">
   <input type="text" name="zfbname" value="<%:zfbname %>" id="phone" class="tb"/>
</td>
<td colspan="5">
<input id="id" name="id" type="hidden"/>
  <input name="btnsearch" id="btnsearch" value="查询" type="button" onclick="sub();" class="btn" />
</td>
</tr>
<%Html.RenderPartial("AjaxPick", Model); %>
</table>
</form>
</body>
</html>
