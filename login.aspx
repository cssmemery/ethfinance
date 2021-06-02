<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="/Scripts/jquery-1.7.1.min.js"></script>
    <link href="/Content/css/center.css" type="text/css" rel="Stylesheet" />
    <script type="text/javascript">
        function Submitlog() {
            var useruser = $("#useruser").val();
            if(useruser == "")
            {
                alert("请填写用户名");
                $("#useruser").focus();
                return false;
            }
            var pwd = $("#pwd").val();
            if(pwd == "")
            {
                alert("请填写密码");
                $("#pwd").focus();
                return false;
            }
            $("#form1").submit();
        }
    </script>
</head>
<body>
<form id="form1" method="post" action="/admin/PostLogin">
<table class="bg" style="padding-top: 120px" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
  <tbody>
  <tr>
    <td valign="middle" align="center">
      <table cellspacing="0" cellpadding="0" width="615" border="0">
       <tbody>
        <tr>
          <td class="box_title" background="/Content/images/logintop.jpg" colspan="3" style="height: 23px">&nbsp;</td>
        </tr>
        <tr>
          <td valign="top" align="left" width="17"  background="/Content/images/left_bg.jpg"><img src="/Content/images/loginleft.jpg" width="17"></td>
          <td class="loginbg" align="center" width="581" style=" background-image:url(/Content/images/loginbg.jpg)">
            <table cellspacing="0" cellpadding="0" width="98%" border="0">
              <tbody>
              <tr>
                <td align="center" width="45%"><img src="/Content/images/title0.jpg"> <br><img src="/Content/images/login_logo.gif"><br>&nbsp; </td>
                <td align="center"><img src="/Content/images/line_compact.jpg" width="1"></td>
                <td style="padding-left: 15px">
                  <table style="text-align: left" cellspacing="0" cellpadding="0"  width="95%" border="0">
                   <tbody>
                    <tr>
                      <td class="text_red12" colspan="2" height="28"></td>
                    </tr>
                    <tr>
                      <td align="right" height="28">帐&nbsp;&nbsp;&nbsp;号：</td>
                      <td>
                      <input class="formstyle" id="useruser" name="useruser" style="width: 140px"/> 
                      </td>
                    </tr>
                    <tr>
                      <td align="right" height="28">密&nbsp;&nbsp;&nbsp;码：</td>
                      <td><input class="formstyle" id="pwd" name="pwd" style="width: 140px" type="password"/>
                      </td>
                    </tr>                   
                    <tr>
                      <td style="text-align: center" valign="middle" colspan="2">
                      <input class="btn_login" id="btnLogin" type="button" onclick="Submitlog();" value="管理员登陆"/> 
                      </td>
                    </tr>
                   </tbody>
                  </table>
                 </td>
                </tr>
              </tbody>
            </table>
          </td>
          <td valign="top" align="right" width="17"  background="/Content/images/right_bg.jpg"><img height="289" src="/Content/images/loginright.jpg" width="17"></td>
        </tr>
        <tr>
          <td class="copyright" valign="top" align="center" background="/Content/images/loginbottom.jpg" colspan="3" height="35">Copyright © 2000-2012 后台登录管理. All rights reserved</td>
        </tr>
      </tbody>
    </table>
   </td>
  </tr>
</tbody>
</table>
</form>
</body>
</html>
