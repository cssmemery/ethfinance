<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Com.FrameWork.Page.PagedList<Model.FlashImage>>" %>
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
<% 
    Model.FlashImage flash = ViewData["SearchModel"] as Model.FlashImage;    
    var item = "";
    var title = "";
    var sid = "";
    if(flash != null)
    {
        item =string.IsNullOrEmpty(flash.item)?"":flash.item;
        title = flash.title;
        sid = flash.sid;
    }    
%>
<script type="text/javascript">
    function Add() {
        $("#form1").attr("action", "/Admin/CreateAD");
        $("#form1").submit();
    }
    function sub() {
        $("#form1").attr("action", "/Admin/AdList");
        $("#form1").submit();
    }
</script>
<form id="postfrom" action="/FlashImage/SelectDel" method="post">
  <input id="idlist" name="idlist" type="hidden"/>  
</form>
<form id="form1" action="/FlashImage/Index">
<table width="1200" border="0"  cellpadding="0" cellspacing="0"> 
<tr>
    <td>
    <table width="1200" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9" background="/Content/images/tab_12.gif">&nbsp;</td>
        <td bgcolor="#F3FFE3">       
        <table width="100%" border="0" cellpadding="3"  cellspacing="1" bgcolor="#D1DDAA" style="text-align:left;" >
          <tr>
            <td bgcolor="#FFFFFF" style="width:80px;">所属栏目</td>
            <td bgcolor="#FFFFFF" style="width:100px;">
            <select id="item" name="item" class="tb" style="width:90px;">
              <option value="" <%:item.Equals("") ? "selected='selected'" : ""%>>请选择</option>
              <option value="首页" <%:item.Equals("首页") ? "selected='selected'" : ""%>>首页</option>
              <option value="酒店" <%:item.Equals("酒店") ? "selected='selected'" : ""%>>酒店</option>
              <option value="景点" <%:item.Equals("景点") ? "selected='selected'" : ""%>>景点</option>        
            </select>  
            </td>
            <td bgcolor="#FFFFFF" style="width:80px;">标题</td>
            <td bgcolor="#FFFFFF" style="width:120px;"><input id="title" name="title" value="<%:title%>" class="tb" style="width:120px; height:20px; line-height:20px;" type="text"/></td>
            <td bgcolor="#FFFFFF" style="width:80px;">序号</td>
            <td bgcolor="#FFFFFF" style="width:80px;"><input type="text" id="sid" value="<%:sid %>" style="width:80px;" class="tb" name="sid"/></td>
            <td bgcolor="#FFFFFF">
            <input type="button" onclick="sub();" value="查询" name="search" class="btn" />
            <input type="button" onclick="Add();" value="添加" name="create" class="btn" /> 
            </td> 
         </tr>
     </table>
   <%Html.RenderPartial("AjaxAD", Model); %>  
</td>
<td width="9" background="/Content/images/tab_16.gif">&nbsp;</td>
</tr>
</table>
</td>
</tr>
<!--中间部分结束-->
<tr>
<td height="29"><table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td width="15" height="29"><img src="/Content/images/tab_20.gif" width="15" height="29" /></td>
    <td background="/Content/images/tab_21.gif">&nbsp;</td>
    <td width="14"><img src="/Content/images/tab_22.gif" width="14" height="29" /></td>
    </tr>
</table></td>
</tr>
</table>
</form>
</body>
</html>
