<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Com.FrameWork.Page.PagedList<Model.Province>>" %>
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
<script type="text/javascript">
    function checkAll() {
        if ($("#chkall").attr("checked") == "checked") {
            $("input[name='chk']").each(function () { this.checked = true; });
        }
        else {
            $("input[name='chk']").each(function () { this.checked = false; });
        }
    }
    function updateSence(pid) {
        var xmlHttp = GetXMLHttpRequest();
        var r = Math.random();
        xmlHttp.open("GET", "/admin/ExecuteSence?pid=" + pid + "&r=" + r + "", true);
        xmlHttp.onreadystatechange = updatePage;
        xmlHttp.send(null);
        function updatePage() {
            if (xmlHttp.readyState == "4") {
                var xml = xmlHttp.responseText;
                $("#hotel" + pid + "").html(xml);
            }
            else {
                $("#hotel" + pid + "").html("更新中......");
            }
        }
    }
    function ExecuteSence() {
        var pidlist = "";
        var pid = "";
        $('input[name="chk"]').each(function () {
            if (this.checked) {
                pid = this.value;
                updateSence(pid);
                pidlist += pid + ",";
            }
        });
        if (pidlist == "") {
            alert("未选中任何项");
            return false;
        }
    }
    function del() {
        var pidlist = "";
        var pid = "";
        $('input[name="chk"]').each(function () {
            if (this.checked) {
                pid = this.value;
                pidlist += pid + ",";
            }
        });
        if (pidlist == "") {
            alert("未选中任何项");
            return false;
        }
        $("#pidlist").attr("value", pidlist);
        $("#form1").attr("action", "/admin/DeleteSence");
        $("#form1").submit();
    }
    function sub() {
        $("#form1").attr("action", "/admin/ProvList");
        $("#form1").submit();  
    }
</script>
</head>
<body>
<form id="form1" action="/admin/ProvList">
<%
    Province prov = ViewData["SearchModel"] as Province;
    var pname = "";
    if (prov != null)
    {
        pname = prov.pname;       
    }
%>
<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="12" background="/Content/skin/images/tbg.gif">&nbsp;省份列表&nbsp;</td>
</tr>
<tr bgcolor="#FAFAF1">
 <td width="90">省份名称：</td>
 <td colspan="2">
  <input type="text" name="pname" value="<%:pname %>" id="pname" class="tb"/>
 </td>
<td colspan="8">
    <input id="pidlist" name="pidlist" type="hidden"/>
    <input name="btnsearch" id="btnsearch" value="查询" type="button" onclick="sub();" class="btn" />
    <input name="btnsearch" id="btnExecute" onclick="ExecuteSence();" value="更新景点" type="button" class="btn" />
    <input name="btnsearch" id="btnDel" onclick="del();" value="删除" type="button" class="btn" />
</td>
</tr>
<%Html.RenderPartial("AjaxProv", Model); %>
</table>
</form>
</body>
</html>
