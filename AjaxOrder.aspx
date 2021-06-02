<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Com.FrameWork.Page.PagedList<Model.Order>>" %>
<%@ Import Namespace="Com.FrameWork.Page" %>
<%@ Import Namespace="Com.FrameWork.Util" %>
<div id="dvOrders">
<tr>    
	<td>订单编号</td>
	<td>酒店名称</td>	
	<td>房型名称</td>
    <td>入住日期</td>
    <td>离店日期</td>
    <td>联系人/邮箱地址</td>
    <td>联系电话</td>    
    <td>入住人</td> 
    <td>房间数</td>   
    <td>票价</td>
    <td>订单状态</td>
</tr>
<%foreach (var item in Model)
{
 %>
 <tr bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" >
	<td><%:item.uid %></td>
	<td><span title="<%:item.hname %>"><%:Html.cut(item.hname,8) %></span></td>	
	<td><%:item.rname %></td>
    <td><%:item.indate %></td>
    <td><%:item.outdate %></td>
    <td><%:item.lxr %>/<%:item.email %></td>
    <td><%:item.phone %></td>    
    <td><%:item.guest %></td> 
    <td><%:item.roomnum %></td>   
    <td><%:item.price %></td>
    <td>
     <span style="color:Red;" id="span<%:item.uid %>"><%:item.status %></span> 
     <%if(!item.status.Equals("已取消") && !item.status.Equals("未入住"))
       {
          %>
          <script type="text/javascript">
              getstatus('<%:item.uid %>');
          </script>
          <%  
       }
      %>
    </td>
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