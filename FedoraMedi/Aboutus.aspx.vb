
Partial Class Aboutus
    Inherits System.Web.UI.Page
    Dim core As New core

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Request.Cookies("uid") Is Nothing Then
            core.setlogged(Request.Cookies("uid").Value)
        End If
    End Sub

End Class
