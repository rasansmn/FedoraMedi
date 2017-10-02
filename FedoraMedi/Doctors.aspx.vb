Imports System.Data.SqlClient
Partial Class Doctors
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
        'actions perform by user
        If Request.QueryString("action") = "deld" And core.getperm = 5 Then 'only for admin
            Try
                connection.Open()
                Dim cmd As New SqlCommand("DELETE FROM tblDoctor WHERE id=" & Request.QueryString("did"), connection.connection)
                cmd.ExecuteNonQuery()
                Dim cmd2 As New SqlCommand("DELETE FROM tblLogin WHERE id=" & Request.QueryString("did"), connection.connection)
                cmd2.ExecuteNonQuery()
                'cascade delete disabled on sql
                Dim cmd3 As New SqlCommand("DELETE FROM tblClinic WHERE crid=" & Request.QueryString("did"), connection.connection)
                cmd3.ExecuteNonQuery()
                TD1.Visible = True
                lblAct.Text = "Doctor Deleted Successfully"
            Catch ex As Exception
                TD2.Visible = True
                lblError.Text = ex.Message
            Finally
                connection.Close()
            End Try
        ElseIf Request.QueryString("action") = "val" And core.getperm = 5 Then
            Try
                connection.Open()
                Dim cmd As New SqlCommand("UPDATE tblDoctor SET isvalid=1 WHERE id=" & Request.QueryString("did"), connection.connection)
                cmd.ExecuteNonQuery()
                TD1.Visible = True
                lblAct.Text = "Doctor Validated Successfully"
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
        querycount = "SELECT * FROM tblDoctor"
        numpages = core.getnumpages(querycount, itemsperpage)
        If pagen > numpages And numpages <> 0 Then
            pagen = numpages
        End If
        limitstart = (pagen - 1) * itemsperpage
        query = "SELECT TOP " & itemsperpage & " * FROM tblDoctor WHERE id NOT IN (SELECT TOP " & limitstart & " id FROM tblDoctor)"

        If Request.QueryString("hid") <> "" Then
            querycount = "SELECT d.id, d.name, d.gender, d.photo, d.age, d.address, d.city, d.phone, d.email, d.details, d.joined, d.lastactive, d.log_id FROM tblDoctor d, tblAffhospital a WHERE d.id=a.doc_id AND a.hospital_id=" & Request.QueryString("hid")
            numpages = core.getnumpages(querycount, itemsperpage)
            If pagen > numpages And numpages <> 0 Then
                pagen = numpages
            End If
            limitstart = (pagen - 1) * itemsperpage
            query = "SELECT TOP " & itemsperpage & " d.id, d.name, d.gender, d.photo, d.age, d.address, d.city, d.phone, d.email, d.details, d.joined, d.lastactive, d.log_id FROM tblDoctor d, tblAffhospital a WHERE d.id=a.doc_id AND a.hospital_id=" & Request.QueryString("hid") & " AND d.id NOT IN (SELECT TOP " & limitstart & " d.id FROM tblDoctor d, tblAffhospital a WHERE d.id=a.doc_id AND a.hospital_id=" & Request.QueryString("hid") & ")"
            lblRef.Text = "- " & core.getnamebyid(Request.QueryString("hid"))
        ElseIf Request.QueryString("clid") <> "" Then
            querycount = "SELECT d.id, d.name, d.gender, d.photo, d.age, d.address, d.city, d.phone, d.email, d.details, d.joined, d.lastactive, d.log_id FROM tblDoctor d, tblAffclinic a WHERE d.id=a.doc_id AND a.clinic_id=" & Request.QueryString("clid")
            numpages = core.getnumpages(querycount, itemsperpage)
            If pagen > numpages And numpages <> 0 Then
                pagen = numpages
            End If
            limitstart = (pagen - 1) * itemsperpage
            query = "SELECT TOP " & itemsperpage & " d.id, d.name, d.gender, d.photo, d.age, d.address, d.city, d.phone, d.email, d.details, d.joined, d.lastactive, d.log_id FROM tblDoctor d, tblAffclinic a WHERE d.id=a.doc_id AND a.clinic_id=" & Request.QueryString("clid") & " AND d.id NOT IN (SELECT TOP " & limitstart & " d.id FROM tblDoctor d, tblAffclinic a WHERE d.id=a.doc_id AND a.clinic_id=" & Request.QueryString("clid") & ")"
            lblRef.Text = "- " & core.getclnamebyid(Request.QueryString("clid"))
        ElseIf Request.QueryString("sin") <> "" And Request.QueryString("sfor") <> "" Then
            querycount = "SELECT * FROM tblDoctor WHERE " & Request.QueryString("sin") & " LIKE '%" & Request.QueryString("sfor") & "%'"
            numpages = core.getnumpages(querycount, itemsperpage)
            If pagen > numpages And numpages <> 0 Then
                pagen = numpages
            End If
            limitstart = (pagen - 1) * itemsperpage
            query = "SELECT TOP " & itemsperpage & " * FROM tblDoctor WHERE " & Request.QueryString("sin") & " LIKE '%" & Request.QueryString("sfor") & "%' AND id NOT IN (SELECT TOP " & limitstart & " id FROM tblDoctor WHERE " & Request.QueryString("sin") & " LIKE '%" & Request.QueryString("sfor") & "%' )"
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
        showitems(query) 'show doctors
    End Sub

    Sub showitems(ByVal query As String)
        Try
            Dim adapter As New SqlDataAdapter(query, connection.connection)
            Dim dsItem As New Data.DataSet
            adapter.Fill(dsItem, "tblDoctor")
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
        End Try
    End Sub

    Public Function enhospital(ByVal did As Integer) As Boolean 'if he have joined hospitals
        Dim count As Integer
        Try
            connection.Open()
            Dim cmd As New SqlCommand("SELECT COUNT(*) FROM tblAffhospital WHERE doc_id=" & did, connection.connection)
            count = cmd.ExecuteScalar
        Catch ex As Exception
        Finally
            connection.Close()
        End Try
        Return count > 0
    End Function

    Public Function enclinic(ByVal did As Integer) As Boolean 'if he have affiliate with clinics
        Dim count As Integer
        Try
            connection.Open()
            Dim cmd As New SqlCommand("SELECT COUNT(*) FROM tblAffclinic WHERE doc_id=" & did, connection.connection)
            count = cmd.ExecuteScalar
        Catch ex As Exception
        Finally
            connection.Close()
        End Try
        Return count > 0
    End Function

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        Response.Redirect("Doctors.aspx?sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text)
    End Sub

    Protected Sub btnPrev_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrev.Click
        Response.Redirect("Doctors.aspx?pagen=" & pagen - 1 & "&sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text & "&clid=" & Request.QueryString("clid") & "&hid=" & Request.QueryString("hid"))
    End Sub

    Protected Sub btnNext_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNext.Click
        Response.Redirect("Doctors.aspx?pagen=" & pagen + 1 & "&sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text & "&clid=" & Request.QueryString("clid") & "&hid=" & Request.QueryString("hid"))
    End Sub

    Protected Sub btnPrev2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrev2.Click
        Response.Redirect("Doctors.aspx?pagen=" & pagen - 1 & "&sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text & "&clid=" & Request.QueryString("clid") & "&hid=" & Request.QueryString("hid"))
    End Sub

    Protected Sub btnNext2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNext2.Click
        Response.Redirect("Doctors.aspx?pagen=" & pagen + 1 & "&sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text & "&clid=" & Request.QueryString("clid") & "&hid=" & Request.QueryString("hid"))
    End Sub

    Public Function urlextend() As String 'avoid miss the reffered page
        Return "&sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text & "&clid=" & Request.QueryString("clid") & "&hid=" & Request.QueryString("hid") & "&pagen=" & pagen
    End Function

    Public Function validated(ByVal id As Integer) As Boolean
        Try
            connection.Open()
            Dim cmd As New SqlCommand("SELECT isvalid FROM tblDoctor WHERE id=" & id, connection.connection)
            Return cmd.ExecuteScalar = 0
        Catch ex As Exception
        Finally
            connection.Close()
        End Try
        Return True
    End Function
End Class
