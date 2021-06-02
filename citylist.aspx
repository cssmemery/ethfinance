<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Com.FrameWork.Page.PagedList<Model.City>>" %>
<%@ Import Namespace="Com.FrameWork.Page" %>
<%@ Import Namespace="Model" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
<script type="text/javascript" src="/Scripts/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="/Scripts/MicrosoftAjax.js"></script>
<script type="text/javascript" src="/Scripts/MicrosoftMvcAjax.js"></script>
<script type="text/javascript" src="/Scripts/pub.js"></script>
<link rel="stylesheet" type="text/css" href="/Content/skin/css/base.css"/>
<script type="text/javascript">
function checkAll() {   
    if ($("#chkall").attr("checked") == "checked") {
        $("input[name='chk']").each(function () { this.checked = true; });
    }
    else {
        $("input[name='chk']").each(function () { this.checked = false; });
    }
}
function updateHotel(cid)
{
    var xmlHttp = GetXMLHttpRequest();
    var r = Math.random();
    xmlHttp.open("GET", "/admin/ExecuteHotel?cid=" + cid + "&r=" + r + "", true);
    xmlHttp.onreadystatechange = updatePage;
    xmlHttp.send(null);
    function updatePage() {
        if(xmlHttp.readyState == "4")
        {
            var xml = xmlHttp.responseText;
            $("#hotel" + cid + "").html(xml);
        }
        else {
            $("#hotel" + cid + "").html("更新中......");
        }
    }
}
function updateTheme(cid, cname) {
    var xmlHttp1 = GetXMLHttpRequest();
    var r = Math.random();
    xmlHttp1.open("GET", "/admin/ExecuteTheme?cid=" + cid + "&r=" + r + "&cname=" + escape(cname) + "", true);
    xmlHttp1.onreadystatechange = updatePage1;
    xmlHttp1.send(null);
    function updatePage1() {
        if (xmlHttp1.readyState == "4") {
            var xml = xmlHttp1.responseText;
            $("#theme" + cid + "").html(xml);
        }
        else {
            $("#theme" + cid + "").html("更新中......");
        }
    }
}
function ExecuteHotel() {    
    var cidlist = "";
    var cid = "";
    $('input[name="chk"]').each(function () {
        if (this.checked) {
            cid = this.value.split('|')[0];
            updateHotel(cid);
            cidlist += cid + ",";
        }
    });
    if (cidlist == "") {
        alert("未选中任何项");
        return false;
    }
}
function ExecuteTheme() {
    var cidlist = "";
    var cid = "";
    var cname = "";
    $('input[name="chk"]').each(function () {
        if (this.checked) {
            cid = this.value.split('|')[0];
            cname = this.value.split('|')[1];
            updateTheme(cid, cname);
            cidlist += cid + ",";
        }
    });
    if (cidlist == "") {
        alert("未选中任何项");
        return false;
    }
}
function del() {
    var cidlist = "";
    var cid = "";
    var cname = "";
    $('input[name="chk"]').each(function () {
        if (this.checked)
        {
            cid = this.value.split('|')[0];         
            cidlist += cid + ",";
        }
    });
    if (cidlist == "") {
        alert("未选中任何项");
        return false;
    }
    $("#cidlist").attr("value", cidlist);
    $("#form1").attr("action", "/admin/DeleteHotel");
    $("#form1").submit();
}
function sub() {
    $("#form1").attr("action", "/admin/citylist");
    $("#form1").submit();
}
</script>
</head>
<body>
<form id="form1" name="form1" action="/admin/citylist">
<%
    City ct = ViewData["SearchModel"] as City;
    var pname = "";
    var cname = "";
    if(ct != null)
    {
        pname = ct.pname;
        cname = ct.cname;   
    }
%>
<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="12" background="/Content/skin/images/tbg.gif">&nbsp;城市列表&nbsp;</td>
</tr>
<tr bgcolor="#FAFAF1">
 <td width="70">省份名称：</td>
 <td colspan="2">
  <input type="text" name="pname" value="<%:pname %>" id="pname" class="tb"/>
 </td>
 <td width="70">城市名称：</td>
<td colspan="2">
   <input type="text" name="cname" value="<%:cname %>" id="cname" class="tb"/>
</td>
<td colspan="8">
    <input id="cidlist" name="cidlist" type="hidden"/>
    <input name="btnsearch" id="btnsearch" value="查询" type="button" onclick="sub();" class="btn" />
    <input name="btnsearch" id="btnExecute" onclick="ExecuteHotel();" value="更新酒店" type="button" class="btn" />
    <input name="btnsearch" id="btnTheme" onclick="ExecuteTheme();" value="更新主题" type="button" class="btn" />    
</td>
</tr>
<%Html.RenderPartial("AjaxCity", Model); %>
</table>
</form>
</body>
</html>
