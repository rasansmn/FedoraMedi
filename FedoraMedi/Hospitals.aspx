<%@ Page Language="VB" MasterPageFile="~/MasterHospitals.master" AutoEventWireup="false" CodeFile="Hospitals.aspx.vb" Inherits="Hospitals" title="Hospitals | FedoraMedi.com" EnableEventValidation="false"%>
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
    <table class="text" style="width: 752px">
        <tr>
            <td class="title" style="width: 2894px; height: 24px">
                Hospitals
                <asp:Label ID="lblRef" runat="server" Width="336px"></asp:Label></td>
            <td style="width: 459px; height: 24px">
                Look In:</td>
            <td style="width: 183px; height: 24px">
                <asp:DropDownList ID="ddllookin" runat="server">
                    <asp:ListItem>name</asp:ListItem>
                    <asp:ListItem>address</asp:ListItem>
                    <asp:ListItem>city</asp:ListItem>
                    <asp:ListItem>phone</asp:ListItem>
                    <asp:ListItem>email</asp:ListItem>
                    <asp:ListItem>details</asp:ListItem>
                </asp:DropDownList></td>
            <td style="width: 130px; height: 24px">
                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox></td>
            <td style="width: 100px; height: 24px">
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
            <td style="width: 257px">
            </td>
            <td style="width: 286px">
            </td>
            <td style="width: 95px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td rowspan="5" style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                <asp:Image ID="Image1" runat="server" Height="80px" Width="88px" ImageUrl ='<%#DataBinder.Eval(Container.DataItem, "logo")%>'/></td>
            <td style="width: 257px">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Text='<%#DataBinder.Eval(Container.DataItem, "name")%>'></asp:Label></td>
            <td style="width: 286px">
            </td>
            <td style="width: 95px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 257px">
                Address:
                <asp:Label ID="Label2" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "address")%>'></asp:Label></td>
            <td style="width: 286px">
                </td>
            <td align="right" rowspan="3" style="width: 95px">
                &nbsp;
                <asp:Button ID="Button1" runat="server" Text="Doctors" Enabled ='<%#endoctors(DataBinder.Eval(Container.DataItem, "id"))%>' PostBackUrl='<%#"~/Doctors.aspx?hid="&DataBinder.Eval(Container.DataItem, "id")%>'/></td>
            <td align="right" rowspan="3" style="width: 100px">
                <asp:Button ID="Button2" runat="server" Text="Clinics" Enabled ='<%#enclinics(DataBinder.Eval(Container.DataItem, "id"))%>' PostBackUrl='<%#"~/Clinics.aspx?hid="&DataBinder.Eval(Container.DataItem, "id")%>'/></td>
        </tr>
        <tr>
            <td style="width: 257px; height: 15px">
                City:
                <asp:Label ID="Label3" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "city")%>'></asp:Label></td>
            <td style="width: 286px; height: 15px">
                </td>
        </tr>
        <tr>
            <td style="width: 257px; height: 17px">
                Phone:
                <asp:Label ID="Label4" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "phone")%>'></asp:Label></td>
            <td style="width: 286px; height: 17px">
                Email:
                <asp:Label ID="Label8" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "email")%>'></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                Details:
                <asp:Label ID="Label5" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "details")%>'></asp:Label></td>
            <td style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                Joined:
                <asp:Label ID="Label9" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "joined")%>'></asp:Label></td>
            <td style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
            </td>
            <td style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
            </td>
        </tr>
        <tr>
            <td rowspan="1" style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
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
            <td style="width: 257px">
            </td>
            <td style="width: 286px">
            </td>
            <td style="width: 95px">
            </td>
            <td style="width: 95px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td rowspan="5" style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                <asp:Image ID="Image2" runat="server" Height="80px" Width="88px" ImageUrl='<%#DataBinder.Eval(Container.DataItem, "logo")%>'/></td>
            <td style="width: 257px">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%#DataBinder.Eval(Container.DataItem, "name")%>'></asp:Label></td>
            <td style="width: 286px">
            </td>
            <td style="width: 95px">
            </td>
            <td style="width: 95px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 257px">
                Address:
                <asp:Label ID="Label7" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "address")%>'></asp:Label></td>
            <td style="width: 286px">
                </td>
            <td align="right" rowspan="3" style="width: 95px">
                <asp:Button ID="Button1" runat="server" Text='<%#getcaption(DataBinder.Eval(Container.DataItem, "id"))%>' Width="56px" PostBackUrl ='<%#geturl(DataBinder.Eval(Container.DataItem, "id"))%>'/>&nbsp;
            </td>
            <td align="right" rowspan="3" style="width: 95px">
                <asp:Button ID="Button3" runat="server" Text="Doctors" Enabled ='<%#endoctors(DataBinder.Eval(Container.DataItem, "id"))%>' PostBackUrl='<%#"~/Doctors.aspx?hid="&DataBinder.Eval(Container.DataItem, "id")%>'/></td>
            <td align="right" rowspan="3" style="width: 100px">
                <asp:Button ID="Button4" runat="server" Text="Clinics" Enabled ='<%#enclinics(DataBinder.Eval(Container.DataItem, "id"))%>' PostBackUrl='<%#"~/Clinics.aspx?hid="&DataBinder.Eval(Container.DataItem, "id")%>'/></td>
        </tr>
        <tr>
            <td style="width: 257px; height: 15px">
                City:
                <asp:Label ID="Label10" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "city")%>'></asp:Label></td>
            <td style="width: 286px; height: 15px">
                </td>
        </tr>
        <tr>
            <td style="width: 257px; height: 17px">
                Phone:
                <asp:Label ID="Label11" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "phone")%>'></asp:Label></td>
            <td style="width: 286px; height: 17px">
                Email:
                <asp:Label ID="Label12" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "email")%>'></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                Details:
                <asp:Label ID="Label13" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "details")%>'></asp:Label></td>
            <td style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                Joined:
                <asp:Label ID="Label14" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "joined")%>'></asp:Label></td>
            <td style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
            </td>
            <td style="border-bottom-width: 1px; border-bottom-color: scrollbar; width: 95px;
                height: 15px">
            </td>
            <td style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
            </td>
        </tr>
        <tr>
            <td rowspan="1" style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
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
<table id="tblRp3" runat="server" style="width: 752px" visible="false" class="text">
        <tr>
            <td style="width: 718px; height: 23px; background-color: #ffffcc;">
                No records found on this criteria.</td>
        </tr>
    </table>
<table style="width: 752px; border-bottom-width: 1px; border-bottom-color: menu; height: 112px;" class="text">
 <asp:Repeater ID="Repeater3" runat="server">
 <ItemTemplate >
        <tr>
            <td rowspan="1" style="border-bottom-width: 1px; border-bottom-color: scrollbar;
                width: 95px; height: 15px">
            </td>
            <td style="width: 2442px">
            </td>
            <td style="width: 3010px">
            </td>
            <td style="width: 266px">
            </td>
            <td style="width: 81px">
            </td>
            <td style="width: 132px">
            </td>
            <td style="width: 75px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td rowspan="5" style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                <asp:Image ID="Image2" runat="server" Height="80px" Width="88px" ImageUrl='<%#DataBinder.Eval(Container.DataItem, "logo")%>'/></td>
            <td style="width: 2442px">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%#DataBinder.Eval(Container.DataItem, "name")%>'></asp:Label></td>
            <td style="width: 3010px">
            </td>
            <td style="width: 266px">
            </td>
            <td style="width: 81px">
            </td>
            <td style="width: 132px">
            </td>
            <td style="width: 75px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 2442px">
                Address:
                <asp:Label ID="Label7" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "address")%>'></asp:Label></td>
            <td style="width: 3010px">
                </td>
            <td align="right" rowspan="3" style="width: 266px">
                <asp:Button ID="Button5" runat="server" Text="Validate" Visible='<%#validated(DataBinder.Eval(Container.DataItem, "id"))%>' PostBackUrl='<%#"~/Hospitals.aspx?action=val&hid="&DataBinder.Eval(Container.DataItem, "id")& urlextend()%>' /></td>
            <td align="right" rowspan="3" style="width: 81px">
                <asp:Button ID="Button3" runat="server" Text="Doctors" Enabled ='<%#endoctors(DataBinder.Eval(Container.DataItem, "id"))%>' PostBackUrl='<%#"~/Doctors.aspx?hid="&DataBinder.Eval(Container.DataItem, "id")%>'/>
            </td>
            <td align="right" rowspan="3" style="width: 132px">
                <asp:Button ID="Button4" runat="server" Text="Clinics" Enabled ='<%#enclinics(DataBinder.Eval(Container.DataItem, "id"))%>' PostBackUrl='<%#"~/Clinics.aspx?hid="&DataBinder.Eval(Container.DataItem, "id")%>' Width="48px"/></td>
            <td align="right" rowspan="3" style="width: 75px">
                <asp:Button ID="Button1" runat="server" Text="Update" PostBackUrl='<%#"~/Upprof.aspx?editid="&DataBinder.Eval(Container.DataItem, "id")& urlextend()%>' Width="64px"/></td>
            <td align="right" rowspan="3" style="width: 100px">
                <asp:Button ID="Button2" runat="server" Text="Delete" PostBackUrl='<%#"~/Hospitals.aspx?action=delhos&hid="&DataBinder.Eval(Container.DataItem, "id")& urlextend()%>' Width="48px"/></td>
        </tr>
        <tr>
            <td style="width: 2442px; height: 15px">
                City:
                <asp:Label ID="Label10" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "city")%>'></asp:Label></td>
            <td style="width: 3010px; height: 15px">
                </td>
        </tr>
        <tr>
            <td style="width: 2442px; height: 17px">
                Phone:
                <asp:Label ID="Label11" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "phone")%>'></asp:Label></td>
            <td style="width: 3010px; height: 17px">
                Email:
                <asp:Label ID="Label12" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "email")%>'></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 2442px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                Details:
                <asp:Label ID="Label13" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "details")%>'></asp:Label></td>
            <td style="width: 3010px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                Joined:
                <asp:Label ID="Label14" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "joined")%>'></asp:Label></td>
            <td style="border-bottom-width: 1px; border-bottom-color: scrollbar; width: 266px;
                height: 15px">
            </td>
            <td style="width: 81px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
            </td>
            <td style="border-bottom-width: 1px; border-bottom-color: scrollbar; width: 132px;
                height: 15px">
            </td>
            <td style="width: 75px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
            </td>
            <td style="border-bottom-width: 1px; border-bottom-color: scrollbar; width: 95px;
                height: 15px">
            </td>
        </tr>
        <tr>
            <td rowspan="1" style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 2442px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 3010px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 266px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 81px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 132px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 75px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
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
  </asp:Content>

