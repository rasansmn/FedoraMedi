<%@ Page Language="VB" MasterPageFile="~/MasterGeneral.master" AutoEventWireup="false" CodeFile="Portal.aspx.vb" Inherits="Portal" title="Welcome | FedoraMedi.com" EnableEventValidation="false"%>
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
            <td class="title" style="width: 8720px; height: 24px">
                Welcome
                <asp:Label ID="lblWelcome" runat="server" Text="Your Name"></asp:Label></td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table style="width: 752px">
        <tr>
            <td style="width: 100px; height: 15px; background-color: inactiveborder;">
                <strong>Appointments</strong></td>
        </tr>
    </table>
        <br />
    <table id="tblRp1" runat="server" style="width: 752px" visible="false">
        <tr>
            <td style="width: 718px; height: 23px; background-color: #ffffcc;">
                <asp:Label ID="Label1" runat="server" Text="You have't  taken any appointments yet. Browse through our "
                    Width="296px"></asp:Label><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Doctors.aspx">Doctors</asp:HyperLink>,
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Hospitals.aspx">Hospitals</asp:HyperLink>
                and
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Clinics.aspx">Clinics</asp:HyperLink>
                to take appointments.</td>
        </tr>
    </table>
    
        <table style="width: 752px; height: 40px" class="text">
         <asp:Repeater ID="Repeater1" runat="server">
         <ItemTemplate >
            <tr>
                <td rowspan="4" style="width: 5px; border-bottom: scrollbar 1px solid">
                    <asp:Image ID="Image5" runat="server" Height="40px" Width="40px" ImageUrl="images/app.jpg" /></td>
                <td style="width: 107px; height: 15px">
                    Clinic:
                    <asp:HyperLink ID="HyperLink4" Text='<%# DataBinder.Eval(Container.DataItem, "name") %>' runat="server" NavigateUrl='<%#"~/Clinics.aspx?cid="&DataBinder.Eval(Container.DataItem, "clinic_id")%>'></asp:HyperLink></td>
                <td style="width: 100px; height: 15px;">
                </td>
                <td style="width: 50px; height: 15px;">
                </td>
            </tr>
            <tr>
                <td style="width: 107px; height: 15px;">
                    Time:
                    <asp:Label ID="Label43" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "time")%>'></asp:Label></td>
                <td style="width: 100px; height: 15px;">
                    <asp:Label ID="Label4" runat="server" Text='<%# getpaymentid(DataBinder.Eval(Container.DataItem, "id")) %>' Width="144px"></asp:Label></td>
                <td rowspan="2" style="width: 100px; border-bottom-style: none">
                    <asp:Button ID="Button5" runat="server" Text="Cancel Appointment" Width="144px" PostBackUrl='<%#"~/Portal.aspx?action=delapp&appid="&DataBinder.Eval(Container.DataItem, "id")%>'/></td>
            </tr>
            <tr>
                <td style="width: 107px; height: 15px; border-bottom-style: none">
                    Approved:
                    <asp:Label ID="Label44" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "approved")%>'></asp:Label></td>
                <td style="width: 100px; height: 15px; border-bottom-style: none">
                    <asp:Label ID="Label5" runat="server" Text='<%# getpaymentmethod(DataBinder.Eval(Container.DataItem, "id")) %>' Width="144px"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 107px; border-bottom: scrollbar 1px solid; height: 16px">
                </td>
                <td style="width: 5px; border-bottom: scrollbar 1px solid; height: 16px;">
                </td>
                <td style="width: 5px; border-bottom: scrollbar 1px solid; height: 16px;">
                </td>
            </tr>
            </ItemTemplate>
             </asp:Repeater>
        </table>
        <br />
    <table style="width: 752px">
        <tr>
            <td style="width: 100px; height: 15px; background-color: inactiveborder;">
            <strong>Profile (Member)</strong>
            </td>
        </tr>
    </table>
    
  
     <table style="width: 752px; border-bottom-width: 1px; border-bottom-color: menu; height: 112px;" class="text">

        <tr>
            <td rowspan="1" style="border-bottom-width: 1px; border-bottom-color: scrollbar;
                width: 95px; height: 15px">
            </td>
            <td style="width: 257px">
            </td>
            <td style="width: 253px">
            </td>
            <td style="width: 95px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td rowspan="5" style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                <asp:Image ID="imgMember" runat="server" Height="80px" Width="88px" /></td>
            <td style="width: 257px">
                <asp:Label ID="lblName" runat="server" Font-Bold="True" Text="Your Name"></asp:Label></td>
            <td style="width: 253px">
            </td>
            <td style="width: 95px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 257px">
                Address:
                <asp:Label ID="lblAddress" runat="server"></asp:Label></td>
            <td style="width: 253px">
                Gender:
                <asp:Label ID="lblGender" runat="server"></asp:Label></td>
            <td align="right" rowspan="3" style="width: 95px">
                <asp:Button ID="Button2" runat="server" Text="Update" PostBackUrl="~/Upprof.aspx" />&nbsp;
                </td>
            <td align="right" rowspan="3" style="width: 100px">
                </td>
        </tr>
        <tr>
            <td style="width: 257px; height: 15px">
                City:
                <asp:Label ID="lblCity" runat="server"></asp:Label></td>
            <td style="width: 253px; height: 15px">
                Age:
                <asp:Label ID="lblAge" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 257px; height: 17px">
                Phone:
                <asp:Label ID="lblPhone" runat="server"></asp:Label></td>
            <td style="width: 253px; height: 17px">
                Email:
                <asp:Label ID="lblEmail" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                Details:
                <asp:Label ID="lblDetails" runat="server"></asp:Label></td>
            <td style="width: 253px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                Last active:
                <asp:Label ID="lblLastactive" runat="server" Width="72px"></asp:Label></td>
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
            <td style="width: 253px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
        </tr>
   
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <table style="width: 752px">
        <tr>
            <td style="width: 100px; height: 15px; background-color: inactiveborder;">
            <strong>Appointments</strong>
            </td>
        </tr>
    </table>
<br />
<table id="tblRp2" runat="server" style="width: 752px" visible="false">
        <tr>
            <td style="width: 718px; height: 23px; background-color: #ffffcc;">
                You haven't received any appointment request yet.</td>
        </tr>
    </table>
    
            <table style="width: 752px; height: 40px" class="text">
            <asp:Repeater ID="Repeater2" runat="server">
            <ItemTemplate >
                <tr>
                    <td rowspan="5" style="width: 67px; border-bottom: scrollbar 1px solid">
                        <asp:Image ID="Image6" runat="server" Height="40px" Width="40px" ImageUrl="images/app.jpg" /></td>
                    <td style="width: 206px; height: 15px">
                        Clinic:
                        <asp:HyperLink ID="HyperLink5" Text='<%# DataBinder.Eval(Container.DataItem, "name") %>' runat="server" NavigateUrl='<%#"~/Clinics.aspx?cid="&DataBinder.Eval(Container.DataItem, "clinic_id")%>'>HyperLink</asp:HyperLink></td>
                    <td style="width: 336px; height: 15px">
                        </td>
                    <td style="width: 83px; height: 15px;">
                    </td>
                    <td style="width: 100px; height: 15px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 206px">
                        Time:
                        <asp:Label ID="Label3" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "time")%>'></asp:Label></td>
                    <td style="width: 336px">
                        </td>
                    <td style="width: 83px" rowspan="3">
                        &nbsp;<asp:Button ID="Button6" runat="server" Text="Accept" Enabled='<%#getenable(DataBinder.Eval(Container.DataItem, "approved"))%>' Width="64px" PostBackUrl='<%#"~/Portal.aspx?action=accapp&appid="&DataBinder.Eval(Container.DataItem, "id")%>'/></td>
                    <td rowspan="3" style="width: 100px; border-bottom-style: none">
                        <asp:Button ID="Button55" runat="server" Text="Reject" PostBackUrl='<%#"~/Portal.aspx?action=rejapp&appid="&DataBinder.Eval(Container.DataItem, "id")%>'/></td>
                </tr>
                <tr>
                    <td style="width: 206px; border-bottom-style: none; height: 15px;">
                        Approved:
                        <asp:Label ID="Label144" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "approved")%>'></asp:Label></td>
                    <td style="width: 336px; border-bottom-style: none; height: 15px;">
                        <asp:Label ID="Label4" runat="server" Text='<%# getpaymentid(DataBinder.Eval(Container.DataItem, "id")) %>'></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 206px; border-bottom-style: none">
                        Request By:
                        <asp:HyperLink Text='<%#getmname(DataBinder.Eval(Container.DataItem, "mem_id"))%>' ID="HyperLink14" NavigateUrl='<%#"~/Members.aspx?mid="&DataBinder.Eval(Container.DataItem, "mem_id")%>' runat="server">HyperLink</asp:HyperLink></td>
                    <td style="width: 336px; border-bottom-style: none">
                        <asp:Label ID="Label5" runat="server" Text='<%# getpaymentmethod(DataBinder.Eval(Container.DataItem, "id")) %>'></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 206px; border-bottom: scrollbar 1px solid; height: 16px">
                    </td>
                    <td style="width: 336px; border-bottom: scrollbar 1px solid; height: 16px">
                    </td>
                    <td style="width: 83px; border-bottom: scrollbar 1px solid; height: 16px;">
                    </td>
                    <td style="width: 100px; border-bottom: scrollbar 1px solid; height: 16px;">
                    </td>
                </tr>
                </ItemTemplate>
                 </asp:Repeater>
            </table>
     
  <br />
 
    <table style="width: 752px">
        <tr>
            <td style="width: 100px; height: 15px; background-color: inactiveborder;">
            <strong>Clinics</strong>
            </td>
        </tr>
    </table>
    <br />
    <table id="tblRp3" runat="server" style="width: 752px" visible="false">
        <tr>
            <td style="width: 718px; height: 23px; background-color: #ffffcc;">
                You haven't added any clinic yet. Add clinics to receive appointment requests.</td>
        </tr>
    </table>
     
    <table style="width: 752px; border-bottom-width: 1px; border-bottom-color: menu; height: 112px;" class="text">
<asp:Repeater ID="Repeater3" runat="server">
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
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td rowspan="4" style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                <asp:Image ID="Image8" runat="server" Height="80px" Width="88px" ImageUrl="images/clinic.jpg" /></td>
            <td style="width: 257px">
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%#DataBinder.Eval(Container.DataItem, "name")%>'>></asp:Label></td>
            <td style="width: 286px">
            </td>
            <td style="width: 95px">
            </td>
            <td style="width: 100px" rowspan="4">
                <asp:Button ID="Button5" runat="server" Text="Remove" PostBackUrl ='<%#"~/Portal.aspx?action=delcl&clid="&DataBinder.Eval(Container.DataItem, "id")%>' /></td>
        </tr>
        <tr>
            <td style="width: 257px">
                Location:
                <asp:Label ID="Label222" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "location")%>'></asp:Label></td>
            <td style="width: 286px">
                Appointments:
                <asp:Label ID="Label13" runat="server" Text='<%#getapps(DataBinder.Eval(Container.DataItem, "id"))%>'></asp:Label>/<asp:Label ID="Label14"
                    runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "max_app")%>'></asp:Label></td>
            <td align="right" rowspan="3" style="width: 95px">
                &nbsp;
                </td>
        </tr>
        <tr>
            <td style="width: 257px; height: 15px">
                Time:
                <asp:Label ID="Label33" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "time")%>'></asp:Label></td>
            <td style="width: 286px; height: 15px">
                Charge:
                <asp:Label ID="Label15" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "charge")%>'></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 257px; height: 17px">
                Details:
                <asp:Label ID="Label6" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "details")%>'></asp:Label></td>
            <td style="width: 286px; height: 17px">
                </td>
        </tr>
        <tr>
            <td rowspan="1" style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 257px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 100px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
        </tr>
        </ItemTemplate>
  </asp:Repeater>
    </table>
    
   <br />
 
        <table class="text">
            <tr>
                <td style="width: 95px; height: 15px">
                    Name:</td>
                <td style="width: 100px; height: 15px">
                    <asp:TextBox ID="txtName" runat="server" ValidationGroup="d"></asp:TextBox></td>
                <td style="width: 2px; height: 15px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                        ErrorMessage="*" ValidationGroup="d"></asp:RequiredFieldValidator>
                </td>
                <td style="width: 63px; height: 15px">
                    Location:</td>
                <td style="width: 96px; height: 15px">
                    <asp:TextBox ID="txtLocation" runat="server" ValidationGroup="d"></asp:TextBox></td>
                <td style="width: 11px; height: 15px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLocation"
                        ErrorMessage="*" ValidationGroup="d"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 95px; height: 10px;">
                    Time:</td>
                <td style="width: 100px; height: 10px;">
                    <asp:TextBox ID="txtTime" runat="server" ValidationGroup="d"></asp:TextBox></td>
                <td style="width: 2px; height: 10px;">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTime"
                        ErrorMessage="*" ValidationGroup="d"></asp:RequiredFieldValidator></td>
                <td style="width: 63px; height: 10px;">
                    Details:</td>
                <td style="width: 96px; height: 10px">
                    <asp:TextBox ID="txtDetails" runat="server" ValidationGroup="d"></asp:TextBox></td>
                <td style="width: 11px; height: 10px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDetails"
                        ErrorMessage="*" ValidationGroup="d"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 95px; height: 10px">
                    Max Appointments:
                </td>
                <td style="width: 100px; height: 10px">
                    <asp:TextBox ID="txtApp" runat="server" ValidationGroup="d"></asp:TextBox></td>
                <td style="width: 2px; height: 10px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtApp"
                        ErrorMessage="*" ValidationGroup="d"></asp:RequiredFieldValidator></td>
                <td style="width: 63px; height: 10px">
                    Charge (Rs):</td>
                <td style="width: 96px; height: 10px">
                    <asp:TextBox ID="txtRs" runat="server" ValidationGroup="d"></asp:TextBox></td>
                <td style="width: 11px; height: 10px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtRs"
                        ErrorMessage="*" ValidationGroup="d"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 95px">
                </td>
                <td align="right" colspan="4">
                    <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    = Required
                    <asp:Button ID="btnAddclinic" runat="server" Text="Add Clinic" ValidationGroup="d" /></td>
                <td style="width: 11px">
                </td>
            </tr>
        </table>
        <br />
        <table style="width: 752px">
        <tr>
            <td style="width: 100px; height: 15px; background-color: inactiveborder;">
            <strong>Profile (Doctor)</strong>
            </td>
        </tr>
    </table>
        <table style="width: 752px; border-bottom-width: 1px; border-bottom-color: menu; height: 112px;" class="text">

        <tr>
            <td rowspan="1" style="border-bottom-width: 1px; border-bottom-color: scrollbar;
                width: 95px; height: 15px">
            </td>
            <td style="width: 270px">
            </td>
            <td style="width: 272px">
            </td>
            <td style="width: 95px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td rowspan="5" style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                <asp:Image ID="imgDoctor" runat="server" Height="80px" Width="88px" /></td>
            <td style="width: 270px">
                <asp:Label ID="lblName2" runat="server" Font-Bold="True" Text="Your Name"></asp:Label></td>
            <td style="width: 272px">
            </td>
            <td style="width: 95px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 270px">
                Address:
                <asp:Label ID="lbladdress2" runat="server"></asp:Label></td>
            <td style="width: 272px">
                Gender:
                <asp:Label ID="lblGender2" runat="server"></asp:Label></td>
            <td align="right" rowspan="3" style="width: 95px">
                <asp:Button ID="Button1" runat="server" Text="Update" PostBackUrl="~/Upprof.aspx" />&nbsp;
                </td>
            <td align="right" rowspan="3" style="width: 100px">
                </td>
        </tr>
        <tr>
            <td style="width: 270px; height: 15px">
                City:
                <asp:Label ID="lblCity2" runat="server"></asp:Label></td>
            <td style="width: 272px; height: 15px">
                Age:
                <asp:Label ID="lblAge2" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 270px; height: 17px">
                Phone:
                <asp:Label ID="lblPhone2" runat="server"></asp:Label></td>
            <td style="width: 272px; height: 17px">
                Email:
                <asp:Label ID="lblEmail2" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 270px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                Details:
                <asp:Label ID="lblDetails2" runat="server"></asp:Label></td>
            <td style="width: 272px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                Last Active:
                <asp:Label ID="lblLastactive2" runat="server"></asp:Label></td>
            <td style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
            </td>
            <td style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
            </td>
        </tr>
        <tr>
            <td rowspan="1" style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 270px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 272px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
        </tr>
   
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" Runat="Server">

  <table style="width: 752px">
        <tr>
            <td style="width: 100px; height: 15px; background-color: inactiveborder;">
            <strong>Appointments</strong>
            </td>
        </tr>
    </table>
   <br />
   <table id="tblRp4" runat="server" style="width: 752px" visible="false">
        <tr>
            <td style="width: 718px; height: 23px; background-color: #ffffcc;">
                You haven't received any appointment request yet.</td>
        </tr>
    </table>
    <table style="width: 752px; height: 40px" class="text">
     <asp:Repeater ID="Repeater4" runat="server">
     <ItemTemplate >
        <tr>
            <td rowspan="5" style="width: 58px; border-bottom: scrollbar 1px solid">
                <asp:Image ID="Image7" runat="server" Height="40px" Width="40px" ImageUrl="~/images/app.jpg" /></td>
            <td style="width: 170px; height: 15px">
                Clinic:
                <asp:HyperLink ID="HyperLink5" Text='<%# DataBinder.Eval(Container.DataItem, "name") %>' runat="server" NavigateUrl='<%#"~/Clinics.aspx?cid="&DataBinder.Eval(Container.DataItem, "clinic_id")%>'>HyperLink</asp:HyperLink></td>
            <td style="width: 246px; height: 15px">
                </td>
            <td style="width: 79px; height: 15px;">
            </td>
            <td style="width: 50px; height: 15px;">
            </td>
        </tr>
        <tr>
            <td style="width: 170px">
                Time:
                <asp:Label ID="Label33" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "time")%>'></asp:Label></td>
            <td style="width: 246px">
                </td>
            <td rowspan="3" style="width: 79px; border-bottom-style: none">
                <asp:Button ID="Button7" runat="server" Text="Accept" Enabled='<%#getenable(DataBinder.Eval(Container.DataItem, "approved"))%>' Width="72px" PostBackUrl ='<%#"~/Portal.aspx?action=accapp&appid="&DataBinder.Eval(Container.DataItem, "id")%>'/></td>
            <td rowspan="3" style="width: 100px; border-bottom-style: none">
                <asp:Button ID="Button5" runat="server" Text="Reject" PostBackUrl='<%#"~/Portal.aspx?action=rejapp&appid="&DataBinder.Eval(Container.DataItem, "id")%>' />
            </td>
        </tr>
        <tr>
            <td style="width: 170px; border-bottom-style: none; height: 15px;">
                Approved:
                <asp:Label ID="Label4" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "approved")%>'></asp:Label></td>
            <td style="width: 246px; border-bottom-style: none; height: 15px;">
                <asp:Label ID="Label5" runat="server" Text='<%# getpaymentid(DataBinder.Eval(Container.DataItem, "id")) %>'></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 170px; height: 18px; border-bottom-style: none">
                Request By:
                <asp:HyperLink ID="HyperLink4" Text='<%#getmname(DataBinder.Eval(Container.DataItem, "mem_id"))%>' NavigateUrl='<%#"~/Members.aspx?mid="&DataBinder.Eval(Container.DataItem, "mem_id")%>' runat="server">HyperLink</asp:HyperLink></td>
            <td style="width: 246px; height: 18px; border-bottom-style: none">
                <asp:Label ID="Label6" runat="server" Text='<%# getpaymentmethod(DataBinder.Eval(Container.DataItem, "id")) %>'></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 170px; border-bottom: scrollbar 1px solid; height: 16px">
            </td>
            <td style="width: 246px; border-bottom: scrollbar 1px solid; height: 16px">
            </td>
            <td style="width: 79px; border-bottom: scrollbar 1px solid; height: 16px;">
            </td>
            <td style="width: 5px; border-bottom: scrollbar 1px solid; height: 16px;">
            </td>
        </tr>
        </ItemTemplate>
        </asp:Repeater>
    </table>
    <br />
  <table style="width: 752px">
        <tr>
            <td style="width: 100px; height: 15px; background-color: inactiveborder;">
            <strong>Clinics</strong>
            </td>
        </tr>
    </table>
    <br />
    <table id="tblRp5" runat="server" style="width: 752px" visible="false">
        <tr>
            <td style="width: 718px; height: 23px; background-color: #ffffcc;">
                You haven't added any clinic yet. Add clinics to receive appointment requests.</td>
        </tr>
    </table>
    <table style="width: 752px; border-bottom-width: 1px; border-bottom-color: menu; height: 112px;" class="text">
<asp:Repeater ID="Repeater5" runat="server">
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
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td rowspan="4" style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                <asp:Image ID="Image9" runat="server" Height="80px" Width="88px" ImageUrl="images/clinic.jpg" /></td>
            <td style="width: 257px">
                <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%#DataBinder.Eval(Container.DataItem, "name")%>'>></asp:Label></td>
            <td style="width: 286px">
            </td>
            <td style="width: 95px">
            </td>
            <td style="width: 100px" rowspan="4">
                <asp:Button ID="Button8" runat="server" Text="Remove" PostBackUrl='<%#"~/Portal.aspx?action=delcl&clid="&DataBinder.Eval(Container.DataItem, "id")%>'/></td>
        </tr>
        <tr>
            <td style="width: 257px">
                Location:
                <asp:Label ID="Label8" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "location")%>'></asp:Label></td>
            <td style="width: 286px">
                Appointments:
                <asp:Label ID="Label4" runat="server" Text='<%#getapps(DataBinder.Eval(Container.DataItem, "id"))%>'></asp:Label>/<asp:Label ID="Label10"
                    runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "max_app")%>'></asp:Label></td>
            <td align="right" rowspan="3" style="width: 95px">
                &nbsp;
                </td>
        </tr>
        <tr>
            <td style="width: 257px; height: 15px">
                Time:
                <asp:Label ID="Label9" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "time")%>'></asp:Label></td>
            <td style="width: 286px; height: 15px">
                Charge:
                <asp:Label ID="Label11" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "charge")%>'></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 257px; height: 17px">
                Details:
                <asp:Label ID="Label12" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "details")%>'></asp:Label></td>
            <td style="width: 286px; height: 17px">
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
            <td style="width: 100px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
        </tr>
        </ItemTemplate>
      </asp:Repeater>
    </table>
    <br />
    <table class="text">
        <tr>
            <td style="width: 95px; height: 15px">
                Name:</td>
            <td style="width: 100px; height: 15px">
                <asp:TextBox ID="txtName2" runat="server" ValidationGroup="h"></asp:TextBox></td>
            <td style="width: 8px; height: 15px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                    ValidationGroup="h" ControlToValidate="txtName2"></asp:RequiredFieldValidator></td>
            <td style="width: 65px; height: 15px">
                Location:</td>
            <td style="width: 102px; height: 15px">
                <asp:TextBox ID="txtLocation2" runat="server" ValidationGroup="h"></asp:TextBox></td>
            <td style="width: 11px; height: 15px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*"
                    ValidationGroup="h" ControlToValidate="txtLocation2"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 95px; height: 10px;">
                Time:</td>
            <td style="width: 100px; height: 10px;">
                <asp:TextBox ID="txtTime2" runat="server" ValidationGroup="h"></asp:TextBox></td>
            <td style="width: 8px; height: 10px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"
                    ValidationGroup="h" ControlToValidate="txtTime2"></asp:RequiredFieldValidator></td>
            <td style="width: 65px; height: 10px;">
                Details:</td>
            <td style="width: 102px; height: 10px">
                <asp:TextBox ID="txtDetails2" runat="server" ValidationGroup="h"></asp:TextBox></td>
            <td style="width: 11px; height: 10px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*"
                    ValidationGroup="h" ControlToValidate="txtDetails2"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 95px; height: 10px">
                Max Appointments:
            </td>
            <td style="width: 100px; height: 10px">
                <asp:TextBox ID="txtApp2" runat="server" ValidationGroup="h"></asp:TextBox></td>
            <td style="width: 8px; height: 10px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtApp2"
                    ErrorMessage="*" ValidationGroup="h"></asp:RequiredFieldValidator></td>
            <td style="width: 65px; height: 10px">
                Charge (Rs):</td>
            <td style="width: 102px; height: 10px">
                <asp:TextBox ID="txtRs2" runat="server" ValidationGroup="h"></asp:TextBox></td>
            <td style="width: 11px; height: 10px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtRs2"
                    ErrorMessage="*" ValidationGroup="h"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 95px">
            </td>
            <td align="right" colspan="4">
                <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*"></asp:Label>
                = Required
                <asp:Button ID="btnAddclinic2" runat="server" Text="Add Clinic" ValidationGroup="h" /></td>
            <td style="width: 11px">
            </td>
        </tr>
    </table>
    <br />
       <table style="width: 752px">
        <tr>
            <td style="width: 100px; height: 15px; background-color: inactiveborder;">
            <strong>Profile (Hospital)</strong>
            </td>
        </tr>
    </table>
     <table style="width: 752px; border-bottom-width: 1px; border-bottom-color: menu; height: 112px;" class="text">

        <tr>
            <td rowspan="1" style="border-bottom-width: 1px; border-bottom-color: scrollbar;
                width: 95px; height: 15px">
            </td>
            <td style="width: 241px">
            </td>
            <td style="width: 281px">
            </td>
            <td style="width: 95px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td rowspan="5" style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                <asp:Image ID="imgHospital" runat="server" Height="80px" Width="88px" /></td>
            <td style="width: 241px">
                <asp:Label ID="lblName3" runat="server" Font-Bold="True" Text="Your Name"></asp:Label></td>
            <td style="width: 281px">
            </td>
            <td style="width: 95px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 241px; height: 15px;">
                Address:
                <asp:Label ID="lblAddress3" runat="server"></asp:Label></td>
            <td style="width: 281px; height: 15px;">
                </td>
            <td align="right" rowspan="3" style="width: 95px">
                <asp:Button ID="Button3" runat="server" Text="Update" PostBackUrl="~/Upprof.aspx" />&nbsp;
                </td>
            <td align="right" rowspan="3" style="width: 100px">
                </td>
        </tr>
        <tr>
            <td style="width: 241px; height: 15px">
                City:
                <asp:Label ID="lblCity3" runat="server"></asp:Label></td>
            <td style="width: 281px; height: 15px">
                </td>
        </tr>
        <tr>
            <td style="width: 241px; height: 17px">
                Phone:
                <asp:Label ID="lblPhone3" runat="server"></asp:Label></td>
            <td style="width: 281px; height: 17px">
                Email:
                <asp:Label ID="lblEmail3" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 241px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                Details:
                <asp:Label ID="lblDetails3" runat="server"></asp:Label></td>
            <td style="width: 281px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                Last Active:
                <asp:Label ID="lblLastactive3" runat="server" Text=''></asp:Label></td>
            <td style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
            </td>
            <td style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
            </td>
        </tr>
        <tr>
            <td rowspan="1" style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 241px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 281px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
        </tr>
   
    </table>
    
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" Runat="Server">
   

   <table style="width: 752px">
        <tr>
            <td style="width: 100px; height: 15px; background-color: inactiveborder;">
            <strong>Profile (Donator)</strong>
            </td>
        </tr>
    </table>
     <table style="width: 752px; border-bottom-width: 1px; border-bottom-color: menu; height: 112px;" class="text">

        <tr>
            <td rowspan="1" style="border-bottom-width: 1px; border-bottom-color: scrollbar;
                width: 95px; height: 15px">
            </td>
            <td style="width: 250px">
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
                <asp:Image ID="imgDonator" runat="server" Height="80px" Width="88px" /></td>
            <td style="width: 250px; height: 18px;">
                <asp:Label ID="lblName4" runat="server" Font-Bold="True" Text="Your Name"></asp:Label></td>
            <td style="width: 286px; height: 18px;">
            </td>
            <td style="width: 95px; height: 18px;">
            </td>
            <td style="width: 100px; height: 18px;">
            </td>
        </tr>
        <tr>
            <td style="width: 250px">
                Address:
                <asp:Label ID="lblAddress4" runat="server"></asp:Label></td>
            <td style="width: 286px">
                Gender:
                <asp:Label ID="lblGender4" runat="server"></asp:Label></td>
            <td align="right" rowspan="3" style="width: 95px">
                <asp:Button ID="Button4" runat="server" Text="Update" PostBackUrl="~/Upprof.aspx" />&nbsp;
                </td>
            <td align="right" rowspan="3" style="width: 100px">
                </td>
        </tr>
        <tr>
            <td style="width: 250px; height: 15px">
                City:
                <asp:Label ID="lblCity4" runat="server"></asp:Label></td>
            <td style="width: 286px; height: 15px">
                Age:
                <asp:Label ID="lblAge4" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 250px; height: 17px">
                Phone:
                <asp:Label ID="lblPhone4" runat="server"></asp:Label></td>
            <td style="width: 286px; height: 17px">
                Email:
                <asp:Label ID="lblEmail4" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 250px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                Details:
                <asp:Label ID="lblDetails4" runat="server"></asp:Label></td>
            <td style="width: 286px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
                Blood Group:
                <asp:Label ID="lblBgroup" runat="server"></asp:Label></td>
            <td style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
            </td>
            <td style="width: 95px; height: 15px; border-bottom-width: 1px; border-bottom-color: scrollbar;">
            </td>
        </tr>
        <tr>
            <td rowspan="1" style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 250px; border-bottom: scrollbar 1px solid; height: 15px">
                Doantion:
                <asp:Label ID="lblDonation" runat="server" Text="Label" Width="32px"></asp:Label></td>
            <td style="width: 286px; border-bottom: scrollbar 1px solid; height: 15px">
                Last Active:
                <asp:Label ID="lblLastactive4" runat="server" Text="Label"></asp:Label></td>
            <td style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 95px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
        </tr>
   
    </table>
</asp:Content>
<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder6">
<table style="width: 752px">
    <tr>
        <td style="width: 100px; height: 15px; background-color: inactiveborder;">
            <strong>Statistics</strong>
        </td>
    </tr>
</table>
    <table style="width: 752px; border-bottom-width: 1px; border-bottom-color: menu; height: 112px;" class="text">
        <tr>
            <td style="width: 153px">
            </td>
            <td style="width: 324px">
            </td>
        </tr>
        <tr>
            <td style="width: 153px">
                Registered Members:
                <asp:HyperLink ID="lnkTotm" runat="server" NavigateUrl="~/Members.aspx">HyperLink</asp:HyperLink></td>
            <td style="width: 324px">
                Registered Doctors:
                <asp:HyperLink ID="lnkTotd" runat="server" NavigateUrl="~/Doctors.aspx">HyperLink</asp:HyperLink></td>
        </tr>
        <tr>
            <td style="width: 153px;">
                Registered Hopitals:
                <asp:HyperLink ID="lnkToth" runat="server" NavigateUrl="~/Hospitals.aspx">HyperLink</asp:HyperLink></td>
            <td style="width: 324px;">
                Registered Donators:
                <asp:HyperLink ID="lnkTotdn" runat="server" NavigateUrl="~/Donators.aspx">HyperLink</asp:HyperLink></td>
        </tr>
        <tr>
            <td style="width: 153px;">
                Total Clinics:
                <asp:HyperLink ID="lnkTotc" runat="server" NavigateUrl="~/Clinics.aspx">HyperLink</asp:HyperLink></td>
            <td style="width: 324px;">
                Total Appointments:
                <asp:Label ID="lblTota" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 153px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
            <td style="width: 324px; border-bottom: scrollbar 1px solid; height: 15px">
            </td>
        </tr>
    </table><br />
    <table style="width: 752px">
        <tr>
            <td style="width: 100px; height: 15px; background-color: inactiveborder;">
                <strong>Profile (Admin)</strong></td>
        </tr>
    </table><table style="width: 752px; border-bottom-width: 1px; border-bottom-color: menu; height: 48px;" class="text">
        <tr>
            <td style="width: 170px">
            </td>
            <td style="width: 286px">
            </td>
        </tr>
        <tr>
            <td style="width: 170px">
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Upprof.aspx" Width="96px">Change Password</asp:HyperLink></td>
            <td style="width: 286px">
            </td>
        </tr>
        <tr>
            <td style="width: 170px; border-bottom: scrollbar 1px solid;">
            </td>
            <td style="width: 286px; border-bottom: scrollbar 1px solid;">
            </td>
        </tr>
    </table>
   </asp:Content>

