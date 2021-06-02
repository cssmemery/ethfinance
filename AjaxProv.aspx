<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Com.FrameWork.Page.PagedList<Model.Province>>" %>
<%@ Import Namespace="Com.FrameWork.Page" %>
<%@ Import Namespace="Com.FrameWork.Util" %>
<div id="dvOrders">
<tr>
    <td style="width:30px;"><input type="checkbox" id="chkall" onclick="checkAll();" name="chkall"/></td>
	<td style="width:80px;">省份ID</td>
	<td style="width:80px;">省份名称</td>	
	<td style="width:80px;">英文名称</td>
	<td style="width:80px;">景点状态</td>    
    <td style="width:100px;">操作</td>
    <td>更新结果</td>    
</tr>
<%foreach (var item in Model)
{
 %>
 <tr bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" >
    <td>
      <input type="checkbox" id="chk" value="<%:item.pid%>" name="chk"/>
    </td>
	<td><%:item.pid %></td>
	<td><%:item.pname %></td>
	<td><%:item.enName %></td>	
	<td><span style="color:Red;"><%:item.status %>/<%:item.scount %></span></td>    
    <td>
        <a href="javascript:updateSence('<%:item.pid %>');">更新景点</a>       
    </td>
    <td><span id="hotel<%:item.pid %>" style="color:Red;"></span></td>   
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