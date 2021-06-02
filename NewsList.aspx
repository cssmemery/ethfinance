<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>资讯信息维护</title>
    <link href="/Content/css/manage.css" type="text/css" rel="Stylesheet" />
    <script type="text/javascript" src="/Scripts/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="/Scripts/artDialog/artDialog.js?skin=default"></script>
    <script type="text/javascript" src="/Scripts/artDialog/artDialog.iframeTools.source.js"></script>
    <script type="text/javascript">
        function Add() {
            var url = "/admin/AddNews";
            art.dialog.open(url, { title: '添加资讯信息', width: '800px', height: '400px', lock: true, background: 'White', opacity: 0.7 });
        }
        function update(id) {
            var url = "/admin/updateNews?id=" + id + "";
            art.dialog.open(url, { title: '编辑资讯信息', width: '800px', height: '400px', lock: true, background: 'White', opacity: 0.7 });
        }
        function checkAll() {
            if ($("#chkall").attr("checked") == "checked") {
                $("input[name='chk']").each(function () { this.checked = true; });
            }
            else {
                $("input[name='chk']").each(function () { this.checked = false; });
            }
        }
        function sub() {
            $("#form1").attr("action", "/admin/NewsList");
            $("#form1").submit();
        }
        function del() {
            var noList = "";
            $('input[name="chk"]').each(function () {
                if (this.checked) {
                    noList += this.value + ",";
                }
            });
            if (noList == "") {
                alert("未选中任何项");
                return false;
            }
            else {
                if (confirm("确认要删除选中的项吗？")) {
                    $("#idlist").attr("value", noList);
                    $("#postfrom").attr("action", "/admin/deleteNews");
                    $("#postfrom").submit();
                }
            }
        }
    </script>
</head>
<body>
<form id="postfrom" action="/admin/deleteNews" method="post">
  <input id="idlist" name="idlist" type="hidden"/>  
</form>
<form id="form1" action="/admin/NewsList">
<% 
    Model.New n = ViewData["SearchModel"] as Model.New;
    var title = "";   
    if(n != null)
    {       
        title = string.IsNullOrEmpty(n.title) ? "" : n.title;
    }    
%>
<table width="100%" border="0" class="tab1" style=" text-align:left;">
  <tr>    
    <td colspan="6" style="height:30px;text-align:left; font-size:13px; line-height:30px; font-weight:bold;" background="/Content/manage/tab_05.gif">资讯信息维护</td>    
  </tr>
  <tr>
    <td>标题</td>
    <td><input type="text" id="title" value="<%:title %>" class="tb" name="title"/></td>
    <td colspan="2" style="text-align:left;">
        <input type="button" onclick="sub();" style="width:60px;" value="查询" name="search" class="elf_btn" /> 
        <input type="button" onclick="Add();" value="添加" name="create" class="elf_btn" /> 
        <input type="button" onclick="del();" value="删除" name="search" class="elf_btn" />
    </td>
  </tr>
  <%Html.RenderPartial("AjaxNews", Model); %> 
</table>
</form>
</body>
</html>