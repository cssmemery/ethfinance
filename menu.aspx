<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
<link rel="stylesheet" href="/Content/skin/css/base.css" type="text/css" />
<link rel="stylesheet" href="/Content/skin/css/menu.css" type="text/css" />
<script language="javascript" type="text/javascript" src="/Content/skin/js/menu.js"></script>
</head>
<body target="main">
<table width='99%' height="100%" border='0' cellspacing='0' cellpadding='0'>
  <tr>
    <td style='padding-left:3px;padding-top:8px' valign="top">
	<!-- Item 1 Strat -->
      <dl class='bitem'>
        <dt onClick='showHide("items1_1")'><b>常用操作</b></dt>
        <dd style='display:block' class='sitem' id='items1_1'>
          <ul class='sitemu'>
            <li>
              <div class='items'>
                <div class='fllct'><a href="/admin/citylist" target='main'>酒店信息管理</a></div>                
              </div>
            </li>
            <li>
              <div class='items'>
                <div class='fllct'><a href='/admin/OrderList' target='main'>酒店订单列表</a></div>                
              </div>
            </li>
            <li>
              <div class='items'>
                <div class='fllct'><a href='/admin/ProvList' target='main'>景点信息维护</a></div>                
              </div>
            </li>
           <li>
              <div class='items'>
                <div class='fllct'><a href='/admin/SenceOrder' target='main'>景点订单列表</a></div>                
              </div>
           </li>
           <li>
              <div class='items'>
                <div class='fllct'><a href='/admin/PickList' target='main'>提现申请单</a></div>                
              </div>
           </li>
           <li>
              <div class='items'>
                <div class='fllct'><a href='/admin/UserList' target='main'>用户信息管理</a></div>                
              </div>
           </li>
          </ul>
        </dd>
      </dl>
      <!-- Item 1 End -->
      <!-- Item 2 Strat -->
      <dl class='bitem'>
        <dt onClick='showHide("items2_1")'><b>信息管理</b></dt>
        <dd style='display:block' class='sitem' id='items2_1'>
          <ul class='sitemu'>
            <li>
              <div class='items'>
                <div class='fllct'><a href='/admin/LinkList' target='main'>友情连接管理</a></div>                
              </div>
            </li>
            <li>
              <div class='items'>
                <div class='fllct'><a href='/admin/ParmerList' target='main'>常用信息维护</a></div>                
              </div>
            </li>
            <li>
              <div class='items'>
                <div class='fllct'><a href='/admin/ADList' target='main'>广告图片管理</a></div>                
              </div>
            </li>
            <li>
              <div class='items'>
                <div class='fllct'><a href='/admin/HelpList' target='main'>帮助信息维护</a></div>                
              </div>
            </li>
           <li>
              <div class='items'>
                <div class='fllct'><a href='/admin/qiushiList' target='main'>糗事信息</a></div>                
              </div>
            </li>
            <li>
              <div class='items'>
                <div class='fllct'><a href='/admin/NewsList' target='main'>新闻资讯</a></div>                
              </div>
            </li>
          </ul>
        </dd>
      </dl>
      <!-- Item 2 End -->
	  </td>
  </tr>
</table>
</body>
</html>
