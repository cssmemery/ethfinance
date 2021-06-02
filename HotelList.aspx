<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>酒店列表</title>
    <style type="text/css">
    .tab1{ border-collapse:collapse; border:0px solid #ccc; font-size:13px;}
    .tab1 tr{border:1px solid #ccc;height:25px;}
    .tab1 td{ border:1px solid #ccc;}
    .tb{width:120px; height:20px; font-size:13px;line-height:20px; border:solid 1px #ccc; text-transform:uppercase;}
    </style>
    <script type="text/javascript" src="/Scripts/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="/Scripts/artDialog/artDialog.js?skin=default"></script>
    <script type="text/javascript" src="/Scripts/artDialog/artDialog.iframeTools.source.js"></script>
    <script type="text/javascript" src="/Scripts/MicrosoftAjax.js"></script>
    <script type="text/javascript" src="/Scripts/MicrosoftMvcAjax.js"></script>
    <script type="text/javascript">
        function sub() {
            $("#form1").attr("action", "/admin/HotelList");
            $("#form1").submit();
        }
        function edithotel(id) {
            var url = "/admin/edithotel?id=" + id + "";
            art.dialog.open(url, { title: '编辑酒店资讯信息', width: '700px', height: '300px', lock: true, background: 'White', opacity: 0.7 });
        }
    </script>
</head>
<body>
<form id="form1">
<% 
    Model.Hotel hotel = ViewData["SearchModel"] as Model.Hotel;
    var hname = "";   
    if(hotel != null)
    {
        hname = hotel.hname;        
    }    
%>
<table width="100%" border="0" class="tab1" style="text-align:left;">
  <tr>    
    <td colspan="6" style="height:30px;text-align:left; font-size:13px; line-height:30px; font-weight:bold;">酒店列表信息</td>    
  </tr>
  <tr>
    <td>酒店名称</td>
    <td>
       <input id="hname" name="hname" value="<%:hname %>" type="text" class="tb"/> 
    </td>
    <td colspan="4" style=" text-align:left;">
        <input type="button" onclick="sub();" style="width:60px;" value="查询" name="search" class="elf_btn" />         
    </td>
  </tr>
  <%Html.RenderPartial("AjaxHotel", Model); %> 
</table>
</form>
</body>
</html>
