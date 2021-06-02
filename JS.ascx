<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<script type="text/javascript">
    alert('<%=ViewData["Tips"] %>');
    window.location.href = '<%=ViewData["Url"] %>';
</script>