
Partial Class MasterReg
    Inherits System.Web.UI.MasterPage
    Dim core As New core
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Request.Cookies("uid") Is Nothing Then
            core.setlogged(Request.Cookies("uid").Value)
        End If
        If core.getmyses > 0 Then
            Response.Redirect("Portal.aspx")
        End If
    End Sub

    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogin.Click
        If core.login(txtUsername.Text, txtPw.Text) = False Then
            lblLogin.Text = "Invalid Login, please check your username and password"
        Else
            If chkRemember.Checked = True Then
                Response.Cookies("uid").Value = core.getmyses
                Response.Cookies("uid").Expires = DateTime.Now.AddDays(7)
            End If
            Response.Redirect("Portal.aspx")
        End If
    End Sub
End Class

