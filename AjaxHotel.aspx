<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Com.FrameWork.Page.PagedList<Model.Hotel>>" %>
<%@ Import Namespace="Com.FrameWork.Page" %>
<%@ Import Namespace="Com.FrameWork.Util" %>
<div id="dvOrders" style=" text-align:left;">
<tbody style=" text-align:left;">
  <tr style="background-color:#ff6;">  
    <td style="width:135px;">所属城市</td>
    <td style="width:120px;">酒店名称</td>
    <td style="width:560px;">资讯</td>
    <td>操作</td>
  </tr>
  <%if(Model != null && Model.Count > 0)
  {
      foreach(var item in Model)
      {
        %>
          <tr>
            <td><span title="<%:item.cname %>"><%:Html.cut(item.cname, 10)%></span></td>
            <td><span title="<%:item.hname %>"><%:Html.cut(item.hname,9) %></span></td>
            <td><%:item.qiushi %></td>          
            <td><a href="javascript:edithotel('<%:item.hid %>');">编辑资讯</a></td>  
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
</tbody>
</div>