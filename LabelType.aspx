<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Com.FrameWork.Page.PagedList<Model.Label>>" %>
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
    function updateLabel(cid, cname, pid, pname, lid, lname) {
        var labelid = cid + pid + lid;
        var xmlHttp1 = GetXMLHttpRequest();
        var r = Math.random();
        xmlHttp1.open("GET", "/admin/getLabelList?cid=" + cid + "&r=" + r + "&cname=" + escape(cname) + "&pid="+pid+"&pname="+escape(pname)+"&lid="+lid+"&lname="+escape(lname)+"", true);
        xmlHttp1.onreadystatechange = updatePage1;
        xmlHttp1.send(null);
        function updatePage1() {
            if (xmlHttp1.readyState == "4") {
                var xml = xmlHttp1.responseText;
                $("#lid" + labelid + "").html(xml);
            }
            else {
                $("#lid" + labelid + "").html("更新中......");
            }
        }
    }
    function ExecuteLabel() {
        var cidlist = "";
        var cid = "";
        var cname = "";
        var pid = "";
        var pname = "";
        var lid = "";
        var lname = "";
        $('input[name="chk"]').each(function () {
            if (this.checked) {
                cid = this.value.split('|')[0];
                cname = this.value.split('|')[1];
                pid = this.value.split('|')[2];
                pname = this.value.split('|')[3];
                lid = this.value.split('|')[4];
                lname = this.value.split('|')[5];
                updateLabel(cid, cname,pid,pname,lid,lname);
                cidlist += cid + ",";
            }
        });
        if (cidlist == "") {
            alert("未选中任何项");
            return false;
        }
    }
</script>
</head>
<body>
<form id="form1" action="/admin/LabelType">
<%
    Model.Label ct = ViewData["SearchModel"] as Model.Label;   
    var cname = "";
    var lname = "";
    if(ct != null)
    {       
        cname = ct.cname;
        lname = ct.lname; 
    }
%>
<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="12" background="/Content/skin/images/tbg.gif">&nbsp;地表类别列表&nbsp;</td>
</tr>
<tr bgcolor="#FAFAF1">
 <td width="90">城市名称：</td>
 <td width="160">
  <input type="text" name="cname" value="<%:cname %>" id="cname" class="tb"/>
 </td>
 <td width="70">类别名称：</td>
<td width="160">
   <input type="text" name="lname" value="<%:lname %>" id="lname" class="tb"/>
</td>
<td colspan="8">
    <input name="btnsearch" id="btnsearch" value="查询" type="submit" class="btn" />
    <input name="btnsearch" id="Button1" onclick="ExecuteLabel();" value="更新地标" type="button" class="btn" />
</td>
</tr>
<%Html.RenderPartial("AjaxLabelType", Model); %>
</table>
</form>
</body>
</html>
