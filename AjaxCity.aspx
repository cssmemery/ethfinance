<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Com.FrameWork.Page.PagedList<Model.City>>" %>
<%@ Import Namespace="Com.FrameWork.Page" %>
<%@ Import Namespace="Com.FrameWork.Util" %>
<div id="dvOrders">
<tr>
    <td style="width:40px;"><input type="checkbox" id="chkall" onclick="checkAll();" name="chkall"/></td>
	<td style="width:60px;">城市ID</td>
	<td style="width:80px;">城市名称</td>	
	<td style="width:80px;">酒店状态</td>   
    <td style="width:80px;">主题状态</td>
    <td style="width:120px;">操作</td>
    <td>酒店结果</td>
    <td>主题结果</td>
</tr>
<%foreach (var item in Model)
{
 %>
 <tr bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" >
    <td>
      <input type="checkbox" id="chk" value="<%:item.cid+"|"+item.cname%>" name="chk"/>
    </td>
	<td><%:item.cid %></td>
	<td><%:item.cname %></td>	
	<td><span style="color:Red;"><%:item.status %>/<%:item.hcount %></span></td>   
    <td><span style="color:Red;"><%:item.tstatus %>/<%:item.tcount %></span></td>
    <td>
        <a href="javascript:updateHotel('<%:item.cid %>');">更新酒店</a>      
        <a href="javascript:updateTheme('<%:item.cid %>','<%:item.cname %>');">更新主题</a>
    </td>
    <td><span id="hotel<%:item.cid %>" style="color:Red;"></span></td>   
    <td><span id="theme<%:item.cid %>" style="color:Red;"></span></td>
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