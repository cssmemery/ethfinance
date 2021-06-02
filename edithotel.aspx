<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="/Scripts/jquery-1.7.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/Content/skin/css/base.css"/>
    <style type="text/css">
    .ltb{width:145px; height:25px; font-size:13px;line-height:25px; border:solid 1px #ccc;}
    </style>
    <script type="text/javascript">
        function Save() {
            $("#form1").submit();
        }
    </script>
</head>
<body>
<%
    Model.Hotel hotel = ViewData["hotel"] as Model.Hotel;
    var hname = hotel.hname;
    var qiushi = hotel.qiushi;
    var hid = hotel.hid;
%>
<form id="form1" method="post" action="/admin/PostHotel">
<table width="100%" border="0" cellpadding="0" cellspacing="0" style="font-size:14px;">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9" background="/Content/images/tab_12.gif">&nbsp;</td>
        <td bgcolor="#F3FFE3">
        <!--内容显示-->
        <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" style="margin-top:8px">
        <tr bgcolor="#FAFAF1" style="background:url(/Content/images/tab_14.gif)" height="22">
	        <td colspan="10" align="left">&nbsp;</td>
	    </tr>
        <tr bgcolor="#FFFFFF">
          <td colspan="10">
           <table width="70%" border="0" cellpadding="0" cellspacing="0"> 
            <tr style="height:25px;">
              <td width="142">酒店名称</td>
              <td height="20" colspan="3">
                <input id="hname" name="hname" readonly="readonly" value="<%:hname %>" type="text" class="ltb"/>
              </td>
            </tr>
            <tr style="height:25px;">
              <td width="142">资讯信息</td>
              <td height="20" colspan="3">
                <textarea id="qiushi" name="qiushi" class="ltb" style="width:300px; height:100px;"></textarea>
              </td>
            </tr>
          </table>
         </td>
        </tr>
        </table>     
        </td>
        <td width="9" background="/Content/images/tab_16.gif">&nbsp;</td>
      </tr>
    </table>
   </td>
  </tr>
  <tr>
    <td height="25">
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr style=" text-align:center;">        
        <td background="/Content/images/tab_21.gif">
        <input id="hid" name="hid" type="hidden" value="<%:hid %>"/>
        <input type="submit" class="btn" onclick="return Save();" style="height:25px; line-height:25px;" value="保存" />        
        </td>
      </tr>
    </table>
   </td>
  </tr>
</table>
</form>
</body>
</html>
