Imports System.Data.SqlClient

Partial Class Members
    Inherits System.Web.UI.Page
    Dim core As New core
    Dim connection As New core.connection
    Dim query, querycount As String
    Dim numitems, limitstart, pagen, numpages As Integer
    Dim itemsperpage As Integer = 3

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            TD1.Visible = False
            TD2.Visible = False
        End If
        If Request.QueryString("action") = "delm" And core.getperm = 5 Then 'only for admins
            Try
                connection.Open()
                Dim cmd As New SqlCommand("DELETE FROM tblMember WHERE id=" & Request.QueryString("mid"), connection.connection)
                cmd.ExecuteNonQuery()
                Dim cmd2 As New SqlCommand("DELETE FROM tblLogin WHERE id=" & Request.QueryString("mid"), connection.connection)
                cmd2.ExecuteNonQuery()
                TD1.Visible = True
                lblAct.Text = "Member Deleted Successfully"
            Catch ex As Exception
                TD2.Visible = True
                lblError.Text = ex.Message
            Finally
                connection.Close()
            End Try
        ElseIf Request.QueryString("action") = "upprof" Then 'update by admin?
            TD1.Visible = True
            lblAct.Text = "Profile Updated Successfully"
        End If
        pagen = Val(Request.QueryString("pagen")) 'page number?
        If pagen < 1 Then
            pagen = 1
        End If
        'prepare the query for requested page
        querycount = "SELECT * FROM tblMember"
        numpages = core.getnumpages(querycount, itemsperpage)
        If pagen > numpages And numpages <> 0 Then
            pagen = numpages
        End If
        limitstart = (pagen - 1) * itemsperpage
        query = "SELECT TOP " & itemsperpage & " * FROM tblMember WHERE id NOT IN (SELECT TOP " & limitstart & " id FROM tblMember)"

        If Request.QueryString("mid") <> Nothing Then
            querycount = "SELECT * FROM tblMember WHERE id=" & Request.QueryString("mid")
            numpages = core.getnumpages(querycount, itemsperpage)
            If pagen > numpages And numpages <> 0 Then
                pagen = numpages
            End If
            limitstart = (pagen - 1) * itemsperpage
            query = "SELECT TOP " & itemsperpage & " * FROM tblMember WHERE id=" & Request.QueryString("mid") & " AND id NOT IN (SELECT TOP " & limitstart & " id FROM tblMember WHERE id=" & Request.QueryString("mid") & ")"
            lblRef.Text = "- Of Appointment"
        ElseIf Request.QueryString("sin") <> "" And Request.QueryString("sfor") <> "" Then
            querycount = "SELECT * FROM tblMember WHERE " & Request.QueryString("sin") & " LIKE '%" & Request.QueryString("sfor") & "%'"
            numpages = core.getnumpages(querycount, itemsperpage)
            If pagen > numpages And numpages <> 0 Then
                pagen = numpages
            End If
            limitstart = (pagen - 1) * itemsperpage
            query = "SELECT TOP " & itemsperpage & " * FROM tblMember WHERE " & Request.QueryString("sin") & " LIKE '%" & Request.QueryString("sfor") & "%' AND id NOT IN (SELECT TOP " & limitstart & " id FROM tblMember WHERE " & Request.QueryString("sin") & " LIKE '%" & Request.QueryString("sfor") & "%' )"
            lblRef.Text = "- Search (" & Request.QueryString("sfor") & ")"
        End If
        'navigation buttons
        lblPagen.Text = pagen
        lblNumpages.Text = numpages
        lblPagen2.Text = pagen
        lblNumpages2.Text = numpages
        If pagen < numpages Then
            btnNext.Enabled = True
            btnNext2.Enabled = True
        End If
        If pagen > 1 Then
            btnPrev.Enabled = True
            btnPrev2.Enabled = True
        End If
        showitems(query) 'show members
    End Sub

    Sub showitems(ByVal query As String)
        Try
            Dim adapter As New SqlDataAdapter(query, connection.connection)
            Dim dsItem As New Data.DataSet
            adapter.Fill(dsItem, "tblMember")
            Repeater1.DataSource = dsItem
            Repeater1.DataBind()
            If Repeater1.Items.Count = 0 Then
                tblRp1.Visible = True
                tblNavi.Visible = False
            End If
            Repeater2.DataSource = dsItem
            Repeater2.DataBind()
            If Repeater2.Items.Count = 0 Then
                tblRp2.Visible = True
                tblNavi2.Visible = False
            End If
        Catch ex As Exception
            TD2.Visible = True
            lblError.Text = ex.Message
        Finally
            connection.Close()
        End Try
    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        Response.Redirect("Members.aspx?sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text)
    End Sub

    Protected Sub btnNext_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNext.Click
        Response.Redirect("Members.aspx?pagen=" & pagen + 1 & "&sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text & "&mid=" & Request.QueryString("mid"))
    End Sub

    Protected Sub btnPrev_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrev.Click
        Response.Redirect("Members.aspx?pagen=" & pagen - 1 & "&sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text & "&mid=" & Request.QueryString("mid"))
    End Sub

    Protected Sub btnNext2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNext2.Click
        Response.Redirect("Members.aspx?pagen=" & pagen + 1 & "&sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text & "&mid=" & Request.QueryString("mid"))
    End Sub

    Protected Sub btnPrev2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrev2.Click
        Response.Redirect("Members.aspx?pagen=" & pagen - 1 & "&sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text & "&mid=" & Request.QueryString("mid"))
    End Sub

    Public Function urlextend() As String 'avoid miss the reffered page
        Return "&sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text & "&mid=" & Request.QueryString("mid") & "&pagen=" & pagen
    End Function
End Class
