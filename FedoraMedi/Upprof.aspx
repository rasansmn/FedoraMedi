<%@ Page Language="VB" MasterPageFile="~/MasterUpprof.master" AutoEventWireup="false" CodeFile="Upprof.aspx.vb" Inherits="Upprof" title="Update Profile | FedoraMedi.com" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 752px">
        <tr>
            <td id="TD1" runat="server" style="width: 105px; background-color: #ffffcc" valign="middle"
                visible="false">
                &nbsp; &nbsp; &nbsp;&nbsp;<asp:Image ID="Image1" runat="server" Height="16px" ImageUrl="~/images/ok.gif"
                    Width="16px" />&nbsp;
                <asp:Label ID="lblAct" runat="server" Text="Label" Width="464px"></asp:Label></td>
        </tr>
        <tr>
            <td id="TD2" runat="server" style="width: 105px; background-color: #ffcccc" visible="false">
                &nbsp; &nbsp;&nbsp;<asp:Image ID="Image2" runat="server" Height="16px" ImageUrl="~/images/notok.gif"
                    Width="16px" />&nbsp;
                <asp:Label ID="lblError" runat="server" Text="Label" Width="464px"></asp:Label></td>
        </tr>
    </table>
    <table style="width: 752px">
        <tr>
            <td style="width: 100px; height: 15px; background-color: inactiveborder">
                <strong>Update Profile</strong></td>
        </tr>
    </table>
    
   <br />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table align="left" class="text">
        <tr>
            <td align="left" style="width: 64px; height: 18px">
                <asp:Label ID="Label14" runat="server" Text="Username:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 18px" valign="middle">
                <asp:TextBox ID="txtUsernamem" runat="server" Width="232px"></asp:TextBox>
            </td>
            <td align="left" style="width: 8px; height: 18px" valign="middle">
                <asp:Label ID="Label2" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 18px">
                <asp:CustomValidator ID="valUsernamem" runat="server" ErrorMessage="Enter an username (min 4 ch.)"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 22px">
                <asp:Label ID="Label1" runat="server" Text="Full Name:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 22px">
                <asp:TextBox ID="txtNamem" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 22px">
                <asp:Label ID="Label17" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 22px">
                <asp:CustomValidator ID="valNamem" runat="server" ErrorMessage="Enter the name"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 15px">
                <asp:Label ID="Label4" runat="server" Text="Gender:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 15px">
                <asp:DropDownList ID="ddlGenderm" runat="server" AutoPostBack="True" Width="232px">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem Value="Female">Female</asp:ListItem>
                </asp:DropDownList></td>
            <td align="left" style="width: 8px; height: 15px">
            </td>
            <td align="left" style="width: 158px; height: 15px">
            </td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 15px">
                Photo:</td>
            <td align="left" style="width: 239px; height: 15px">
                <asp:FileUpload ID="upldPhotom" runat="server" Width="232px" /></td>
            <td align="left" style="width: 8px; height: 15px">
            </td>
            <td align="left" style="width: 158px; height: 15px">
                <asp:CustomValidator ID="valFilem" runat="server" ErrorMessage="Invalid file format"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 15px">
                <asp:Label ID="Label5" runat="server" Text="Age:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 15px">
                <asp:TextBox ID="txtAgem" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 15px">
                <asp:Label ID="Label18" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 15px">
                <asp:CustomValidator ID="valAgem" runat="server" ErrorMessage="Enter the age"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 20px">
                <asp:Label ID="Label6" runat="server" Text="Address:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 20px">
                <asp:TextBox ID="txtAddressm" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 20px">
            </td>
            <td align="left" style="width: 158px; height: 20px">
                <asp:CustomValidator ID="valAddressm" runat="server" ErrorMessage="Enter the address"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 20px">
                City:</td>
            <td align="left" style="width: 239px; height: 20px">
                <asp:TextBox ID="txtCitym" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 20px">
            </td>
            <td align="left" style="width: 158px; height: 20px">
            </td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 20px">
                <asp:Label ID="Label7" runat="server" Text="Phone:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 20px">
                <asp:TextBox ID="txtPhonem" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 20px">
            </td>
            <td align="left" style="width: 158px; height: 20px">
            </td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 20px">
                <asp:Label ID="Label8" runat="server" Text="Email:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 20px">
                <asp:TextBox ID="txtEmailm" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 20px">
                <asp:Label ID="Label13" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 20px">
                <asp:CustomValidator ID="valEmailm" runat="server" ErrorMessage="Enter the email address"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 20px">
                <asp:Label ID="Label9" runat="server" Text="Details:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 20px">
                <asp:TextBox ID="txtDetailsm" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 20px">
            </td>
            <td style="width: 158px; height: 20px">
            </td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 33px">
            </td>
            <td align="right" style="width: 239px; height: 33px">
                <asp:Button ID="btnUpdatem" runat="server" Text="Update" /></td>
            <td style="width: 8px; height: 33px">
            </td>
            <td style="width: 158px; height: 33px">
            </td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 15px">
            </td>
            <td align="right" style="width: 239px; height: 15px" valign="middle">
                <asp:Label ID="Label11" runat="server" ForeColor="#C00000" Text="*"></asp:Label>
                <asp:Label ID="Label12" runat="server" Text="= Required Fields"></asp:Label></td>
            <td style="width: 8px; height: 15px">
            </td>
            <td style="width: 158px; height: 15px">
            </td>
        </tr>
    </table>
      <br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <table align="left" class="text">
        <tr>
            <td align="left" style="width: 64px; height: 18px">
                <asp:Label ID="Label3" runat="server" Text="Username:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 18px" valign="middle">
                <asp:TextBox ID="txtUsernamed" runat="server" Width="232px"></asp:TextBox>
            </td>
            <td align="left" style="width: 8px; height: 18px" valign="middle">
                <asp:Label ID="Label10" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 18px">
                <asp:CustomValidator ID="valUsernamed" runat="server" ErrorMessage="Enter an username (min 4 ch.)"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 22px">
                <asp:Label ID="Label19" runat="server" Text="Full Name:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 22px">
                <asp:TextBox ID="txtNamed" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 22px">
                <asp:Label ID="Label20" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 22px">
                <asp:CustomValidator ID="valNamed" runat="server" ErrorMessage="Enter the name"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 15px">
                <asp:Label ID="Label21" runat="server" Text="Gender:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 15px">
                <asp:DropDownList ID="ddlGenderd" runat="server" AutoPostBack="True" Width="232px">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem Value="Female">Female</asp:ListItem>
                </asp:DropDownList></td>
            <td align="left" style="width: 8px; height: 15px">
            </td>
            <td align="left" style="width: 158px; height: 15px">
            </td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 14px">
                <asp:Label ID="Label22" runat="server" Text="Photo:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 14px">
                <asp:FileUpload ID="upldphotod" runat="server" Width="232px" /></td>
            <td align="left" style="width: 8px; height: 14px">
            </td>
            <td align="left" style="width: 158px; height: 14px">
                <asp:CustomValidator ID="valFiled" runat="server" ErrorMessage="Invalid file format"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 15px">
                <asp:Label ID="Label23" runat="server" Text="Age:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 15px">
                <asp:TextBox ID="txtAged" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 15px">
                <asp:Label ID="Label24" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 15px">
                <asp:CustomValidator ID="valAged" runat="server" ErrorMessage="Enter the age"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 20px">
                <asp:Label ID="Label25" runat="server" Text="Address:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 20px">
                <asp:TextBox ID="txtAddressd" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 20px">
            </td>
            <td align="left" style="width: 158px; height: 20px">
                <asp:CustomValidator ID="valAddressd" runat="server" ErrorMessage="Enter the address"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 20px">
                <asp:Label ID="Label26" runat="server" Text="City:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 20px">
                <asp:TextBox ID="txtCityd" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 20px">
                <asp:Label ID="Label27" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 20px">
                <asp:CustomValidator ID="valCityd" runat="server" ErrorMessage="CustomValidator"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 20px">
                <asp:Label ID="Label28" runat="server" Text="Phone:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 20px">
                <asp:TextBox ID="txtPhoned" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 20px">
            </td>
            <td align="left" style="width: 158px; height: 20px">
            </td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 20px">
                <asp:Label ID="Label29" runat="server" Text="Email:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 20px">
                <asp:TextBox ID="txtEmaild" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 20px">
                <asp:Label ID="Label30" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 20px">
                <asp:CustomValidator ID="valEmaild" runat="server" ErrorMessage="Enter the email address"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 20px">
                <asp:Label ID="Label31" runat="server" Text="Details:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 20px">
                <asp:TextBox ID="txtDetailsd" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 20px">
            </td>
            <td style="width: 158px; height: 20px">
            </td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 35px">
            </td>
            <td align="right" style="width: 239px; height: 35px">
                <asp:Button ID="btnUpdated" runat="server" Text="Update" /></td>
            <td style="width: 8px; height: 35px">
            </td>
            <td style="width: 158px; height: 35px">
            </td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 15px">
            </td>
            <td align="right" style="width: 239px; height: 15px" valign="middle">
                <asp:Label ID="Label32" runat="server" ForeColor="#C00000" Text="*"></asp:Label>
                <asp:Label ID="Label33" runat="server" Text="= Required Fields"></asp:Label></td>
            <td style="width: 8px; height: 15px">
            </td>
            <td style="width: 158px; height: 15px">
            </td>
        </tr>
    </table>
      <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" Runat="Server">
    <table align="left" class="text">
        <tr>
            <td align="left" style="width: 64px; height: 18px">
                <asp:Label ID="Label15" runat="server" Text="Username:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 18px" valign="middle">
                <asp:TextBox ID="txtUsernameh" runat="server" Width="232px"></asp:TextBox>
            </td>
            <td align="left" style="width: 8px; height: 18px" valign="middle">
                <asp:Label ID="Label16" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 18px">
                <asp:CustomValidator ID="valUsernameh" runat="server" ErrorMessage="Enter an username (min 4 ch.)"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 22px">
                <asp:Label ID="Label38" runat="server" Text="Name:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 22px">
                <asp:TextBox ID="txtNameh" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 22px">
                <asp:Label ID="Label39" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 22px">
                <asp:CustomValidator ID="valNameh" runat="server" ErrorMessage="Enter the name"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 15px">
                <asp:Label ID="Label40" runat="server" Text="Logo:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 15px">
                <asp:FileUpload ID="upldPhotoh" runat="server" Width="232px" /></td>
            <td align="left" style="width: 8px; height: 15px">
            </td>
            <td align="left" style="width: 158px; height: 15px">
                <asp:CustomValidator ID="valFileh" runat="server" ErrorMessage="Invalid file format"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 20px">
                <asp:Label ID="Label41" runat="server" Text="Address:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 20px">
                <asp:TextBox ID="txtAddressh" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 20px">
            </td>
            <td align="left" style="width: 158px; height: 20px">
                <asp:CustomValidator ID="valAddressh" runat="server" ErrorMessage="Enter the address"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 20px">
                <asp:Label ID="Label42" runat="server" Text="City:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 20px">
                <asp:TextBox ID="txtCityh" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 20px">
                <asp:Label ID="Label43" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 20px">
                <asp:CustomValidator ID="valCityh" runat="server" ErrorMessage="CustomValidator"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 20px">
                <asp:Label ID="Label44" runat="server" Text="Phone:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 20px">
                <asp:TextBox ID="txtPhoneh" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 20px">
            </td>
            <td align="left" style="width: 158px; height: 20px">
            </td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 20px">
                <asp:Label ID="Label45" runat="server" Text="Email:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 20px">
                <asp:TextBox ID="txtEmailh" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 20px">
                <asp:Label ID="Label46" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 20px">
                <asp:CustomValidator ID="valEmailh" runat="server" ErrorMessage="Enter the email address"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 20px">
                <asp:Label ID="Label47" runat="server" Text="Details:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 20px">
                <asp:TextBox ID="txtDetailsh" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 20px">
            </td>
            <td style="width: 158px; height: 20px">
            </td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 35px">
            </td>
            <td align="right" style="width: 239px; height: 35px">
                <asp:Button ID="btnUpdateh" runat="server" Text="Update" /></td>
            <td style="width: 8px; height: 35px">
            </td>
            <td style="width: 158px; height: 35px">
            </td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 15px">
            </td>
            <td align="right" style="width: 239px; height: 15px" valign="middle">
                <asp:Label ID="Label48" runat="server" ForeColor="#C00000" Text="*"></asp:Label>
                <asp:Label ID="Label49" runat="server" Text="= Required Fields"></asp:Label></td>
            <td style="width: 8px; height: 15px">
            </td>
            <td style="width: 158px; height: 15px">
            </td>
        </tr>
    </table>
      <br />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" Runat="Server">
    <table id="TABLE1" align="left" class="text" onclick="return TABLE1_onclick()">
        <tr>
            <td align="left" style="width: 64px; height: 18px">
                <asp:Label ID="Label34" runat="server" Text="Username:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 18px" valign="middle">
                <asp:TextBox ID="txtUsernamedn" runat="server" Width="232px"></asp:TextBox>
            </td>
            <td align="left" style="width: 8px; height: 18px" valign="middle">
                <asp:Label ID="Label35" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 18px">
                <asp:CustomValidator ID="valUsernamedn" runat="server" ErrorMessage="Enter an username (min 4 ch.)"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 22px">
                <asp:Label ID="Label52" runat="server" Text="Full Name:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 22px">
                <asp:TextBox ID="txtNamedn" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 22px">
                <asp:Label ID="Label53" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 22px">
                <asp:CustomValidator ID="valNamedn" runat="server" ErrorMessage="Enter the name"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 15px">
                <asp:Label ID="Label54" runat="server" Text="Gender:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 15px">
                <asp:DropDownList ID="ddlGenderdn" runat="server" AutoPostBack="True" Width="232px">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem Value="Female">Female</asp:ListItem>
                </asp:DropDownList></td>
            <td align="left" style="width: 8px; height: 15px">
            </td>
            <td align="left" style="width: 158px; height: 15px">
            </td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 15px">
                Photo:</td>
            <td align="left" style="width: 239px; height: 15px">
                <asp:FileUpload ID="upldPhotodn" runat="server" Width="232px" /></td>
            <td align="left" style="width: 8px; height: 15px">
            </td>
            <td align="left" style="width: 158px; height: 15px">
                <asp:CustomValidator ID="valFiledn" runat="server" ErrorMessage="Invalid file format"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 15px">
                <asp:Label ID="Label55" runat="server" Text="Age:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 15px">
                <asp:TextBox ID="txtAgedn" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 15px">
                <asp:Label ID="Label56" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 15px">
                <asp:CustomValidator ID="valAgedn" runat="server" ErrorMessage="Enter the age"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 10px" valign="top">
                <asp:Label ID="Label57" runat="server" Text="Donation:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 10px">
                <asp:RadioButtonList ID="rblDonation" runat="server" RepeatColumns="2">
                    <asp:ListItem>Blood</asp:ListItem>
                    <asp:ListItem>Eye</asp:ListItem>
                    <asp:ListItem>Kidney</asp:ListItem>
                    <asp:ListItem>Heart</asp:ListItem>
                </asp:RadioButtonList></td>
            <td align="left" style="width: 8px; height: 10px">
            </td>
            <td align="left" style="width: 158px; height: 10px">
                <asp:RequiredFieldValidator ID="rvalDonation" runat="server" ErrorMessage="Select a donation"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 20px">
                <asp:Label ID="Label58" runat="server" Text="Blood Group:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 20px">
                <asp:TextBox ID="txtBgroup" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 20px">
            </td>
            <td align="left" style="width: 158px; height: 20px">
            </td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 20px">
                <asp:Label ID="Label59" runat="server" Text="Address:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 20px">
                <asp:TextBox ID="txtAddressdn" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 20px">
            </td>
            <td align="left" style="width: 158px; height: 20px">
                <asp:CustomValidator ID="valAddressdn" runat="server" ErrorMessage="Enter the address"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 20px">
                <asp:Label ID="Label60" runat="server" Text="Phone:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 20px">
                <asp:TextBox ID="txtPhonedn" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 20px">
            </td>
            <td align="left" style="width: 158px; height: 20px">
            </td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 20px">
                <asp:Label ID="Label61" runat="server" Text="Email:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 20px">
                <asp:TextBox ID="txtEmaildn" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 20px">
                <asp:Label ID="Label62" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 20px">
                <asp:CustomValidator ID="valEmaildn" runat="server" ErrorMessage="Enter the email address"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 20px">
                <asp:Label ID="Label63" runat="server" Text="Details:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 20px">
                <asp:TextBox ID="txtDetailsdn" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 20px">
            </td>
            <td style="width: 158px; height: 20px">
            </td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 35px">
            </td>
            <td align="right" style="width: 239px; height: 35px">
                <asp:Button ID="btnUpdatedn" runat="server" Text="Update" /></td>
            <td style="width: 8px; height: 35px">
            </td>
            <td style="width: 158px; height: 35px">
            </td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 15px">
            </td>
            <td align="right" style="width: 239px; height: 15px" valign="middle">
                <asp:Label ID="Label65" runat="server" ForeColor="#C00000" Text="*"></asp:Label>
                <asp:Label ID="Label66" runat="server" Text="= Required Fields"></asp:Label></td>
            <td style="width: 8px; height: 15px">
            </td>
            <td style="width: 158px; height: 15px">
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder6">
<table style="width: 752px">
    <tr>
        <td style="width: 100px; height: 15px; background-color: inactiveborder">
            <strong>Change Password</strong></td>
    </tr>
    </table>
    <br />
    <table id="Table2" align="left" class="text" onclick="return TABLE1_onclick()">
        <tr>
            <td align="left" style="width: 93px; height: 18px">
                <asp:Label ID="Label36" runat="server" Text="Password:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 18px" valign="middle">
                <asp:TextBox ID="txtPw" runat="server" Width="232px" ValidationGroup="p" TextMode="Password"></asp:TextBox>
            </td>
            <td align="left" style="width: 8px; height: 18px" valign="middle">
                <asp:Label ID="Label37" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 18px">
                <asp:CustomValidator ID="valPw" runat="server" ErrorMessage="Enter current password"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 93px; height: 15px">
                <asp:Label ID="Label50" runat="server" Text="New Password:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 15px">
                <asp:TextBox ID="txtNpw" runat="server" Width="232px" ValidationGroup="p" TextMode="Password"></asp:TextBox></td>
            <td align="left" style="width: 8px; height: 15px">
                <asp:Label ID="Label51" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 15px">
                <asp:CustomValidator ID="valNpw" runat="server" ErrorMessage="Enter new password (min 4.ch)"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 93px">
                <asp:Label ID="Label64" runat="server" Text="Retype Password:"></asp:Label></td>
            <td align="left" style="width: 239px">
                <asp:TextBox ID="txtCpw" runat="server" Width="232px" ValidationGroup="p" TextMode="Password"></asp:TextBox></td>
            <td align="left" style="width: 8px">
                <asp:Label ID="Label67" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px">
                <asp:CompareValidator ID="valcpw" runat="server" ControlToCompare="txtNpw" ControlToValidate="txtCpw"
                    ErrorMessage="Confirm password is not match"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 93px; height: 35px">
            </td>
            <td align="right" style="width: 239px; height: 35px">
                <asp:Button ID="btnUppw" runat="server" Text="Update" ValidationGroup="p" /></td>
            <td style="width: 8px; height: 35px">
            </td>
            <td style="width: 158px; height: 35px">
            </td>
        </tr>
        <tr>
            <td align="left" style="width: 93px; height: 15px">
            </td>
            <td align="right" style="width: 239px; height: 15px" valign="middle">
                <asp:Label ID="Label81" runat="server" ForeColor="#C00000" Text="*"></asp:Label>
                <asp:Label ID="Label82" runat="server" Text="= Required Fields"></asp:Label></td>
            <td style="width: 8px; height: 15px">
            </td>
            <td style="width: 158px; height: 15px">
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content7" runat="server" ContentPlaceHolderID="ContentPlaceHolder7">
    <table style="width: 752px">
        <tr>
            <td style="width: 100px; height: 15px; background-color: inactiveborder">
                <strong>Change Password</strong></td>
        </tr>
    </table>
    <table id="Table3" align="left" class="text" onclick="return TABLE1_onclick()">
        <tr>
            <td align="left" style="width: 93px; height: 18px">
                <asp:Label ID="Label68" runat="server" Text="Password:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 18px" valign="middle">
                <asp:TextBox ID="txtAdminpw" runat="server" TextMode="Password" ValidationGroup="p"
                    Width="232px"></asp:TextBox>
            </td>
            <td align="left" style="width: 8px; height: 18px" valign="middle">
                <asp:Label ID="Label69" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 18px">
                <asp:CustomValidator ID="cvalPw" runat="server" ErrorMessage="Enter new password (min 4.ch)"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 93px; height: 35px">
            </td>
            <td align="right" style="width: 239px; height: 35px">
                <asp:Button ID="btnPwadmin" runat="server" Text="Update" ValidationGroup="p" /></td>
            <td style="width: 8px; height: 35px">
            </td>
            <td style="width: 158px; height: 35px">
            </td>
        </tr>
        <tr>
            <td align="left" style="width: 93px; height: 15px">
            </td>
            <td align="right" style="width: 239px; height: 15px" valign="middle">
                <asp:Label ID="Label74" runat="server" ForeColor="#C00000" Text="*"></asp:Label>
                <asp:Label ID="Label75" runat="server" Text="= Required Fields"></asp:Label></td>
            <td style="width: 8px; height: 15px">
            </td>
            <td style="width: 158px; height: 15px">
            </td>
        </tr>
    </table>
</asp:Content>

