<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Com.FrameWork.Page" %>
<%@ Import Namespace="Model" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript" src="/Scripts/jquery-1.7.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/Content/skin/css/base.css"/>
    <style type="text/css">
    .ltb{width:145px; height:25px; font-size:13px;line-height:25px; border:solid 1px #ccc;}
    </style>
    <script type="text/javascript">
        function sub() {
            var webname = $("#webname").val();
            if (webname == "") {
                alert("站点名称不能为空");
                $("#webname").focus();
                return false;
            }
            var website = $("#website").val();
            if (website == "") {
                alert("站点地址不能为空");
                $("#website").focus();
                return false;
            }
            var sortid = $("#sortid").val();
            if (sortid == "") {
                alert("序号不能为空");
                $("#sortid").focus();
                return false;
            }
            else {
                if (isNaN(sortid)) {
                    alert("序号请填写数字");
                    $("#sortid").focus();
                    return false;
                }
            }
        }
    </script>
</head>
<body>
<form id="form1" method="post" action="/admin/EditLink">
<%
    Link link = ViewData["link"] as Link;
    var webname=link==null?"":link.webname;
    var website = link == null ? "" : link.website;
    var lxr = link == null ? "" : link.lxr;
    var phone = link == null ? "" : link.phone;
    var email = link == null ? "" : link.email;
    var sortid = link == null ? "" : link.sortid;
    var id = link == null ? "" : link.id;
%>
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
              <td width="142">站点名称</td>
              <td height="20" colspan="3">
                <input id="webname" name="webname" value="<%:webname %>" type="text" class="ltb"/>
              </td>
            </tr>
            <tr style="height:25px;">
              <td width="142">站点地址</td>
              <td height="20" colspan="3">
                <input id="website" name="website" type="text" value="<%:website %>" class="ltb"/>
              </td>
            </tr>
            <tr style="height:25px;">
              <td width="142">联系人</td>
              <td colspan="3">
                <input id="lxr" name="lxr" type="text" value="<%:lxr %>" class="ltb"/>
              </td>
            </tr>
            <tr>
              <td width="142">联系电话</td>
              <td height="20" colspan="3">
                <input id="phone" name="phone" type="text" value="<%:phone %>" class="ltb"/>
              </td>
            </tr>
            <tr style="height:25px;">
              <td width="142">邮箱地址</td>
              <td colspan="3">
                <input id="email" name="email" value="<%:email %>" type="text" class="ltb"/>
              </td>
            </tr>
            <tr style="height:25px;">
              <td width="142">序号</td>
              <td colspan="3">
                <input id="sortid" name="sortid" type="text" value="<%:sortid %>" class="ltb"/>
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
        <input id="id" name="id" type="hidden" value="<%:id %>"/>
        <input type="submit" class="btn" onclick="return sub();" style="height:25px; line-height:25px;" value="更新" />        
        </td>
      </tr>
    </table>
   </td>
  </tr>
</table>
</form>
</body>
</html>
