<%@ Page Language="VB" MasterPageFile="~/MasterDoctors.master" AutoEventWireup="false" CodeFile="Doctors.aspx.vb" Inherits="Doctors" title="Doctors | FedoraMedi.com" EnableEventValidation="false"%>
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
            <td class="title" style="width: 2811px; height: 24px">
                Doctors
                <asp:Label ID="lblRef" runat="server" Width="336px"></asp:Label></td>
            <td style="width: 459px; height: 24px">
                Look In:</td>
            <td style="width: 183px; height: 24px">
                <asp:DropDownList ID="ddllookin" runat="server">
                    <asp:ListItem>name</asp:ListItem>
                    <asp:ListItem>gender</asp:ListItem>
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
                <asp:Image ID="Image1" runat="server" Height="80px" Width="88px" ImageUrl='<%#DataBinder.Eval(Container.DataItem, "photo")%>'/></td>
            <td style="width: 257px">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Text='<%#DataBinder.Eval(Container.DataItem, "name")%>' ></asp:Label></td>
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
                Gender:
                <asp:Label ID="Label6" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "gender")%>'></asp:Label></td>
            <td align="right" rowspan="3" style="width: 95px">
                &nbsp;
                <asp:Button ID="Button1" Enabled ='<%#enhospital(DataBinder.Eval(Container.DataItem, "id"))%>' runat="server"  Text="Hospitals" PostBackUrl='<%#"~/Hospitals.aspx?did="&DataBinder.Eval(Container.DataItem, "id")%>' /></td>
            <td align="right" rowspan="3" style="width: 100px">
                <asp:Button ID="Button2" Enabled ='<%#enclinic(DataBinder.Eval(Container.DataItem, "id"))%>' runat="server" Text="Clinics" PostBackUrl ='<%#"~/Clinics.aspx?did="&DataBinder.Eval(Container.DataItem, "id")%>'/></td>
        </tr>
        <tr>
            <td style="width: 257px; height: 15px">
                City:
                <asp:Label ID="Label3" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "city")%>'></asp:Label></td>
            <td style="width: 286px; height: 15px">
                Age:
                <asp:Label ID="Label7" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "age")%>'></asp:Label></td>
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
     <ItemTemplate>
        <tr>
            <td rowspan="1" style="border-bottom-width: 1px; border-bottom-color: scrollbar;
                width: 95px; height: 15px">
            </td>
            <td style="width: 465px">
            </td>
            <td style="width: 579px">
            </td>
            <td style="width: 60px">
            </td>
            <td style="width: 77px">
            </td>
            <td style="width: 67px">
            </td>
            <td style="width: 36px">
            </td>
            <td style="width: 74px">
            </td>
        </tr>
        <tr>
            <td rowspan="5" style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                <asp:Image ID="Image2" runat="server" Height="80px" Width="88px" ImageUrl='<%#DataBinder.Eval(Container.DataItem, "photo")%>'/></td>
            <td style="width: 465px">
                <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%#DataBinder.Eval(Container.DataItem, "name")%>' ></asp:Label></td>
            <td style="width: 579px">
            </td>
            <td style="width: 60px">
            </td>
            <td style="width: 77px">
            </td>
            <td style="width: 67px">
            </td>
            <td style="width: 36px">
            </td>
            <td style="width: 74px">
            </td>
        </tr>
        <tr>
            <td style="width: 465px">
                Address:
                <asp:Label ID="Label11" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "address")%>'></asp:Label></td>
            <td style="width: 579px">
                Gender:
                <asp:Label ID="Label12" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "gender")%>'></asp:Label></td>
            <td align="right" rowspan="3" style="width: 60px">
                <asp:Button ID="Button5" runat="server" Text="Validate" PostBackUrl ='<%#"~/Doctors.aspx?action=val&did="&DataBinder.Eval(Container.DataItem, "id")& urlextend()%>' Visible='<%#validated(DataBinder.Eval(Container.DataItem, "id"))%>' Width="64px" /></td>
            <td align="right" rowspan="3" style="width: 77px">
                &nbsp;
                <asp:Button ID="Button3" Enabled ='<%#enhospital(DataBinder.Eval(Container.DataItem, "id"))%>' runat="server"  Text="Hospitals" PostBackUrl='<%#"~/Hospitals.aspx?did="&DataBinder.Eval(Container.DataItem, "id")%>' /></td>
            <td align="right" rowspan="3" style="width: 67px">
                <asp:Button ID="Button4" Enabled ='<%#enclinic(DataBinder.Eval(Container.DataItem, "id"))%>' runat="server" Text="Clinics" PostBackUrl ='<%#"~/Clinics.aspx?did="&DataBinder.Eval(Container.DataItem, "id")%>'/></td>
            <td align="right" rowspan="3" style="width: 36px">
                <asp:Button ID="Button2" runat="server" Text="Update" PostBackUrl ='<%#"~/Upprof.aspx?editid="&DataBinder.Eval(Container.DataItem, "id")& urlextend()%>'/></td>
            <td align="right" rowspan="3" style="width: 74px">
                <asp:Button ID="Button1" runat="server" Text="Delete" PostBackUrl ='<%#"~/Doctors.aspx?action=deld&did="&DataBinder.Eval(Container.DataItem, "id")& urlextend()%>' Width="64px"/></td>
        </tr>
        <tr>
            <td style="width: 465px; height: 15px">
                City:
                <asp:Label ID="Label13" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "city")%>'></asp:Label></td>
            <td style="width: 579px; height: 15px">
                Age:
                <asp:Label ID="Label14" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "age")%>'></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 465px; height: 17px">
                Phone:
                <asp:Label ID="Label15" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "phone")%>'></asp:Label></td>
            <td style="width: 579px; height: 17px">
                Email:
                <asp:Label ID="Label16" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "email")%>'></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 465px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                Details:
                <asp:Label ID="Label17" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "details")%>'></asp:Label></td>
            <td style="width: 579px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                Joined:
                <asp:Label ID="Label18" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "joined")%>'></asp:Label></td>
            <td style="border-bottom-width: 1px; border-bottom-color: scrollbar; width: 60px;
                height: 15px">
            </td>
            <td style="width: 77px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
            </td>
            <td style="width: 67px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
            </td>
            <td style="border-bottom-width: 1px; border-bottom-color: scrollbar; width: 36px;
                height: 15px">
            </td>
            <td style="border-bottom-width: 1px; border-bottom-color: scrollbar; width: 74px;
                height: 15px">
            </td>
        </tr>
        <tr>
            <td rowspan="1" style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 465px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 579px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 60px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 77px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 67px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 36px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 74px; border-bottom: scrollbar 1px solid; height: 15px">
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

