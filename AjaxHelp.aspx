<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Com.FrameWork.Page.PagedList<Model.Help>>" %>
<%@ Import Namespace="Com.FrameWork.Page" %>
<%@ Import Namespace="Com.FrameWork.Util" %>
<div id="dvOrders" style=" text-align:left;">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
  <td height="30">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="30"><img src="/Content/images/tab_03.gif" width="15" height="30" /></td>
        <td align="left" background="/Content/images/tab_05.gif"><b>帮助信息维护</b></td>
        <td width="14"><img src="/Content/images/tab_07.gif" width="14" height="30" /></td>
      </tr>
    </table>
   </td>
 </tr>
 <tr>
  <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9" background="../../Content/images/tab_12.gif">&nbsp;</td>
        <td bgcolor="#F3FFE3">
        <!--内容显示-->
        <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" style="margin-top:8px">
        <tr bgcolor="#FAFAF1" style="background:url(../../Content/images/tab_14.gif)" height="22">
        <td style="width:300px;">标题</td>       
        <td style="width:40px;">序号</td>      
        <td style="width:80px;">所属栏目</td>
        <td style="width:100px;">发布日期</td>         
        <td>操作</td>  
        </tr>
        <%if(Model != null && Model.Count > 0)
        {
            foreach(var item in Model)
            {
               %>
               <tr bgcolor="#FFFFFF" height="22">
               <td><%:item.title %></td>
               <td><%:item.sxh %></td>                             
               <td><%:item.item%></td>
               <td><span title="<%:item.pubdate %>"><%:Html.cut(item.pubdate,10) %></span></td>                       
               <td>
               <a href="/Admin/EditHelp?id=<%:item.id %>">编辑</a>
               <a href="/Admin/deleteHelp?id=<%:item.id %>">删除</a>
               </td>              
               </tr>
               <%  
            }    
        }
        %>       
        <tr bgcolor="#EEF4EA">
	      <td height="36" colspan="18" bgcolor="#F3FFE3"><!--翻页代码 -->          
           <div class="pagelist">
             <div class="pagelistbox">
              <%=Html.AjaxPager(Model, new PagerOptions { PageIndexParameterName = "pageIndex", CssClass = "pagerItem", FirstPageText = "首页", LastPageText = "末页", PrevPageText = "上一页", NextPageText = "下一页", CurrentPagerItemWrapperFormatString = "<span class=\"redbold\">{0}</span>" }, new AjaxOptions { UpdateTargetId = "dvOrders", OnComplete = "unlock1", OnBegin = "lock" })%>
             </div>        
           </div>
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
    <td height="29"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="29"><img src="../../Content/images/tab_20.gif" width="15" height="29" /></td>
        <td background="../../Content/images/tab_21.gif">&nbsp;</td>
        <td width="14"><img src="../../Content/images/tab_22.gif" width="14" height="29" /></td>
      </tr>
    </table>
   </td>
  </tr> 
</table>
</div>