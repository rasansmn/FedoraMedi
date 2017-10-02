<%@ Page Language="VB" MasterPageFile="~/MasterReg.master" AutoEventWireup="false" CodeFile="RegDoctor.aspx.vb" Inherits="RegDoctor" title="Registration | FedoraMedi.com" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <table style="width: 520px">
        <tr>
            <td id="TD1" runat="server" style="width: 105px; height: 18px; background-color: #ffffcc"
                visible="false">
                <asp:Label ID="lblAct" runat="server" Text="Label" Width="192px"></asp:Label></td>
        </tr>
        <tr>
            <td id="TD2" runat="server" style="width: 105px; height: 18px; background-color: #ffcccc"
                visible="false">
                <asp:Label ID="lblError" runat="server" Text="Label" Width="192px"></asp:Label></td>
        </tr>
    </table>
    <table class="text" style="width: 520px">
        <tr>
            <td class="text" style="width: 8720px; height: 16px; background-color: inactiveborder;" align="left">
                <b style="background-color: inactiveborder">Doctor Registration</b></td>
        </tr>
    </table>
    <br />
    

    <table align="left" class="text">
        <tr>
            <td align="left" style="width: 64px; height: 18px">
                <asp:Label ID="Label14" runat="server" Text="Username:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 18px" valign="middle">
                <asp:TextBox ID="txtUsername" runat="server" Width="232px"></asp:TextBox>
            </td>
            <td align="left" style="width: 1px; height: 18px" valign="middle">
                <asp:Label ID="Label2" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 18px">
                <asp:CustomValidator ID="valUsername" runat="server" ErrorMessage="Enter an username (min 4 ch.)"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 15px">
                <asp:Label ID="Label15" runat="server" Text="Password:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 15px">
                <asp:TextBox ID="txtPw" runat="server" Width="232px" TextMode="Password"></asp:TextBox></td>
            <td align="left" style="width: 1px; height: 15px">
                <asp:Label ID="Label3" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 15px">
                <asp:CustomValidator ID="valPw" runat="server" ErrorMessage="Enter a password (min 4 ch.)"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px">
                <asp:Label ID="Label16" runat="server" Text="Password:"></asp:Label></td>
            <td align="left" style="width: 239px">
                <asp:TextBox ID="txtCpw" runat="server" Width="232px" TextMode="Password"></asp:TextBox></td>
            <td align="left" style="width: 1px">
                <asp:Label ID="Label10" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px">
                <asp:CompareValidator ID="rvalCpw" runat="server" ControlToCompare="txtPw"
                    ControlToValidate="txtCpw" ErrorMessage="Confirm password is not match" SetFocusOnError="True"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 22px">
                <asp:Label ID="Label1" runat="server" Text="Full Name:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 22px">
                <asp:TextBox ID="txtName" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 1px; height: 22px">
                <asp:Label ID="Label17" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 22px">
                <asp:RequiredFieldValidator ID="rvalName" runat="server" ControlToValidate="txtName"
                    ErrorMessage="Enter the full name" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 15px">
                <asp:Label ID="Label4" runat="server" Text="Gender:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 15px">
                <asp:DropDownList ID="ddlGender" runat="server" AutoPostBack="True" Width="232px">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem Value="Female">Female</asp:ListItem>
                </asp:DropDownList></td>
            <td align="left" style="width: 1px; height: 15px">
            </td>
            <td align="left" style="width: 158px; height: 15px">
            </td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 14px">
                <asp:Label ID="Label21" runat="server" Text="Photo:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 14px">
                <asp:FileUpload ID="upldPhoto" runat="server" Width="232px" /></td>
            <td align="left" style="width: 1px; height: 14px">
            </td>
            <td align="left" style="width: 158px; height: 14px">
                <asp:CustomValidator ID="valFile" runat="server" ErrorMessage="Invalid file format"
                    Width="112px"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 15px">
                <asp:Label ID="Label5" runat="server" Text="Age:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 15px">
                <asp:TextBox ID="txtAge" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 1px; height: 15px">
                <asp:Label ID="Label18" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 15px">
                <asp:RequiredFieldValidator ID="rvalAge" runat="server" ControlToValidate="txtAge"
                    ErrorMessage="Enter the age" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 20px">
                <asp:Label ID="Label6" runat="server" Text="Address:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 20px">
                <asp:TextBox ID="txtAddress" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 1px; height: 20px">
                <asp:Label ID="Label22" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 20px">
                <asp:RequiredFieldValidator ID="rvalAddress" runat="server" ControlToValidate="txtAddress"
                    ErrorMessage="Enter the address"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 20px">
                <asp:Label ID="Label19" runat="server" Text="City:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 20px">
                <asp:TextBox ID="txtCity" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 1px; height: 20px">
                <asp:Label ID="Label20" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 20px">
                <asp:RequiredFieldValidator ID="rvalCity" runat="server" ControlToValidate="txtCity"
                    ErrorMessage="Enter the work city" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 20px">
                <asp:Label ID="Label7" runat="server" Text="Phone:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 20px">
                <asp:TextBox ID="txtPhone" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 1px; height: 20px">
            </td>
            <td align="left" style="width: 158px; height: 20px">
            </td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 20px">
                <asp:Label ID="Label8" runat="server" Text="Email:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 20px">
                <asp:TextBox ID="txtEmail" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 1px; height: 20px">
                <asp:Label ID="Label13" runat="server" ForeColor="#C00000" Text="*"></asp:Label></td>
            <td align="left" style="width: 158px; height: 20px">
                <asp:RegularExpressionValidator ID="valEmail" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Enter an valid email address" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 20px">
                <asp:Label ID="Label9" runat="server" Text="Details:"></asp:Label></td>
            <td align="left" style="width: 239px; height: 20px">
                <asp:TextBox ID="txtDetails" runat="server" Width="232px"></asp:TextBox></td>
            <td align="left" style="width: 1px; height: 20px">
            </td>
            <td style="width: 158px; height: 20px">
            </td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 35px">
            </td>
            <td align="right" style="width: 239px; height: 35px">
                <asp:Button ID="btnRegister" runat="server" Text="Register" /></td>
            <td style="width: 1px; height: 35px">
            </td>
            <td style="width: 158px; height: 35px">
            </td>
        </tr>
        <tr>
            <td align="left" style="width: 64px; height: 15px">
            </td>
            <td align="right" style="width: 239px; height: 15px" valign="middle">
                <asp:Label ID="Label11" runat="server" ForeColor="#C00000" Text="*"></asp:Label>
                <asp:Label ID="Label12" runat="server" Text="= Required Fields"></asp:Label></td>
            <td style="width: 1px; height: 15px">
            </td>
            <td style="width: 158px; height: 15px">
            </td>
        </tr>
    </table>
</asp:Content>

