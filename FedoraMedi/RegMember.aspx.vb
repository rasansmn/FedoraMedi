Imports System.Data.SqlClient
Partial Class RegMember
    Inherits System.Web.UI.Page
    Dim core As New core
    Dim connection As New core.connection

    Protected Sub btnRegister_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRegister.Click
        Dim photourl As String
        Dim ucount As Integer
        Try
            connection.Open()
            Dim com As New SqlCommand("SELECT COUNT (*) FROM tblLogin WHERE username = '" + txtUsername.Text + "'", connection.connection)
            ucount = com.ExecuteScalar
        Catch ex As Exception
            TD2.Visible = True
            lblError.Text = ex.Message
        Finally
            connection.Close()
        End Try
        If upldPhoto.HasFile = True Then
            Dim upurl As String = Server.MapPath("~/uploads/" & upldPhoto.FileName)
            upldPhoto.SaveAs(upurl)
            photourl = ("~/uploads/" & upldPhoto.FileName)
        Else
            photourl = "~/images/nopic.jpg"
        End If
        If txtUsername.Text.Length < 4 Then
            valUsername.IsValid = False
        ElseIf ucount > 0 Then
            valUsername.ErrorMessage = "Username already exist"
            valUsername.IsValid = False
        ElseIf txtPw.Text.Length < 4 Then
            valPw.IsValid = False
        ElseIf upldPhoto.HasFile = True And core.Checkfile(upldPhoto.FileName) = False Then 'aginst shell uploading :P
            valFile.IsValid = False
        Else
            Try
                connection.Open()
                Dim loginid As Integer = core.getnewid("tblLogin")
                Dim cmdin As New SqlCommand("INSERT INTO tblLogin VALUES (" & loginid & ",'" & txtUsername.Text & "','" & core.getmd5(txtPw.Text) & "'," & 1 & ")", connection.connection)
                cmdin.ExecuteNonQuery()
                Dim cmdin2 As New SqlCommand("INSERT INTO tblMember VALUES (" & loginid & ",'" & txtName.Text & "','" & ddlGender.Text & "','" & photourl & "','" & txtAge.Text & "','" & txtAddress.Text & "','" & txtCity.Text & "','" & txtPhone.Text & "','" & txtEmail.Text & "','" & txtDetails.Text & "','" & Now.Date & "','" & Now.Date & "'," & loginid & ")", connection.connection)
                cmdin2.ExecuteNonQuery()
                core.setlogged(loginid)
                Response.Redirect("Portal.aspx?action=register")
            Catch ex As Exception
                TD2.Visible = True
                lblError.Text = ex.Message
            Finally
                connection.Close()
            End Try
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("ref") = "request" Then 'kick out by clinics page? :P
            TD1.Visible = True
            lblAct.Text = "You must register or login to do this action"
        End If
    End Sub
End Class
