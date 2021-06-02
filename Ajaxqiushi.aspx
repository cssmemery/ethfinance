<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Com.FrameWork.Page.PagedList<Model.Qiushi>>" %>
<%@ Import Namespace="Com.FrameWork.Page" %>
<%@ Import Namespace="Com.FrameWork.Util" %>
<div id="dvOrders">
<tr>   
	<td style="width:200px;">标题</td>
	<td style="width:400px;">内容</td>	
	<td style="width:80px;">发布日期</td>
    <td>操作</td>    
</tr>
<%foreach (var item in Model)
{
 %>
 <tr bgcolor="#FFFFFF" height="22" >
   	<td><%:item.title %></td>
	<td><span title="<%:item.qcontent %>"><%:Html.cut(item.qcontent,60) %></span></td>	
	<td><span title="<%:item.pubdate %>"><%:Html.cut(item.pubdate,10) %></span></td>
    <td>
     <a href="javascript:edit('<%:item.id %>');">编辑</a>
     <a href="/admin/deleteqiushi?id=<%:item.id %>" >删除</a>
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