<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Com.FrameWork.Page.PagedList<Model.New>>" %>
<%@ Import Namespace="Com.FrameWork.Page" %>
<%@ Import Namespace="Com.FrameWork.Util" %>
<div id="dvOrders" style="text-align:left;">
  <tr style="background-color:#ff6;">
    <td style="width:40px;"><input type="checkbox" id="chkall" onclick="checkAll();" name="chkall"/></td>
    <td style="width:120px;">发布日期</td>
    <td style="width:60px;">是否推荐</td>    
    <td style="width:250px;">标题</td>
    <td style="width:80px;">点击次数</td>
    <td>操作</td>
  </tr>
  <%if(Model != null && Model.Count > 0)
  {
      foreach(var item in Model)
      {
        %>
          <tr>
            <td><input type="checkbox" id="chk" value="<%:item.id %>" name="chk"/></td>
            <td style="width:120px;"><span title="<%:item.pubdate %>"><%:Html.cut(item.pubdate,10) %></span></td>
            <td style="width:60px;"><%:item.ishot %></td>    
            <td style="width:450px;"><span title="<%:item.title %>"><%:Html.cut(item.title,30) %></span></td>
            <td style="width:80px;"><%:item.clickcount %></td>
            <td><a href="javascript:update('<%:item.id %>');">编辑</a></td>
          </tr> 
        <%   
      }     
  }
  %>
  <tr bgcolor="#EEF4EA">
	<td height="36" colspan="16" bgcolor="#F3FFE3"><!--翻页代码 -->          
    <div class="pagelist">
        <div class="pagelistbox">
        <%=Html.AjaxPager(Model, new PagerOptions { PageIndexParameterName = "pageIndex", CssClass = "pagerItem", FirstPageText = "首页", LastPageText = "末页", PrevPageText = "上一页", NextPageText = "下一页", CurrentPagerItemWrapperFormatString = "<span class=\"redbold\">{0}</span>" }, new AjaxOptions { UpdateTargetId = "dvOrders", OnComplete = "unlock1", OnBegin = "lock" })%>
        </div>        
    </div>
   </td>
  </tr>
</div>