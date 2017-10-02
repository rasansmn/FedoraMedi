
Partial Class MasterMembers
    Inherits System.Web.UI.MasterPage
    Dim core As New core

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Request.Cookies("uid") Is Nothing Then
            core.setlogged(Request.Cookies("uid").Value)
        End If
        If core.getperm = 0 Then
            Response.Redirect("~/Default.aspx")
        ElseIf core.getperm = 1 Then
            ContentPlaceHolder2.Visible = True
        ElseIf core.getperm = 2 Then
            ContentPlaceHolder2.Visible = True
        ElseIf core.getperm = 3 Then
            ContentPlaceHolder2.Visible = True
        ElseIf core.getperm = 4 Then
            ContentPlaceHolder2.Visible = True
        ElseIf core.getperm = 5 Then
            ContentPlaceHolder3.Visible = True
        End If
    End Sub
End Class

