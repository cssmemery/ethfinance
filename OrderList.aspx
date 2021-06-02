<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Com.FrameWork.Page.PagedList<Model.Order>>" %>
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
<script type="text/javascript">
    function getstatus(uid) {
        var r = Math.random();
        var url = "/admin/getstatus?uid=" + uid + "&r=" + r + "";
        var span = $("#span" + uid + "");
        span.html("加载中");
        $.ajax({
            type: "GET",
            url: url,
            timeout: 30000,
            success: function (response) {
                span.html(response);
            }
        }
  )
    }
</script>
<link rel="stylesheet" type="text/css" href="/Content/skin/css/base.css"/>
</head>
<body>
<form id="form1" action="/admin/OrderList">
<%
    Order order = ViewData["SearchModel"] as Order;
    var lxr = "";
    var phone = "";
    var uid = "";
    if (order != null)
    {
        lxr = order.lxr;
        phone = order.phone;
        uid = order.uid;    
    }
%>
<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="12" background="/Content/skin/images/tbg.gif">酒店订单列表查看</td>
</tr>
<tr bgcolor="#FAFAF1">
 <td width="90">订单编号：</td>
 <td width="100">
  <input type="text" name="uid" value="<%:uid %>" id="uid" class="tb"/>
 </td>
 <td width="90">联系人：</td>
 <td width="100">
  <input type="text" name="lxr" value="<%:lxr %>" id="lxr" class="tb"/>
 </td>
 <td width="90">联系电话：</td>
 <td width="100">
  <input type="text" name="phone" value="<%:phone %>" id="phone" class="tb"/>
 </td>
<td colspan="5">
    <input name="btnsearch" id="btnsearch" value="查询" type="submit" class="btn" />
</td>
</tr>
<%Html.RenderPartial("AjaxOrder", Model); %>
</table>
</form>
</body>
</html>
