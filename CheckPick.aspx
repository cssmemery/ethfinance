<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Com.FrameWork.Page" %>
<%@ Import Namespace="Com.FrameWork.Util" %>
<%@ Import Namespace="Model" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>处理提现申请</title>
    <link href="/Content/css/manage.css" type="text/css" rel="Stylesheet" />
    <script type="text/javascript" src="/Scripts/jquery-1.7.1.min.js"></script>
    <script type="text/javascript">
        function Save() {
            var status = $('input[name="status"]:checked').val();
            if (status == "成功"){
                var uploadImg = $("#uploadImg").val();
                var proof = $("#proof").val();
                if(uploadImg == "" && proof=="")
                {
                    alert("请上传付款凭证");
                    return false;
                }
                else
                {
                    var extend = uploadImg.substr(uploadImg.indexOf(".")).toUpperCase();
                    if (extend != ".PNG" && extend != ".JPG" && extend != ".JEPG" && extend != ".GIF") {
                        alert("上传文件格式不正确，请上传png,jpg,jepg,gif为后缀名的文件");
                        return false;
                    }
                }
            }
            var remarks = $("#remarks").val();
            if (remarks == "") {
                alert("请填写处理意见");
                $("#checkremark").focus();
                return false;
            }            
            $("#form1").submit();
        }
    </script>    
</head>
<body>
<form id="form1" method="post" action="/admin/CheckPostPick" enctype="multipart/form-data">
<%
    Pick pick = ViewData["pick"] as Pick;
    var id = "";
    var status = "";
    var remarks = "";
    var proof = "";
    if (pick != null)
    {
        id = pick.id;
        status = pick.status;
        remarks = pick.remarks;
        proof = pick.proof;
    }
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
<tr>
    <td>状态</td>
    <td height="30" colspan="3" align="left">
        <input type="radio" name="status" <%:status=="处理中"?"checked='checked'":"" %> value="处理中"/>处理中
        <input type="radio" name="status" <%:status=="成功"?"checked='checked'":"" %> value="成功"/>成功
        <input type="radio" name="status" <%:status=="取消"?"checked='checked'":"" %> value="取消"/>取消              
    </td>
</tr>
<tr>
    <td>支付凭证</td>
    <td height="30" colspan="3" align="left">
    <input id="uploadImg" name="uploadImg" type="file" class="tb"/>
    </td>
</tr>
<tr>
    <td>意见</td>
    <td height="30" colspan="3" align="left">
    <textarea id="remarks" name="remarks" rows="3" class="tb" cols="3" style="width:300px; height:100px;"><%:remarks%></textarea>        
    </td>
</tr>
<tr>   
  <td colspan="4" align="center" background="/Content/manage/tab_21.gif">
    <input id="id" name="id" type="hidden" value="<%:id %>"/>
    <input id="proof" name="proof" type="hidden" value="<%:proof %>"/>
    <input type="button" onclick="return Save();" class="elf_btn" value="保存" />   
  </td>   
</tr>
</tbody> 
</table>
</form>
</body>
</html>
