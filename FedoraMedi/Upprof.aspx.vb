Imports System.Data.SqlClient
Partial Class Upprof
    Inherits System.Web.UI.Page
    Dim core As New core
    Dim connection As New core.connection
    Dim perm As Integer
    Dim editid As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("editid") <> Nothing And core.getperm = 5 Then 'access of this page alters with admin
            editid = Request.QueryString("editid")
            perm = core.getpermbyid(Request.QueryString("editid"))
        Else
            editid = core.getmyses
            perm = core.getperm
        End If

        If Not IsPostBack Then
            If perm = 0 Then 'kick out! :P
                Response.Redirect("Default.aspx")
            ElseIf perm = 1 Then 'member
                Try
                    connection.Open()
                    Dim cmd As New SqlCommand("SELECT * FROM tblMember WHERE id=" & editid, connection.connection)
                    Dim read As SqlDataReader = cmd.ExecuteReader
                    While read.Read = True
                        txtNamem.Text = read.Item("name").ToString
                        txtAddressm.Text = read.Item("address").ToString
                        txtCitym.Text = read.Item("city").ToString
                        txtAgem.Text = read.Item("age").ToString
                        txtPhonem.Text = read.Item("phone").ToString
                        txtDetailsm.Text = read.Item("details").ToString
                        txtEmailm.Text = read.Item("email").ToString
                    End While
                    read.Close()
                    Dim cmd2 As New SqlCommand("SELECT * FROM tblLogin WHERE id=" & editid, connection.connection)
                    read = cmd2.ExecuteReader
                    While read.Read = True
                        txtUsernamem.Text = read.Item("username").ToString
                    End While
                    read.Close()
                Catch ex As Exception
                    TD2.Visible = True
                    lblError.Text = ex.Message
                Finally
                    connection.Close()
                End Try
            ElseIf perm = 2 Then 'doctor
                Try
                    connection.Open()
                    Dim cmd As New SqlCommand("SELECT * FROM tblDoctor WHERE id=" & editid, connection.connection)
                    Dim read As SqlDataReader = cmd.ExecuteReader
                    While read.Read = True
                        txtNamed.Text = read.Item("name").ToString
                        txtAddressd.Text = read.Item("address").ToString
                        txtCityd.Text = read.Item("city").ToString
                        txtAged.Text = read.Item("age").ToString
                        txtPhoned.Text = read.Item("phone").ToString
                        txtDetailsd.Text = read.Item("details").ToString
                        txtEmaild.Text = read.Item("email").ToString
                    End While
                    read.Close()
                    Dim cmd2 As New SqlCommand("SELECT * FROM tblLogin WHERE id=" & editid, connection.connection)
                    read = cmd2.ExecuteReader
                    While read.Read = True
                        txtUsernamed.Text = read.Item("username").ToString
                    End While
                    read.Close()
                Catch ex As Exception
                    TD2.Visible = True
                    lblError.Text = ex.Message
                Finally
                    connection.Close()
                End Try
            ElseIf perm = 3 Then 'hospital
                Try
                    connection.Open()
                    Dim cmd As New SqlCommand("SELECT * FROM tblHospital WHERE id=" & editid, connection.connection)
                    Dim read As SqlDataReader = cmd.ExecuteReader
                    While read.Read = True
                        txtNameh.Text = read.Item("name").ToString
                        txtAddressh.Text = read.Item("address").ToString
                        txtCityh.Text = read.Item("city").ToString
                        txtPhoneh.Text = read.Item("phone").ToString
                        txtDetailsh.Text = read.Item("details").ToString
                        txtEmailh.Text = read.Item("email").ToString
                    End While
                    read.Close()
                    Dim cmd2 As New SqlCommand("SELECT * FROM tblLogin WHERE id=" & editid, connection.connection)
                    read = cmd2.ExecuteReader
                    While read.Read = True
                        txtUsernameh.Text = read.Item("username").ToString
                    End While
                    read.Close()
                Catch ex As Exception
                    TD2.Visible = True
                    lblError.Text = ex.Message
                Finally
                    connection.Close()
                End Try
            ElseIf perm = 4 Then 'donator
                Try
                    connection.Open()
                    Dim cmd As New SqlCommand("SELECT * FROM tblDonator WHERE id=" & editid, connection.connection)
                    Dim read As SqlDataReader = cmd.ExecuteReader
                    While read.Read = True
                        txtNamedn.Text = read.Item("name").ToString
                        txtAddressdn.Text = read.Item("address").ToString
                        txtAgedn.Text = read.Item("age").ToString
                        txtBgroup.Text = read.Item("bgroup").ToString
                        txtPhonedn.Text = read.Item("phone").ToString
                        txtDetailsdn.Text = read.Item("details").ToString
                        txtEmaildn.Text = read.Item("email").ToString
                    End While
                    read.Close()
                    Dim cmd2 As New SqlCommand("SELECT * FROM tblLogin WHERE id=" & editid, connection.connection)
                    read = cmd2.ExecuteReader
                    While read.Read = True
                        txtUsernamedn.Text = read.Item("username").ToString
                    End While
                    read.Close()
                Catch ex As Exception
                    TD2.Visible = True
                    lblError.Text = ex.Message
                Finally
                    connection.Close()
                End Try
            End If
        End If
    End Sub

    Protected Sub btnUpdatem_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdatem.Click
        Dim ucount As Integer
        Dim photourl As String
        If upldPhotom.HasFile = True Then
            Dim upurl As String = Server.MapPath("~/uploads/" & upldPhotom.FileName)
            upldPhotom.SaveAs(upurl)
            photourl = ("~/uploads/" & upldPhotom.FileName)
        Else
            photourl = "~/images/nopic.jpg"
        End If
        Try
            connection.Open()
            Dim com As New SqlCommand("SELECT username FROM tblLogin WHERE id = " & editid, connection.connection)
            Dim username As String = com.ExecuteScalar
            If username <> txtUsernamem.Text Then
                Dim com2 As New SqlCommand("SELECT COUNT (*) FROM tblLogin WHERE username = '" & txtUsernamem.Text & "'", connection.connection)
                ucount = com2.ExecuteScalar
            End If
        Catch ex As Exception
            TD2.Visible = True
            lblError.Text = ex.Message
        Finally
            connection.Close()
        End Try

        If txtUsernamem.Text.Length < 4 Then
            valUsernamem.IsValid = False
        ElseIf ucount > 0 Then
            valUsernamem.ErrorMessage = "Username already exist"
            valUsernamem.IsValid = False
        ElseIf Trim(txtNamem.Text) = "" Then
            valNamem.IsValid = False
        ElseIf upldPhotom.HasFile = True And core.Checkfile(upldPhotom.FileName) = False Then
            valFilem.IsValid = False
        ElseIf Trim(txtAgem.Text) = "" Then
            valAgem.IsValid = False
        ElseIf Trim(txtAddressm.Text) = "" Then
            valAddressm.IsValid = False
        ElseIf Trim(txtEmailm.Text) = "" Then
            valEmailm.IsValid = False
        Else
            Try
                connection.Open()
                Dim cmd As New SqlCommand("UPDATE tblMember SET name='" & txtNamem.Text & "', address='" & txtAddressm.Text & "', city='" & txtCitym.Text & "', age='" & txtAgem.Text & "', photo='" & photourl & "', gender='" & ddlGenderm.Text & "', phone='" & txtPhonem.Text & "', details='" & txtDetailsm.Text & "', email='" & txtEmailm.Text & "' WHERE id=" & editid, connection.connection)
                cmd.ExecuteNonQuery()
                Dim cmd2 As New SqlCommand("UPDATE tblLogin SET username='" & txtUsernamem.Text & "' WHERE id=" & editid, connection.connection)
                cmd2.ExecuteNonQuery()

                If editid <> core.getmyses Then 'are u admin?
                    Response.Redirect("Members.aspx?action=upprof&sin=" & Request.QueryString("sin") & "&sfor=" & Request.QueryString("sfor") & "&mid=" & Request.QueryString("mid") & "&pagen=" & Request.QueryString("pagen"))
                Else
                    Response.Redirect("Portal.aspx?action=upprof")
                End If
            Catch ex As Exception
                TD2.Visible = True
                lblError.Text = ex.Message
            Finally
                connection.Close()
            End Try
        End If
    End Sub

    Protected Sub btnUpdated_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdated.Click
        Dim ucount As Integer
        Dim photourl As String
        If upldphotod.HasFile = True Then
            Dim upurl As String = Server.MapPath("~/uploads/" & upldphotod.FileName)
            upldphotod.SaveAs(upurl)
            photourl = ("~/uploads/" & upldphotod.FileName)
        Else
            photourl = "~/images/nopic.jpg"
        End If
        Try
            connection.Open()
            Dim com As New SqlCommand("SELECT username FROM tblLogin WHERE id = " & editid, connection.connection)
            Dim username As String = com.ExecuteScalar
            If username <> txtUsernamed.Text Then
                Dim com2 As New SqlCommand("SELECT COUNT (*) FROM tblLogin WHERE username = '" & txtUsernamed.Text & "'", connection.connection)
                ucount = com2.ExecuteScalar
            End If
        Catch ex As Exception
            TD2.Visible = True
            lblError.Text = ex.Message
        Finally
            connection.Close()
        End Try

        If txtUsernamed.Text.Length < 4 Then
            valUsernamed.IsValid = False
        ElseIf ucount > 0 Then
            valUsernamed.ErrorMessage = "Username already exist"
            valUsernamed.IsValid = False
        ElseIf Trim(txtNamed.Text) = "" Then
            valNamed.IsValid = False
        ElseIf upldphotod.HasFile = True And core.Checkfile(upldphotod.FileName) = False Then
            valFiled.IsValid = False
        ElseIf Trim(txtAged.Text) = "" Then
            valAged.IsValid = False
        ElseIf Trim(txtAddressd.Text) = "" Then
            valAddressd.IsValid = False
        ElseIf Trim(txtEmaild.Text) = "" Then
            valEmaild.IsValid = False
        Else
            Try
                connection.Open()
                Dim cmd As New SqlCommand("UPDATE tblDoctor SET name='" & txtNamed.Text & "', address='" & txtAddressd.Text & "', city='" & txtCityd.Text & "', age='" & txtAged.Text & "', photo='" & photourl & "', gender='" & ddlGenderd.Text & "', phone='" & txtPhoned.Text & "', details='" & txtDetailsd.Text & "', email='" & txtEmaild.Text & "' WHERE id=" & editid, connection.connection)
                cmd.ExecuteNonQuery()
                Dim cmd2 As New SqlCommand("UPDATE tblLogin SET username='" & txtUsernamed.Text & "' WHERE id=" & editid, connection.connection)
                cmd2.ExecuteNonQuery()
                If editid <> core.getmyses Then 'you are admin
                    Response.Redirect("Doctors.aspx?action=upprof&sin=" & Request.QueryString("sin") & "&sfor=" & Request.QueryString("sfor") & "&clid=" & Request.QueryString("clid") & "&hid=" & Request.QueryString("hid") & "&pagen=" & Request.QueryString("pagen"))
                Else
                    Response.Redirect("Portal.aspx?action=upprof")
                End If
            Catch ex As Exception
                TD2.Visible = True
                lblError.Text = ex.Message
            Finally
                connection.Close()
            End Try
        End If
    End Sub

    Protected Sub btnUpdateh_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateh.Click
        Dim ucount As Integer
        Dim photourl As String
        If upldPhotoh.HasFile = True Then
            Dim upurl As String = Server.MapPath("~/uploads/" & upldPhotoh.FileName)
            upldPhotoh.SaveAs(upurl)
            photourl = ("~/uploads/" & upldPhotoh.FileName)
        Else
            photourl = "~/images/nopic.jpg"
        End If
        Try
            connection.Open()
            Dim com As New SqlCommand("SELECT username FROM tblLogin WHERE id = " & editid, connection.connection)
            Dim username As String = com.ExecuteScalar
            If username <> txtUsernameh.Text Then
                Dim com2 As New SqlCommand("SELECT COUNT (*) FROM tblLogin WHERE username = '" & txtUsernameh.Text & "'", connection.connection)
                ucount = com2.ExecuteScalar
            End If
        Catch ex As Exception
            TD2.Visible = True
            lblError.Text = ex.Message
        Finally
            connection.Close()
        End Try

        If txtUsernameh.Text.Length < 4 Then
            valUsernameh.IsValid = False
        ElseIf ucount > 0 Then
            valUsernameh.ErrorMessage = "Username already exist"
            valUsernameh.IsValid = False
        ElseIf Trim(txtNameh.Text) = "" Then
            valNameh.IsValid = False
        ElseIf upldPhotoh.HasFile = True And core.Checkfile(upldPhotoh.FileName) = False Then
            valFileh.IsValid = False
        ElseIf Trim(txtAddressh.Text) = "" Then
            valAddressh.IsValid = False
        ElseIf Trim(txtEmailh.Text) = "" Then
            valEmailh.IsValid = False
        Else
            Try
                connection.Open()
                Dim cmd As New SqlCommand("UPDATE tblHospital SET name='" & txtNameh.Text & "', address='" & txtAddressh.Text & "', city='" & txtCityh.Text & "', logo='" & photourl & "', phone='" & txtPhoneh.Text & "', details='" & txtDetailsh.Text & "', email='" & txtEmailh.Text & "' WHERE id=" & editid, connection.connection)
                cmd.ExecuteNonQuery()
                Dim cmd2 As New SqlCommand("UPDATE tblLogin SET username='" & txtUsernameh.Text & "' WHERE id=" & editid, connection.connection)
                cmd2.ExecuteNonQuery()
                If editid <> core.getmyses Then 'you are admin
                    Response.Redirect("Hospitals.aspx?action=upprof&sin=" & Request.QueryString("sin") & "&sfor=" & Request.QueryString("sfor") & "&clid=" & Request.QueryString("clid") & "&did=" & Request.QueryString("did") & "&pagen=" & Request.QueryString("pagen"))
                Else
                    Response.Redirect("Portal.aspx?action=upprof")
                End If

            Catch ex As Exception
                TD2.Visible = True
                lblError.Text = ex.Message
            Finally
                connection.Close()
            End Try
        End If
    End Sub

    Protected Sub btnUpdatedn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdatedn.Click
        Dim ucount As Integer
        Dim photourl As String 
        If upldPhotodn.HasFile = True Then
            Dim upurl As String = Server.MapPath("~/uploads/" & upldPhotodn.FileName)
            upldPhotodn.SaveAs(upurl)
            photourl = ("~/uploads/" & upldPhotodn.FileName)
        Else
            photourl = "~/images/nopic.jpg"
        End If
        Try
            connection.Open()
            Dim com As New SqlCommand("SELECT username FROM tblLogin WHERE id = " & editid, connection.connection)
            Dim username As String = com.ExecuteScalar
            If username <> txtUsernamedn.Text Then
                Dim com2 As New SqlCommand("SELECT COUNT (*) FROM tblLogin WHERE username = '" & txtUsernamedn.Text & "'", connection.connection)
                ucount = com2.ExecuteScalar
            End If
        Catch ex As Exception
            TD2.Visible = True
            lblError.Text = ex.Message
        Finally
            connection.Close()
        End Try

        If txtUsernamedn.Text.Length < 4 Then
            valUsernamedn.IsValid = False
        ElseIf ucount > 0 Then
            valUsernamedn.ErrorMessage = "Username already exist"
            valUsernamedn.IsValid = False
        ElseIf Trim(txtNamedn.Text) = "" Then
            valNamedn.IsValid = False
        ElseIf upldPhotodn.HasFile = True And core.Checkfile(upldPhotodn.FileName) = False Then
            valFiledn.IsValid = False
        ElseIf Trim(txtAgedn.Text) = "" Then
            valAgedn.IsValid = False
        ElseIf Trim(txtAddressdn.Text) = "" Then
            valAddressdn.IsValid = False
        ElseIf Trim(txtEmaildn.Text) = "" Then
            valEmaildn.IsValid = False
        Else
            Try
                connection.Open()
                Dim cmd As New SqlCommand("UPDATE tblDonator SET name='" & txtNamedn.Text & "', address='" & txtAddressdn.Text & "', bgroup='" & txtBgroup.Text & "', donation='" & rblDonation.SelectedItem.Text & "', age='" & txtAgedn.Text & "', photo='" & photourl & "', gender='" & ddlGenderdn.Text & "', phone='" & txtPhonedn.Text & "', details='" & txtDetailsdn.Text & "', email='" & txtEmaildn.Text & "' WHERE id=" & editid, connection.connection)
                cmd.ExecuteNonQuery()
                Dim cmd2 As New SqlCommand("UPDATE tblLogin SET username='" & txtUsernamedn.Text & "' WHERE id=" & editid, connection.connection)
                cmd2.ExecuteNonQuery()
                If editid <> core.getmyses Then 'you are admin
                    Response.Redirect("Donators.aspx?action=upprof&sin=" & Request.QueryString("sin") & "&sfor=" & Request.QueryString("sfor") & "&pagen=" & Request.QueryString("pagen"))
                Else
                    Response.Redirect("Portal.aspx?action=upprof")
                End If

            Catch ex As Exception
                TD2.Visible = True
                lblError.Text = ex.Message
            Finally
                connection.Close()
            End Try
        End If
    End Sub

    Protected Sub btnUppw_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUppw.Click
        Dim count As String = 0
        Try
            connection.Open()
            Dim com As New SqlCommand("SELECT COUNT(*) FROM tblLogin WHERE password='" & core.getmd5(txtPw.Text) & "' AND id = " & editid, connection.connection)
            count = com.ExecuteScalar
        Catch ex As Exception
            TD2.Visible = True
            lblError.Text = ex.Message
        Finally
            connection.Close()
        End Try

        If Trim(txtPw.Text) = "" Then
            valPw.IsValid = False
        ElseIf count = 0 Then
            valPw.ErrorMessage = "Invalid current password"
            valPw.IsValid = False
        ElseIf Trim(txtNpw.Text).Length < 4 Then
            valNpw.IsValid = False
        Else
            Try
                connection.Open()
                Dim cmd As New SqlCommand("UPDATE tblLogin SET password='" & core.getmd5(txtNpw.Text) & "' WHERE id=" & editid, connection.connection)
                cmd.ExecuteNonQuery()
                Response.Redirect("Portal.aspx?action=upprof")
            Catch ex As Exception
                TD2.Visible = True
                lblError.Text = ex.Message
            Finally
                connection.Close()
            End Try
        End If 
    End Sub

    Protected Sub btnPwadmin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPwadmin.Click
        If Trim(txtAdminpw.Text).Length < 4 Then
            cvalPw.IsValid = False
        Else
            Try
                connection.Open()
                Dim cmd As New SqlCommand("UPDATE tblLogin SET password='" & core.getmd5(txtAdminpw.Text) & "' WHERE id=" & editid, connection.connection)
                cmd.ExecuteNonQuery()
                If perm = 1 Then
                    Response.Redirect("Members.aspx?action=upprof&sin=" & Request.QueryString("sin") & "&sfor=" & Request.QueryString("sfor") & "&mid=" & Request.QueryString("mid") & "&pagen=" & Request.QueryString("pagen"))
                ElseIf perm = 2 Then
                    Response.Redirect("Doctors.aspx?action=upprof&sin=" & Request.QueryString("sin") & "&sfor=" & Request.QueryString("sfor") & "&clid=" & Request.QueryString("clid") & "&hid=" & Request.QueryString("hid") & "&pagen=" & Request.QueryString("pagen"))
                ElseIf perm = 3 Then
                    Response.Redirect("Hospitals.aspx?action=upprof&sin=" & Request.QueryString("sin") & "&sfor=" & Request.QueryString("sfor") & "&clid=" & Request.QueryString("clid") & "&did=" & Request.QueryString("did") & "&pagen=" & Request.QueryString("pagen"))
                ElseIf perm = 4 Then
                    Response.Redirect("Donators.aspx?action=upprof&sin=" & Request.QueryString("sin") & "&sfor=" & Request.QueryString("sfor") & "&pagen=" & Request.QueryString("pagen"))
                End If
            Catch ex As Exception
                TD2.Visible = True
                lblError.Text = ex.Message
            Finally
                connection.Close()
            End Try
        End If
    End Sub
End Class
