<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Com.FrameWork.Page.PagedList<Model.SenceOrder>>" %>
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
</head>
<body>
<form id="form1" action="/admin/SenceOrder">
<%
    SenceOrder order = ViewData["SearchModel"] as SenceOrder;
    var oid = "";
    var sceneryName = "";
    var bookingName = "";
    var bookingMobile = "";
    if (order != null)
    {
        oid = order.oid;
        sceneryName = order.sceneryName;
        bookingName = order.bookingName;
        bookingMobile = order.bookingMobile;
    }
%>
<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="12" background="/Content/skin/images/tbg.gif">景点订单列表查看</td>
</tr>
<tr bgcolor="#FAFAF1">
 <td width="90">订单编号：</td>
 <td width="100">
  <input type="text" name="oid" value="<%:oid %>" id="oid" class="tb"/>
 </td>
 <td width="90">景点名称：</td>
 <td width="100">
  <input type="text" name="sceneryName" value="<%:sceneryName %>" id="sceneryName" class="tb"/>
 </td>
<td width="90">预订人：</td>
 <td width="100">
  <input type="text" name="bookingName" value="<%:bookingName %>" id="bookingName" class="tb"/>
 </td>
 <td width="90">联系电话：</td>
 <td width="100">
  <input type="text" name="bookingMobile" value="<%:bookingMobile %>" id="bookingMobile" class="tb"/>
 </td>
<td colspan="5">
    <input name="btnsearch" id="btnsearch" value="查询" type="submit" class="btn" />
</td>
</tr>
<%Html.RenderPartial("AjaxSenceOrder", Model); %>
</table>
</form>
</body>
</html>
