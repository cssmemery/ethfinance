<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Model.Help>"%>
<%@ Import Namespace="Model" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="/Scripts/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Scripts/editor/kindeditor.js"></script>
    <link rel="stylesheet" type="text/css" href="/Content/skin/css/base.css"/>
    <style type="text/css">
    .ltb{width:145px; height:25px; font-size:13px;line-height:25px; border:solid 1px #ccc;}
    </style>
    <script type="text/javascript">
        function sub() {
            var sxh = $("#sxh").val();
            if (sxh == "") {
                alert("序号不能为空");
                $("#sxh").focus();
                return false;
            }
            else {
                if (isNaN(sxh)) {
                    alert("序号请填写数字");
                    $("#sxh").focus();
                    return false;
                }
            }
            var title = $("#title").val();
            if (title == "") {
                alert("标题不能为空");
                $("#title").focus();
                return false;
            }
            var hcontent = KE.html('hcontent');
            if (hcontent == "") {
                alert("内容不能为空");
                $("#hcontent").focus();
                return false;
            }
        }
        KE.show({
            id: 'hcontent',
            imageUploadJson: '/admin/UploadImage'
        }); 
    </script>
</head>
<body>
<form id="form1" method="post" action="/admin/UpdateHelp">
<%
    Help help = ViewData["help"] as Help;
    var title = help.title;
    var sxh = help.sxh;
    var hcontent = help.hcontent;
    var pubdate = help.pubdate;
    var id = help.id;
    var item = help.item;
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
              <td width="142">所属栏目</td>
              <td height="20" colspan="3">
                <select id="item" name="item" class="ltb">
                    <option value="酒店预订" <%:item.Equals("酒店预订") ? "selected='selected'" : ""%>>酒店预订</option>
                    <option value="门票预订" <%:item.Equals("门票预订") ? "selected='selected'" : ""%>>门票预订</option>
                    <option value="关于奖金" <%:item.Equals("关于奖金") ? "selected='selected'" : ""%>>关于奖金</option>
                    <option value="其它帮助" <%:item.Equals("其它帮助") ? "selected='selected'" : ""%>>其它帮助</option>
                </select>
              </td>
            </tr>
            <tr style="height:25px;">
              <td width="142">序号</td>
              <td height="20" colspan="3">
                <input id="sxh" name="sxh" value="<%:sxh %>" type="text" class="ltb"/>
              </td>
            </tr>
            <tr style="height:25px;">
              <td width="142">标题</td>
              <td height="20" colspan="3">
                <input id="title" name="title" value="<%:title %>" style="width:200px;" type="text" class="ltb"/>
              </td>
            </tr>
            <tr style="height:25px;">
              <td width="142">内容</td>
              <td colspan="3">
                <textarea id="hcontent" rows="2" cols="2" name="hcontent" style="width:700px;height:300px;"><%:hcontent%></textarea>
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
        <input id="pubdate" name="pubdate" type="hidden" value="<%:pubdate %>"/>
        <input type="submit" class="btn" onclick="return sub();" style="height:25px; line-height:25px;" value="保存" />        
        </td>
      </tr>
    </table>
   </td>
  </tr>
</table>
</form>
</body>
</html>
