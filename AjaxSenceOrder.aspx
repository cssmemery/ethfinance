<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Com.FrameWork.Page.PagedList<Model.SenceOrder>>" %>
<%@ Import Namespace="Com.FrameWork.Page" %>
<%@ Import Namespace="Com.FrameWork.Util" %>
<div id="dvOrders">
<tr>    
	<td>订单编号</td>
	<td>景点名称</td>	
	<td>门票类型</td>
    <td>票面价格</td>
    <td>预订人</td>
    <td>预订人电话</td>
    <td>取票人</td>    
    <td>取票电话</td> 
    <td>游玩日期</td>   
    <td>张数</td>    
</tr>
<%foreach (var item in Model)
{
 %>
 <tr bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" >
	<td><%:item.oid %></td>
	<td><span title="<%:item.sceneryName %>"><%:Html.cut(item.sceneryName,8) %></span></td>	
	<td><%:item.ticketPriceName %></td>
    <td><%:item.ticketPrice %></td>
    <td><%:item.bookingName %></td>
    <td><%:item.bookingMobile %></td>
    <td><%:item.travelerName %></td>    
    <td><%:item.travelerMobile %></td> 
    <td><%:item.travelDate %></td>   
    <td><%:item.ticketNumber %></td>    
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