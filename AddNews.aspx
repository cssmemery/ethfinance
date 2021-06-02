<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="/Content/css/manage.css" type="text/css" rel="Stylesheet" />
    <script type="text/javascript" src="/Scripts/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="/Scripts/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Scripts/editor/kindeditor.js"></script>
    <script type="text/javascript">
        KE.show({
            id: 'ncontent',
            imageUploadJson: '/admin/UploadImage'
        });
        function Save() {
            var title = $("#title").val();
            if (title == "") {
                alert("标题不能为空");
                $("#title").focus();
                return false;
            }
            var route = KE.html('ncontent');
            if (route == "") {
                alert("内容不能为空");
                $("#ncontent").focus();
                return false;
            }           
            $("#form1").submit();
        }
    </script>
</head>
<body>
<form id="form1" method="post" action="/admin/PostAddNew">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
<tr>
    <td>标题</td>
    <td height="30" colspan="3" align="left">
    <input id="title" name="title" type="text" class="tb" style="width:200px;" />          
    </td>
</tr> 
<tr>
    <td>是否热门</td>
    <td height="35" colspan="3" align="left">
        <select id="ishot" name="ishot" class="tb" style="width:120px;">
        <option value="是">是</option>
        <option value="否">否</option>                
        </select>
    </td>
</tr>
<tr>
    <td>内容</td>
    <td colspan="3" align="left">    
        <textarea id="ncontent" rows="2" cols="2" name="ncontent" style="width:700px;height:300px;"></textarea>
    </td>
</tr>
<tr>   
  <td colspan="4" align="center" background="/Content/manage/tab_21.gif">
    <input type="submit" onclick="return Save();" class="elf_btn" value="保存" />   
  </td>   
</tr>
</tbody>      
         
</table>
</form>
</body>
</html>
