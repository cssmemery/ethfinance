<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Com.FrameWork.Page.PagedList<Model.Label>>" %>
<%@ Import Namespace="Com.FrameWork.Page" %>
<%@ Import Namespace="Com.FrameWork.Util" %>
<div id="dvOrders">
<tr>
    <td style="width:30px;"><input type="checkbox" id="chkall" onclick="checkAll();" name="chkall"/></td>
	<td>城市ID</td>
	<td>城市名称</td>
	<td>父类别</td>
	<td>父名称</td>
    <td>类别</td>
    <td>类别名称</td>
    <td>操作</td>   
    <td>地标总数</td>
</tr>
<%foreach (var item in Model)
{
    var lid = item.cid + item.pid + item.lid;
 %>
 <tr bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" >
    <td>
      <input type="checkbox" id="chk" value="<%:item.cid+"|"+item.cname+"|"+item.pid+"|"+item.pname+"|"+item.lid+"|"+item.lname%>" name="chk"/>
    </td>
	<td><%:item.cid %></td>
	<td><%:item.cname %></td>
	<td><%:item.pid %></td>
	<td><%:item.pname %></td>
    <td><%:item.lid %></td>
	<td><%:item.lname %></td>	   
    <td>        
        <a href="javascript:updateLabel('<%:item.cid %>','<%:item.cname %>','<%:item.pid %>','<%:item.pname %>','<%:item.lid %>','<%:item.lname %>');">更新地标</a>
    </td>    
    <td><span id="lid<%:lid %>" style="color:Red;"><%:item.status %>/<%:item.labelnum %></span></td>
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