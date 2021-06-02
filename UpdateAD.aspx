<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Com.FrameWork.Page.PagedList<Model.FlashImage>>" %>
<%@ Import Namespace="Com.FrameWork.Page" %>
<%@ Import Namespace="Model" %>
<%@ Import Namespace="Web.Util" %>
<%@ Import Namespace="Com.FrameWork.Page" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title></title>
<script type="text/javascript" src="/Scripts/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/Content/skin/css/base.css"/>
<script type="text/javascript">
    function Save()
    {
        var title = $("#title").val();
        if (title == "") {
            alert("标题不能为空");
            $("#title").focus();
            return false;
        }
        var sid = $("#sid").val();
        if (sid == "") {
            alert("序号不能为空");
            $("#sid").focus();
            return false;
        }
        if (isNaN(sid) == true) {
            alert("序号请填写数字");
            $("#sid").focus();
            return false;
        }
        var website = $("#website").val();
        if (website == "") {
            alert("连接地址不能为空");
            $("#website").focus();
            return false;
        }
        $("#form1").attr("action", "/Admin/UpdateFlash");
        $("#form1").submit();
    }
</script>
</head>
<%   
    FlashImage flash = ViewData["flash"] as FlashImage;
    var item = flash.item;
    var title = flash.title;
    var website = flash.website;
    var sid = flash.sid;
    var id = flash.id;
    var puber = flash.puber;
    var pubdate = flash.pubdate;
    var imgurl = flash.imgurl;
%>
<body>
<form id="form1" method="post" action="/Admin/UpdateFlash" enctype="multipart/form-data">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
<td height="30">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td width="15" height="30"><img src="../../Content/images/tab_03.gif" width="15" height="30" /></td>
    <td align="left" background="../../Content/images/tab_05.gif"><b>修改广告图片信息</b></td>
    <td width="14"><img src="../../Content/images/tab_07.gif" width="14" height="30" /></td>
    </tr>
</table></td>
</tr>
<tr>
<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td width="9" background="../../Content/images/tab_12.gif">&nbsp;</td>
    <td bgcolor="#F3FFE3">
    <!--内容显示-->
    <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" style="margin-top:8px">
    <tr align="center" bgcolor="#FAFAF1" style="background:url(../../Content/images/tab_14.gif)" height="22">
	    <td colspan="10" align="left">&nbsp;</td>
	</tr>
    <tr align="center" bgcolor="#FFFFFF" height="22" >
        <td colspan="10">
        <table width="70%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="th" nowrap="nowrap">所属栏目</td>
            <td height="35" colspan="3" align="left">
              <select id="item" name="item" class="ltb" style="width:90px;">               
                <option value="首页" <%:item.Equals("首页") ? "selected='selected'" : ""%>>首页</option>
                <option value="酒店" <%:item.Equals("酒店") ? "selected='selected'" : ""%>>酒店</option>
                <option value="景点" <%:item.Equals("景点") ? "selected='selected'" : ""%>>景点</option>
              </select> 
            </td>
        </tr> 
        <tr>
            <td class="th" nowrap="nowrap">标题</td>
            <td height="35" colspan="3" align="left">
                <input id="title" name="title" type="text" value="<%:title %>" class="ltb"/>
            </td>
        </tr>
        <tr>
            <td class="th" nowrap="nowrap">序号</td>
            <td height="35" colspan="3" align="left">
               <input id="sid" name="sid" maxlength="2" value="<%:sid %>" type="text" class="ltb"/>
            </td>
        </tr>
        <tr>
            <td>原始图片</td>
            <td height="35" colspan="3" align="left">
                <img src="<%:imgurl %>" style="width:500px; height:200px;"/>
            </td>
        </tr>       
        <tr>
            <td class="th" nowrap="nowrap">上传图片</td>
            <td height="20" colspan="3" align="left">           
            <input id="uploadImg" name="uploadImg" type="file" />                     
            </td>
        </tr>  
       <tr>
            <td class="th" nowrap="nowrap">链接地址</td>
            <td height="35" colspan="3" align="left">
              <input id="website" name="website" value="<%:website %>" type="text" class="ltb"/>
            </td>
        </tr>
       </table>
      </td>
    </tr>
    </table>     
    </td>
    <td width="9" background="../../Content/images/tab_16.gif">&nbsp;</td>
    </tr>
</table>
</td>
</tr>
<tr>
<td height="25">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr style=" text-align:center;">
    <td width="15" height="25">
    <img src="../../Content/images/tab_20.gif" width="15" height="25" /></td>
    <td background="../../Content/images/tab_21.gif">
    <input type="submit" onclick="return Save();" class="elf_btn" value="保存" />
    <input type="button" class="elf_btn" value="返回" onclick="javascript:history.go(-1);"/>        
    <input id="id" name="id" type="hidden" value="<%:id %>"/>
    <input id="imgurl" name="imgurl" type="hidden" value="<%:imgurl %>"/>
    <input id="puber" name="puber" type="hidden"/>
    <input id="pubdate" name="pubdate" type="hidden" value="<%:pubdate %>"/>
    </td>
    <td width="14"><img src="../../Content/images/tab_22.gif" width="14" height="29" /></td>
    </tr>
</table>
</td>
</tr>
</table>
</form>
</body>
</html>