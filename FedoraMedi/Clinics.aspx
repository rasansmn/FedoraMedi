<%@ Page Language="VB" MasterPageFile="~/MasterClinics.master" AutoEventWireup="false" CodeFile="Clinics.aspx.vb" Inherits="Clinics" title="Clinics | FedoraMedi.com" EnableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 752px" cellspacing="0">
        <tr>
            <td id="TD1" runat="server" style="background-color: #ffffcc"
                visible="false" valign="middle" colspan="2">
                &nbsp; &nbsp; &nbsp;&nbsp;<asp:Image ID="Image1" runat="server" Height="16px" ImageUrl="~/images/ok.gif"
                    Width="16px" />&nbsp;
                <asp:Label ID="lblAct" runat="server" Text="Label" Width="464px"></asp:Label></td>
        </tr>
        <tr>
            <td id="TD2" runat="server" style="background-color: #ffcccc"
                visible="false" colspan="2">
                &nbsp; &nbsp;&nbsp;<asp:Image ID="Image2" runat="server" Height="16px" ImageUrl="~/images/notok.gif"
                    Width="16px" />&nbsp;
                <asp:Label ID="lblError" runat="server" Text="Label" Width="464px"></asp:Label></td>
        </tr>
        <tr>
            <td id="TD3" runat="server" style="width: 173px; height: 15px; background-color: inactiveborder;" visible="false" valign="middle" align="left">
                &nbsp; &nbsp;<asp:Image ID="Image3" runat="server" Height="48px" ImageUrl="~/images/pay.jpg"
                    Width="160px" />
                &nbsp; &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="txtCrdt" ErrorMessage="Invalid credit card number" ValidationGroup="p"></asp:RequiredFieldValidator></td>
            <td id="TD4" runat="server" align="right" class="text" style="width: 173px; height: 15px;
                background-color: inactiveborder" valign="middle" visible="false">
                <asp:DropDownList ID="ddlMethod" runat="server">
                    <asp:ListItem>Visa</asp:ListItem>
                    <asp:ListItem>Master Card</asp:ListItem>
                    <asp:ListItem>American Experess</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="txtCrdt" runat="server" ValidationGroup="p"></asp:TextBox>
                <asp:Button ID="btnPay" runat="server" Text="Make Payment" ValidationGroup="p" /></td>
        </tr>
    </table>
<table style="width: 752px" class="text">
        <tr>
            <td class="title" style="width: 2915px; height: 24px;">
                Clinics
                <asp:Label ID="lblRef" runat="server" Width="336px"></asp:Label></td>
            <td style="width: 459px; height: 24px;">
                Look In:</td>
            <td style="width: 183px; height: 24px;">
                <asp:DropDownList ID="ddllookin" runat="server">
                    <asp:ListItem>name</asp:ListItem>
                    <asp:ListItem>location</asp:ListItem>
                    <asp:ListItem>time</asp:ListItem>
                    <asp:ListItem>details</asp:ListItem>
                </asp:DropDownList></td>
            <td style="width: 130px; height: 24px;">
                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox></td>
            <td style="width: 100px; height: 24px;">
                <asp:Button ID="btnSearch" runat="server" Text="Search" /></td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<table id="tblRp1" runat="server" style="width: 752px" visible="false">
        <tr>
            <td style="width: 718px; height: 23px; background-color: #ffffcc;">
                No records found on this criteria.</td>
        </tr>
    </table>
    <table style="width: 752px; border-bottom-width: 1px; border-bottom-color: menu; height: 112px;" class="text">
<asp:Repeater ID="Repeater1" runat="server">
     <ItemTemplate>
        <tr>
            <td rowspan="1" style="border-bottom-width: 1px; border-bottom-color: scrollbar;
                width: 95px; height: 15px">
            </td>
            <td style="width: 137px">
            </td>
            <td style="width: 286px">
            </td>
            <td style="width: 73px">
            </td>
            <td style="width: 70px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td rowspan="4" style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                <asp:Image ID="Image11" runat="server" Height="80px" Width="88px" ImageUrl="images/clinic.jpg" /></td>
            <td style="width: 137px">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Text='<%#DataBinder.Eval(Container.DataItem, "name")%>'></asp:Label></td>
            <td style="width: 286px">
            </td>
            <td style="width: 73px" rowspan="4">
                <asp:Button ID="Button3" runat="server" Text="Hospital" Enabled ='<%#getenable(DataBinder.Eval(Container.DataItem, "created"))%>' PostBackUrl='<%#"~/Hospitals.aspx?clid="&DataBinder.Eval(Container.DataItem, "id")%>' /></td>
            <td style="width: 70px" rowspan="4">
                <asp:Button ID="Button1" runat="server" Text="Doctors" Enabled ='<%#endoctors(DataBinder.Eval(Container.DataItem, "id"))%>' PostBackUrl ='<%#"~/Doctors.aspx?clid="&DataBinder.Eval(Container.DataItem, "id")%>' />&nbsp;
            </td>
            <td style="width: 100px" rowspan="4">
                <asp:Button ID="Button2" runat="server" Text='<%#getcaption(DataBinder.Eval(Container.DataItem, "id"))%>' Width="136px" PostBackUrl='<%#geturl(DataBinder.Eval(Container.DataItem, "id"))%>' /></td>
        </tr>
        <tr>
            <td style="width: 137px">
                Location:
                <asp:Label ID="Label2" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "location")%>'></asp:Label></td>
            <td style="width: 286px">
                Status:
                <asp:Label ID="Label13" runat="server" Text='<%#getstatus(DataBinder.Eval(Container.DataItem, "id"))%>'></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 137px; height: 15px">
                Time:
                <asp:Label ID="Label3" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "time")%>'></asp:Label></td>
            <td style="width: 286px; height: 15px">
                Appointment Charge:
                <asp:Label ID="Label14" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "charge")%>'></asp:Label></td>
        </tr>
        <tr>
            <td style="height: 17px" colspan="2">
                Details:
                <asp:Label ID="Label5" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "details") %>' Width="256px"></asp:Label></td>
        </tr>
        <tr>
            <td rowspan="1" style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 137px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 73px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 70px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 100px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
        </tr>
    </ItemTemplate>
         </asp:Repeater>
    </table>
    <table id="tblNavi" runat="server" class="text">
        <tr>
            <td align="left" colspan="2" style="height: 17px">
                Page
                <asp:Label ID="lblPagen" runat="server" Text="1"></asp:Label>
                of
                <asp:Label ID="lblNumpages" runat="server" Text="1"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 43px; height: 26px">
                <asp:Button ID="btnPrev" runat="server" Text="Prev" Width="40px" Enabled="False" /></td>
            <td align="right" style="width: 37px; height: 26px">
                <asp:Button ID="btnNext" runat="server" Text="Next" Enabled="False" /></td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
<table id="tblRp2" runat="server" style="width: 752px" visible="false">
        <tr>
            <td style="width: 718px; height: 23px; background-color: #ffffcc;">
                No records found on this criteria.</td>
        </tr>
    </table>
    <table style="width: 752px; border-bottom-width: 1px; border-bottom-color: menu; height: 112px;" class="text">
<asp:Repeater ID="Repeater2" runat="server">
<ItemTemplate >
        <tr>
            <td rowspan="1" style="border-bottom-width: 1px; border-bottom-color: scrollbar;
                width: 95px; height: 15px">
            </td>
            <td style="width: 137px">
            </td>
            <td style="width: 294px">
            </td>
            <td style="width: 77px">
            </td>
            <td style="width: 70px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td rowspan="4" style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                <asp:Image ID="Image22" runat="server" Height="80px" Width="88px" ImageUrl="images/clinic.jpg" /></td>
            <td style="width: 137px">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%#DataBinder.Eval(Container.DataItem, "name")%>'></asp:Label></td>
            <td style="width: 294px">
            </td>
            <td style="width: 77px" rowspan="4">
                <asp:Button ID="Button33" runat="server" Text="Hospital" Enabled ='<%#getenable(DataBinder.Eval(Container.DataItem, "created"))%>' PostBackUrl='<%#"~/Hospitals.aspx?clid="&DataBinder.Eval(Container.DataItem, "id")%>' /></td>
            <td style="width: 70px" rowspan="4">
                <asp:Button ID="Button22" runat="server" Text="Doctors" Enabled ='<%#endoctors(DataBinder.Eval(Container.DataItem, "id"))%>' PostBackUrl='<%#"~/Doctors.aspx?clid="&DataBinder.Eval(Container.DataItem, "id")%>' />&nbsp;
            </td>
            <td style="width: 100px" rowspan="4">
                <asp:Button ID="Button11" runat="server" Text='<%#getactcap(DataBinder.Eval(Container.DataItem, "id"),DataBinder.Eval(Container.DataItem, "crid"))%>' Width="136px" PostBackUrl='<%#getact(DataBinder.Eval(Container.DataItem, "id"),DataBinder.Eval(Container.DataItem, "crid"))%>' /></td>
        </tr>
        <tr>
            <td style="width: 137px; height: 15px;">
                Location:
                <asp:Label ID="Label7" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "location")%>'></asp:Label></td>
            <td style="width: 294px; height: 15px;">
                Status:
                <asp:Label ID="Label15" runat="server" Text='<%#getstatus(DataBinder.Eval(Container.DataItem, "id"))%>'></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 137px; height: 15px">
                Time:
                <asp:Label ID="Label8" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "time")%>'></asp:Label></td>
            <td style="width: 294px; height: 15px">
                Appointment Charge:
                <asp:Label ID="Label16" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "charge")%>'></asp:Label></td>
        </tr>
        <tr>
            <td style="height: 17px" colspan="2">
                Details:
                <asp:Label ID="Label10" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "details") %>' Width="256px"></asp:Label></td>
        </tr>
        <tr>
            <td rowspan="1" style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 137px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 294px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 77px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 70px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 100px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
        </tr>
        </ItemTemplate>
     </asp:Repeater>
    </table>
     <table id="tblNavi2" runat="server" class="text">
        <tr>
            <td align="left" colspan="2" style="height: 17px">
                Page
                <asp:Label ID="lblPagen2" runat="server" Text="1"></asp:Label>
                of
                <asp:Label ID="lblNumpages2" runat="server" Text="1"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 43px; height: 26px">
                <asp:Button ID="btnPrev2" runat="server" Text="Prev" Width="40px" Enabled="False" /></td>
            <td align="right" style="width: 37px; height: 26px">
                <asp:Button ID="btnNext2" runat="server" Text="Next" Enabled="False" /></td>
        </tr>
    </table>
   
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder4">
<table id="tblRp3" runat="server" style="width: 752px" visible="false">
        <tr>
            <td style="width: 718px; height: 23px; background-color: #ffffcc;">
                No records found on this criteria.</td>
        </tr>
    </table>
<table style="width: 752px; border-bottom-width: 1px; border-bottom-color: menu; height: 112px;" class="text">
 <asp:Repeater ID="Repeater3" runat="server">
 <ItemTemplate>
        <tr>
            <td rowspan="1" style="border-bottom-width: 1px; border-bottom-color: scrollbar;
                width: 95px; height: 15px">
            </td>
            <td style="width: 137px">
            </td>
            <td style="width: 286px">
            </td>
            <td style="width: 77px">
            </td>
            <td style="width: 72px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td rowspan="4" style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                <asp:Image ID="Image3" runat="server" Height="80px" Width="88px" ImageUrl="images/clinic.jpg" /></td>
            <td style="width: 137px">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%#DataBinder.Eval(Container.DataItem, "name")%>'></asp:Label></td>
            <td style="width: 286px">
            </td>
            <td style="width: 77px" rowspan="4">
                <asp:Button ID="Button4" runat="server" Text="Hospital" Enabled ='<%#getenable(DataBinder.Eval(Container.DataItem, "created"))%>' PostBackUrl='<%#"~/Hospitals.aspx?clid="&DataBinder.Eval(Container.DataItem, "id")%>' /></td>
            <td style="width: 72px" rowspan="4">
                <asp:Button ID="Button5" runat="server" Text="Doctors" PostBackUrl='<%#"~/Doctors.aspx?clid="&DataBinder.Eval(Container.DataItem, "id")%>' />&nbsp;
            </td>
            <td style="width: 100px" rowspan="4">
                <asp:Button ID="Button6" runat="server" Text="Delete" Width="72px" PostBackUrl='<%#"Clinics.aspx?action=delcl&clid="&DataBinder.Eval(Container.DataItem, "id")&"&crid="&DataBinder.Eval(Container.DataItem, "crid")& urlextend()%>' /></td>
        </tr>
        <tr>
            <td style="width: 137px; height: 15px;">
                Location:
                <asp:Label ID="Label9" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "location")%>'></asp:Label></td>
            <td style="width: 286px; height: 15px;">
                Status:
                <asp:Label ID="Label17" runat="server" Text='<%#getstatus(DataBinder.Eval(Container.DataItem, "id"))%>'></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 137px; height: 15px">
                Time:
                <asp:Label ID="Label11" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "time")%>'></asp:Label></td>
            <td style="width: 286px; height: 15px">
                Appointment Charge:
                <asp:Label ID="Label18" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "charge")%>'></asp:Label></td>
        </tr>
        <tr>
            <td style="height: 17px" colspan="2">
                Details:
                <asp:Label ID="Label12" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "details") %>' Width="264px"></asp:Label></td>
        </tr>
        <tr>
            <td rowspan="1" style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 137px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 77px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 72px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 100px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
        </tr>
   </ItemTemplate>
    </asp:Repeater>
    </table>
     <table id="tblNavi3" runat="server" class="text">
        <tr>
            <td align="left" colspan="2" style="height: 17px">
                Page
                <asp:Label ID="lblPagen3" runat="server" Text="1"></asp:Label>
                of
                <asp:Label ID="lblNumpages3" runat="server" Text="1"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 43px; height: 26px">
                <asp:Button ID="btnPrev3" runat="server" Text="Prev" Width="40px" Enabled="False" /></td>
            <td align="right" style="width: 37px; height: 26px">
                <asp:Button ID="btnNext3" runat="server" Text="Next" Enabled="False" /></td>
        </tr>
    </table>
    &nbsp;</asp:Content>

