<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Com.FrameWork.Page.PagedList<Model.User>>" %>
<%@ Import Namespace="Com.FrameWork.Page" %>
<%@ Import Namespace="Com.FrameWork.Util" %>
<div id="dvOrders">
<tr>    
	<td>序号</td>
	<td>登录用户</td>	
	<td>用户名称</td>
    <td>操作日期</td>   
    <td>操作</td>
</tr>
<%int k = 0; %>
<%
    if(Model != null && Model.Count > 0)
    {
        foreach (var item in Model)
        {
            k++;
         %>
         <tr bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" >
	        <td><%:k %></td>	
	        <td><%:item.useruser %></td>
            <td><%:item.username %></td>
            <td><%:item.pubdate %></td>
            <td>               
                <a href="javascript:edit('<%:item.id %>');">编辑</a>
                <a href="/admin/deleteUser?id=<%:item.id %>">删除</a>
            </td>   
        </tr>
         <%      
        }    
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