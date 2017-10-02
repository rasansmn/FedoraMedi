
Partial Class MasterUpprof
    Inherits System.Web.UI.MasterPage
    Dim core As New core
    Dim perm As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Request.Cookies("uid") Is Nothing Then
            core.setlogged(Request.Cookies("uid").Value)
        End If
        If Request.QueryString("editid") <> Nothing And core.getperm = 5 Then
            perm = core.getpermbyid(Request.QueryString("editid"))
            ContentPlaceHolder6.Visible = False
            ContentPlaceHolder7.Visible = True
        Else
            perm = core.getperm
        End If
        If perm = 0 Then
            Response.Redirect("Default.aspx")
        ElseIf perm = 1 Then
            ContentPlaceHolder2.Visible = True
        ElseIf perm = 2 Then
            ContentPlaceHolder3.Visible = True
        ElseIf perm = 3 Then
            ContentPlaceHolder4.Visible = True
        ElseIf perm = 4 Then
            ContentPlaceHolder5.Visible = True
        End If
    End Sub
End Class

