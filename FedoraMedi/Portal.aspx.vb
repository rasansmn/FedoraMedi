Imports System.Data.SqlClient

Partial Class Portal
    Inherits System.Web.UI.Page
    Dim core As New core
    Dim connection As New core.connection

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            TD1.Visible = False
            TD2.Visible = False
        End If
        'action perform by user
        If Request.QueryString("action") = "accapp" Then ' :-)
            Try
                connection.Open()
                Dim cmdin As New SqlCommand("UPDATE tblAppointment SET approved='Yes' WHERE id=" & Request.QueryString("appid"), connection.connection)
                cmdin.ExecuteNonQuery()
                core.sendmail(core.getrequestermail(Request.QueryString("appid")), "Your appointment request for clinic has been accepted")
                TD1.Visible = True
                lblAct.Text = "Appointment request accepted successfully"
            Catch ex As Exception
                TD2.Visible = True
                lblError.Text = ex.Message
            Finally
                connection.Close()
            End Try
        ElseIf Request.QueryString("action") = "delapp" Then
            Try
                connection.Open()
                Dim cmdx As New SqlCommand("DELETE FROM tblAppointment WHERE id=" & Request.QueryString("appid"), connection.connection)
                cmdx.ExecuteNonQuery()
                TD1.Visible = True
                lblAct.Text = "Appointment deleted successfully"
            Catch ex As Exception
                TD2.Visible = True
                lblError.Text = ex.Message
            Finally
                connection.Close()
            End Try
        ElseIf Request.QueryString("action") = "delcl" Then
            Try
                connection.Open()
                Dim cmdx As New SqlCommand("DELETE FROM tblClinic WHERE id=" & Request.QueryString("clid") & " AND crid=" & core.getmyses, connection.connection)
                cmdx.ExecuteNonQuery()
                TD1.Visible = True
                lblAct.Text = "Clinic cancelled successfully"
            Catch ex As Exception
                TD2.Visible = True
                lblError.Text = ex.Message
            Finally
                connection.Close()
            End Try
        ElseIf Request.QueryString("action") = "rejapp" Then ' :-( 
            Try
                connection.Open()
                Dim cmdin As New SqlCommand("UPDATE tblAppointment SET approved='Rejected' WHERE id=" & Request.QueryString("appid"), connection.connection)
                cmdin.ExecuteNonQuery()
                core.sendmail(core.getrequestermail(Request.QueryString("appid")), "Your appointment request for clinic has been rejected")
                TD1.Visible = True
                lblAct.Text = "Appointment request rejected"
            Catch ex As Exception
                TD2.Visible = True
                lblError.Text = ex.Message
            Finally
                connection.Close()
            End Try
        ElseIf Request.QueryString("action") = "addcl" Then
            TD1.Visible = True
            lblAct.Text = "Clinic Added Successfully"
        ElseIf Request.QueryString("action") = "upprof" Then
            TD1.Visible = True
            lblAct.Text = "Profile Updated Successfully"
        ElseIf Request.QueryString("action") = "register" Then 'reffered from registration?
            TD1.Visible = True
            lblAct.Text = "Registration Completed Successfully"
        End If

        'data binding for all repeaters
        Try
            Dim adapter As New SqlDataAdapter("SELECT a.id, a.approved, a.clinic_id, a.mem_id, c.name, c.time FROM tblAppointment a, tblClinic c WHERE a.clinic_id=c.id AND a.mem_id=" & core.getmyses, connection.connection)
            Dim dsItem As New Data.DataSet
            adapter.Fill(dsItem, "tblApp")
            Repeater1.DataSource = dsItem
            Repeater1.DataBind()

            Dim adapter2 As New SqlDataAdapter("SELECT a.id, a.approved, a.clinic_id, a.mem_id, c.name, c.time FROM tblAppointment a, tblClinic c WHERE a.clinic_id=c.id AND c.crid=" & core.getmyses, connection.connection)
            Dim dsItem2 As New Data.DataSet
            adapter2.Fill(dsItem2, "tblApp")
            Repeater2.DataSource = dsItem2
            Repeater2.DataBind()

            Dim adapter3 As New SqlDataAdapter("SELECT * from tblClinic WHERE crid=" & core.getmyses, connection.connection)
            Dim dsItem3 As New Data.DataSet
            adapter3.Fill(dsItem3, "tblClinic")
            Repeater3.DataSource = dsItem3
            Repeater3.DataBind()

            Dim adapter4 As New SqlDataAdapter("SELECT a.id, a.approved, a.clinic_id, a.mem_id, c.name, c.time FROM tblAppointment a, tblClinic c WHERE a.clinic_id=c.id AND c.crid=" & core.getmyses, connection.connection)
            Dim dsItem4 As New Data.DataSet
            adapter4.Fill(dsItem4, "tblClinic")
            Repeater4.DataSource = dsItem4
            Repeater4.DataBind()

            Dim adapter5 As New SqlDataAdapter("SELECT * from tblClinic WHERE crid=" & core.getmyses, connection.connection)
            Dim dsItem5 As New Data.DataSet
            adapter5.Fill(dsItem5, "tblClinic")
            Repeater5.DataSource = dsItem5
            Repeater5.DataBind()

            'showing my profile
            connection.Open()
            Dim cmd As New SqlCommand("SELECT * FROM tblMember WHERE id=" & core.getmyses, connection.connection)
            Dim read As SqlDataReader = cmd.ExecuteReader
            While read.Read = True
                imgMember.ImageUrl = read.Item("photo").ToString
                lblName.Text = read.Item("name").ToString
                lblAddress.Text = read.Item("address").ToString
                lblCity.Text = read.Item("city").ToString
                lblPhone.Text = read.Item("phone").ToString
                lblDetails.Text = read.Item("details").ToString
                lblGender.Text = read.Item("gender").ToString
                lblAge.Text = read.Item("age").ToString
                lblEmail.Text = read.Item("email").ToString
                lblLastactive.Text = read.Item("lastactive").ToString
            End While
            read.Close()

            Dim cmd2 As New SqlCommand("SELECT * FROM tblDoctor WHERE id=" & core.getmyses, connection.connection)
            read = cmd2.ExecuteReader
            While read.Read = True
                imgDoctor.ImageUrl = read.Item("photo").ToString
                lblName2.Text = read.Item("name").ToString
                lbladdress2.Text = read.Item("address").ToString
                lblCity2.Text = read.Item("city").ToString
                lblPhone2.Text = read.Item("phone").ToString
                lblDetails2.Text = read.Item("details").ToString
                lblGender2.Text = read.Item("gender").ToString
                lblAge2.Text = read.Item("age").ToString
                lblEmail2.Text = read.Item("email").ToString
                lblLastactive2.Text = read.Item("lastactive").ToString
            End While
            read.Close()

            Dim cmd3 As New SqlCommand("SELECT * FROM tblHospital WHERE id=" & core.getmyses, connection.connection)
            read = cmd3.ExecuteReader
            While read.Read = True
                imgHospital.ImageUrl = read.Item("logo").ToString
                lblName3.Text = read.Item("name").ToString
                lblAddress3.Text = read.Item("address").ToString
                lblCity3.Text = read.Item("city").ToString
                lblPhone3.Text = read.Item("phone").ToString
                lblDetails3.Text = read.Item("details").ToString
                lblEmail3.Text = read.Item("email").ToString
                lblLastactive3.Text = read.Item("lastactive").ToString
            End While
            read.Close()

            Dim cmd4 As New SqlCommand("SELECT * FROM tblDonator WHERE id=" & core.getmyses, connection.connection)
            read = cmd4.ExecuteReader
            While read.Read = True
                imgDonator.ImageUrl = read.Item("photo").ToString
                lblName4.Text = read.Item("name").ToString
                lblAddress4.Text = read.Item("address").ToString
                lblGender4.Text = read.Item("gender").ToString
                lblAge4.Text = read.Item("age").ToString
                lblPhone4.Text = read.Item("phone").ToString
                lblDetails4.Text = read.Item("details").ToString
                lblDonation.Text = read.Item("donation").ToString
                lblBgroup.Text = read.Item("bgroup").ToString
                lblEmail4.Text = read.Item("email").ToString
                lblLastactive4.Text = read.Item("lastactive").ToString
            End While
            read.Close()
            'statistics for admin
            Dim cmd5 As New SqlCommand("SELECT COUNT(*) FROM tblMember", connection.connection)
            lnkTotm.Text = cmd5.ExecuteScalar.ToString
            Dim cmd6 As New SqlCommand("SELECT COUNT(*) FROM tblDoctor", connection.connection)
            lnkTotd.Text = cmd6.ExecuteScalar.ToString
            Dim cmd7 As New SqlCommand("SELECT COUNT(*) FROM tblHospital", connection.connection)
            lnkToth.Text = cmd7.ExecuteScalar.ToString
            Dim cmd8 As New SqlCommand("SELECT COUNT(*) FROM tblDonator", connection.connection)
            lnkTotdn.Text = cmd8.ExecuteScalar.ToString
            Dim cmd9 As New SqlCommand("SELECT COUNT(*) FROM tblClinic", connection.connection)
            lnkTotc.Text = cmd9.ExecuteScalar.ToString
            Dim cmd10 As New SqlCommand("SELECT COUNT(*) FROM tblAppointment", connection.connection)
            lblTota.Text = cmd10.ExecuteScalar.ToString
        Catch ex As Exception
            TD2.Visible = True
            lblError.Text = ex.Message
        Finally
            connection.Close()
        End Try
        lblWelcome.Text = core.getnamebyid(core.getmyses)

        'if there nothing to show
        If Repeater1.Items.Count = 0 Then
            tblRp1.Visible = True
        End If
        If Repeater2.Items.Count = 0 Then
            tblRp2.Visible = True
        End If
        If Repeater3.Items.Count = 0 Then
            tblRp3.Visible = True
        End If
        If Repeater4.Items.Count = 0 Then
            tblRp4.Visible = True
        End If
        If Repeater5.Items.Count = 0 Then
            tblRp5.Visible = True
        End If
    End Sub

    Protected Sub btnAddclinic_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddclinic.Click
        Dim price As String
        If Val(txtRs.Text) = 0 Then
            price = "Free"
        Else
            price = txtRs.Text
        End If
        If validated(core.getmyses) = True Then
            Try
                connection.Open()
                Dim newclid As Integer = core.getnewid("tblClinic")
                Dim cmdin As New SqlCommand("INSERT INTO tblClinic VALUES (" & newclid & ",'" & txtName.Text & "','" & txtLocation.Text & "','" & txtTime.Text & "','" & txtDetails.Text & "'," & Val(txtApp.Text) & ",'" & price & "','Doctor'," & core.getmyses & ")", connection.connection)
                cmdin.ExecuteNonQuery()
                Dim cmdin2 As New SqlCommand("INSERT INTO tblAffclinic VALUES (" & core.getnewid("tblAffclinic") & "," & newclid & "," & core.getmyses & ")", connection.connection)
                cmdin2.ExecuteNonQuery()
                Response.Redirect("Portal.aspx?action=addcl")
            Catch ex As Exception
                TD2.Visible = True
                lblError.Text = ex.Message
            Finally
                connection.Close()
            End Try
        Else
            TD2.Visible = True
            lblError.Text = "Please wait until an admin validates your account"
        End If
       
    End Sub

    Protected Sub btnAddclinic2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddclinic2.Click
        Dim price As String
        If Val(txtRs2.Text) = 0 Then
            price = "Free"
        Else
            price = txtRs2.Text
        End If
        If validated(core.getmyses) = True Then
            Try
                connection.Open()
                Dim cmdin As New SqlCommand("INSERT INTO tblClinic VALUES (" & core.getnewid("tblClinic") & ",'" & txtName2.Text & "','" & txtLocation2.Text & "','" & txtTime2.Text & "','" & txtDetails2.Text & "'," & Val(txtApp2.Text) & ",'" & price & "','Hospital'," & core.getmyses & ")", connection.connection)
                cmdin.ExecuteNonQuery()
                Response.Redirect("Portal.aspx?action=addcl")
            Catch ex As Exception
                TD2.Visible = True
                lblError.Text = ex.Message
            Finally
                connection.Close()
            End Try
        Else
            TD2.Visible = True
            lblError.Text = "Please wait until an admin validates your account"
        End If
    End Sub

    Public Function getenable(ByVal status As String) As Boolean ' can't accept it twice
        If status = "Yes" Then
            Return False
        End If
        Return True
    End Function

    Public Function getapps(ByVal clid As Integer) As Integer
        Try
            connection.Open()
            Dim cmd As New SqlCommand("SELECT COUNT(*) FROM tblAppointment WHERE clinic_id=" & clid, connection.connection)
            Return cmd.ExecuteScalar
        Catch ex As Exception
        Finally
            connection.Close()
        End Try
        Return 0
    End Function

    Public Function getmname(ByVal id As Integer) As String
        Try
            connection.Open()
            Dim cmd As New SqlCommand("SELECT name FROM tblMember WHERE id=" & id, connection.connection)
            Return cmd.ExecuteScalar.ToString
        Catch ex As Exception
        Finally
            connection.Close()
        End Try
        Return ""
    End Function

    Public Function getpaymentid(ByVal appid As Integer) As String
        Dim paymentid As String = ""
        Try
            connection.Open()
            Dim cmd As New SqlCommand("SELECT id FROM tblPayment WHERE app_id=" & appid, connection.connection)
            paymentid = cmd.ExecuteScalar
        Catch ex As Exception
        Finally
            connection.Close()
        End Try
        If paymentid Is Nothing Then
            Return ""
        Else
            Return "Payment ID: " & paymentid
        End If
    End Function

    Public Function getpaymentmethod(ByVal appid As Integer) As String
        Dim method As String = ""
        Try
            connection.Open()
            Dim cmd As New SqlCommand("SELECT method FROM tblPayment WHERE app_id=" & appid, connection.connection)
            method = cmd.ExecuteScalar.ToString
        Catch ex As Exception
        Finally
            connection.Close()
        End Try
        If method Is Nothing Then
            Return ""
        Else
            Return "Method: " & method
        End If
    End Function

    Public Function validated(ByVal id As Integer) As Boolean
        Dim cmd As New SqlCommand
        cmd.Connection = connection.connection
        Try
            connection.Open()
            If core.getpermbyid(id) = 2 Then
                cmd.CommandText = "SELECT isvalid FROM tblDoctor WHERE id=" & id
            ElseIf core.getpermbyid(id) = 3 Then
                cmd.CommandText = "SELECT isvalid FROM tblHospital WHERE id=" & id
            End If
            Return cmd.ExecuteScalar = 1
        Catch ex As Exception
        Finally
            connection.Close()
        End Try
        Return False
    End Function
End Class
