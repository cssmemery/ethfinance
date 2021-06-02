<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Com.FrameWork.Page.PagedList<Model.Qiushi>>" %>
<%@ Import Namespace="Com.FrameWork.Page" %>
<%@ Import Namespace="Model" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title></title>
<script type="text/javascript" src="/Scripts/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="/Scripts/MicrosoftAjax.js"></script>
<script type="text/javascript" src="/Scripts/MicrosoftMvcAjax.js"></script>
<script type="text/javascript" src="/Scripts/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript" src="/Scripts/artDialog/artDialog.iframeTools.source.js"></script>
<script type="text/javascript">
    function sub() {
        $("#form1").attr("action", "/admin/qiushiList");
        $("#form1").submit();
    }
    function create() {
        var url = "/admin/Createqiushi";
        art.dialog.open(url, { title: '添加糗事信息', width: '800px', height: '300px', lock: true, background: 'White', opacity: 0.7 });
    }
    function edit(id) {
        var url = "/admin/Updateqiushi?id=" + id + "";
        art.dialog.open(url, { title: '编辑糗事信息', width: '800px', height: '300px', lock: true, background: 'White', opacity: 0.7 });
    }  
</script>
<link rel="stylesheet" type="text/css" href="/Content/skin/css/base.css"/>
</head>
<body>
<form id="form1" name="form1" action="/admin/qiushiList">
<%
    Qiushi qiushi = ViewData["SearchModel"] as Qiushi;
    var title = "";   
    if(qiushi != null)
    {
        title = qiushi.title;
    }
%>
<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="6" background="/Content/skin/images/tbg.gif">糗事信息列表</td>
</tr>
<tr bgcolor="#FAFAF1">
<td width="70">标题：</td>
<td colspan="3">
  <input id="title" name="title" value="<%:title %>" type="text" class="tb"/>
  <input name="btnsearch" id="btnsearch" value="查询" type="button" onclick="sub();" class="btn" />
  <input name="btnsearch" id="btnExecute" onclick="create();" value="添加" type="button" class="btn" />
</td>
</tr>
<%Html.RenderPartial("Ajaxqiushi", Model); %>
</table>
</form>
</body>
</html>
