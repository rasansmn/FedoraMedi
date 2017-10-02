
Partial Class _Default
    Inherits System.Web.UI.Page
    Dim core As New core

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Request.Cookies("uid") Is Nothing Then
            core.setlogged(Request.Cookies("uid").Value)
        End If

        If Request.QueryString("action") = "logout" Then 'good bye!!!
            core.logout()
            Response.Cookies("uid").Expires = DateTime.Now.AddDays(-1)
            TD1.Visible = True
            lblAct.Text = "You have logged out successfully"
        ElseIf core.getmyses > 0 Then
            Response.Redirect("Portal.aspx")
        End If


    End Sub

    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogin.Click
        If core.login(txtUsername.Text, txtPw.Text) = False Then
            lblLogin.Text = "Invalid Login, please check your username and password"
        Else
            If chkRemember.Checked = True Then 'remember me
                Response.Cookies("uid").Value = core.getmyses
                Response.Cookies("uid").Expires = DateTime.Now.AddDays(7)
            End If
            Response.Redirect("Portal.aspx")
        End If
    End Sub
End Class
