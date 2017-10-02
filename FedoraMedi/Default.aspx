<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Welcome | FedoraMedi.com</title>
    <link href="style/style.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#CCCCCC">
    <form id="form1" runat="server">
 
        <table align="center" style="width: 780px; height: 48px" cellspacing="0">
            <tr>
                <td class="logo" colspan="2" style="height: 64px; background-image: url(images/img1.gif);" align="right">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">FedoraMedi.com</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td align="center" class="anavi" colspan="2" style="height: 33px; background-image: url(images/img2.gif); border-top-width: 1px; border-bottom-width: 1px; border-bottom-color: #c8c8c8; border-top-color: #c8c8c8; border-right-style: none; border-left-style: none;">
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Default.aspx">Home</asp:HyperLink>
                    |
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Register.aspx">Register</asp:HyperLink>
                    |
                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Doctors.aspx">Doctors</asp:HyperLink>&nbsp;|
                    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Hospitals.aspx">Hospitals</asp:HyperLink>
                    |
                    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Clinics.aspx">Clinics</asp:HyperLink>
                    |
                    <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/Donators.aspx">Donators</asp:HyperLink>
                    |
                    <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/Aboutus.aspx">About Us</asp:HyperLink></td>
            </tr>
            <tr>
                <td align="center" class="setpadding" style="border-top-width: 1px; border-bottom-width: 1px;
                    border-bottom-color: #c8c8c8; width: 600071px; border-top-color: #c8c8c8;"
                    valign="top" rowspan="3">
                    <table style="width: 520px">
                             <tr>
                                 <td id="TD1" runat="server" style="width: 105px; background-color: #ffffcc"
                                     visible="false">
                                     <asp:Image ID="Image2" runat="server" Height="16px" ImageUrl="~/images/ok.gif" Width="16px" />
                                     <asp:Label ID="lblAct" runat="server" Text="Message" Width="192px"></asp:Label></td>
                             </tr>
                         </table>
                     <p class ="title">
                         
        Looking for a medical service?</p>
        <p>
            <asp:Image ID="Image1" runat="server" Height="184px" Width="240px" ImageUrl="~/images/logo.jpg" />&nbsp;</p>
        <p class ="text">
            Check out our 
            <asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="~/Doctors.aspx" Font-Bold="False">Doctors</asp:HyperLink>,
            <asp:HyperLink ID="HyperLink16" runat="server" NavigateUrl="~/Hospitals.aspx" Font-Bold="False">Hospitals</asp:HyperLink>,
            <asp:HyperLink ID="HyperLink17" runat="server" NavigateUrl="~/Clinics.aspx" Font-Bold="False">Clinics</asp:HyperLink>
            and
            <asp:HyperLink ID="HyperLink18" runat="server" NavigateUrl="~/Donators.aspx" Font-Bold="False">Donators</asp:HyperLink><br /><br />
            We may have just what you are looking for!</p>
                </td>
                <td align="left" class="setpadding" style="border-top-width: 1px; border-left: #c8c8c8 1px solid; width: 800px; border-top-color: #c8c8c8; height: 122px; border-bottom: #c8c8c8 1px solid;" valign="top">
                    <p class ="text"><b>Are you a member?</b></p>
                    <table style="width: 184px; height: 112px" class ="text">
                        <tr>
                            <td style="width: 109px">
                                Username:</td>
                            <td style="width: 73px">
                                <asp:TextBox ID="txtUsername" runat="server" Width="112px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 109px; height: 7px">
                                Password:</td>
                            <td style="width: 73px; height: 7px">
                                <asp:TextBox ID="txtPw" runat="server" TextMode="Password" Width="112px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2" style="height: 15px">
                                <asp:CheckBox ID="chkRemember" runat="server" Font-Size="Smaller" Height="16px" Text="Remember me" AutoPostBack="True" BorderStyle="None" />
                                &nbsp; &nbsp; &nbsp;
                                <asp:Button ID="btnLogin" runat="server" Text="Enter" /></td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2" style="height: 16px">
                                <asp:Label ID="lblLogin" runat="server" ForeColor="#C00000" Width="152px" BackColor="LightPink"></asp:Label></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="left" class="setpadding" style="border-top-width: 1px; border-left: #c8c8c8 1px solid; width: 800px; border-top-color: #c8c8c8;
                    height: 44px; border-bottom: #c8c8c8 1px solid;" valign="top">
                    <b>Not yet a memeber?</b><br /><br />
                    <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/RegMember.aspx">Register free</asp:HyperLink>
              for get our free 
                    <br />
                    sevices.
                    </td>
            </tr>
            <tr>
                <td align="left" class="setpadding" style="border-top-width: 1px; border-bottom-width: 1px;
                    border-bottom-color: #c8c8c8; border-left: #c8c8c8 1px solid; width: 800px; border-top-color: #c8c8c8;
                    height: 155px;" valign="top">
                     <strong>Service provider?<br />
            </strong>
            <br />
            Free
                  Registration for
              <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/RegDoctor.aspx">Doctors</asp:HyperLink>,
            &nbsp;<br />
            <asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="~/RegHospital.aspx">Hospitals</asp:HyperLink>
            and
            <asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="~/RegDonator.aspx">Donators</asp:HyperLink>.
                </td>
            </tr>
            <tr>
                <td align="center" class="text1" colspan="2" style="border-top: #c8c8c8 1px solid; height: 26px; background-color: #53b4e7;"
                    valign="middle">
                     Copyright 2011:
            <asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="#">FedoraMedi</asp:HyperLink>
            | Powered By:
            <asp:HyperLink ID="HyperLink15" runat="server" NavigateUrl="http://wegaspace.com">Rasan Samarasinghe</asp:HyperLink>
                </td>
            </tr>
        </table>
    
  
    </form>
</body>
</html>
