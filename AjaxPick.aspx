<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Com.FrameWork.Page.PagedList<Model.Pick>>" %>
<%@ Import Namespace="Com.FrameWork.Page" %>
<%@ Import Namespace="Com.FrameWork.Util" %>
<div id="dvOrders">
<tr>    
	<td>订单编号</td>
	<td>会员姓名</td>	
	<td>支付宝账号</td>
    <td>真实姓名</td>
    <td>提现金额</td>
    <td>操作日期</td>
    <td>订单状态</td>    
    <td>支付凭证</td>    
    <td>操作</td>
</tr>
<%foreach (var item in Model)
{
    var mname = item.mname;
 %>
 <tr bgcolor="#FFFFFF" height="22" >
	<td><%:item.id %></td>
	<td><%:item.mname %></td>	
	<td><%:item.zfb %></td>
    <td><%:item.zfbname %></td>
    <td><%:item.price %></td>
    <td><%:item.pubdate %></td>
    <td><%:item.status %></td>    
    <td><%:item.proof %><a href="<%:item.proof %>" target="_blank">预览</a></td>     
    <td><a href="javascript:check('<%:item.id %>');">处理</a></td>
</tr>
 <%      
}
%>
<tr align="right" bgcolor="#EEF4EA">
	<td height="36" colspan="12" align="left" bgcolor="#F3FFE3"><!--翻页代码 -->          
    <div class="pagelist">
        <div class="pagelistbox">
        <!--分页显示-->
        <%=Html.AjaxPager(Model, new PagerOptions { PageIndexParameterName = "pageIndex", CssClass = "pagerItem", FirstPageText = "首页", LastPageText = "末页", PrevPageText = "上一页", NextPageText = "下一页", CurrentPagerItemWrapperFormatString = "<span class=\"redbold\">{0}</span>" }, new AjaxOptions { UpdateTargetId = "dvOrders", OnComplete = "unlock1", OnBegin = "lock" })%>
        </div>        
    </div>
</td>
</tr>
</div>