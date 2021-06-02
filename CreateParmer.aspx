<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript" src="/Scripts/jquery-1.7.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/Content/skin/css/base.css"/>
    <style type="text/css">
    .ltb{width:145px; height:25px; font-size:13px;line-height:25px; border:solid 1px #ccc;}
    </style>
    <script type="text/javascript">
        function sub() {
            var pname = $("#pname").val();
            if (pname == "") {
                alert("参数名称不能为空");
                $("#pname").focus();
                return false;
            }
            var pvalue = $("#pvalue").val();
            if (pvalue == "") {
                alert("参数值不能为空");
                $("#pvalue").focus();
                return false;
            }
        }
    </script>
</head>
<body>
<form id="form1" method="post" action="/admin/AddParmer">
<table width="100%" border="0" cellpadding="0" cellspacing="0" style="font-size:14px;">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9" background="/Content/images/tab_12.gif">&nbsp;</td>
        <td bgcolor="#F3FFE3">
        <!--内容显示-->
        <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" style="margin-top:8px">
        <tr bgcolor="#FAFAF1" style="background:url(/Content/images/tab_14.gif)" height="22">
	        <td colspan="10" align="left">&nbsp;</td>
	    </tr>
        <tr bgcolor="#FFFFFF">
          <td colspan="10">
           <table width="100%" border="0" cellpadding="0" cellspacing="0"> 
            <tr style="height:25px;">
              <td width="80">参数名称</td>
              <td height="20" colspan="3">
                <input id="pname" name="pname" type="text" class="ltb"/>
              </td>
            </tr>
            <tr style="height:25px;">
              <td width="80">参数值</td>
              <td height="20" colspan="3">
                <textarea id="pvalue" name="pvalue" cols="3" rows="2" style="width:450px; height:80px;" class="ltb"></textarea>
              </td>
            </tr>
            <tr style="height:25px;">
              <td width="80">参数描述</td>
              <td colspan="3">
               <textarea id="pdesc" name="pdesc" cols="3" rows="2" style="width:300px; height:80px;"></textarea>
              </td>
            </tr>
          </table>
         </td>
        </tr>
        </table>     
        </td>
        <td width="9" background="/Content/images/tab_16.gif">&nbsp;</td>
      </tr>
    </table>
   </td>
  </tr>
  <tr>
    <td height="25">
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr style=" text-align:center;">        
        <td background="/Content/images/tab_21.gif">
        <input type="submit" class="btn" onclick="return sub();" style="height:25px; line-height:25px;" value="添加" />        
        </td>
      </tr>
    </table>
   </td>
  </tr>
</table>
</form>
</body>
</html>
