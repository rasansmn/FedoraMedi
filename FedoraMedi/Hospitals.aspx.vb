Imports System.Data.SqlClient

Partial Class Hospitals
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
        If Request.QueryString("action") = "join" Then
            If dvalidated(core.getmyses) = False Then
                Try
                    connection.Open()
                    Dim cmdin As New SqlCommand("INSERT INTO tblAffhospital VALUES (" & core.getnewid("tblAffhospital") & "," & core.getmyses & "," & Request.QueryString("hid") & ")", connection.connection)
                    cmdin.ExecuteNonQuery()
                    TD1.Visible = True
                    lblAct.Text = "You have joined to the hospital successfully"
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
        ElseIf Request.QueryString("action") = "unjoin" Then
            Try
                connection.Open()
                Dim cmd As New SqlCommand("DELETE FROM tblAffhospital WHERE hospital_id=" & Request.QueryString("hid") & " AND doc_id=" & core.getmyses, connection.connection)
                cmd.ExecuteNonQuery()
                TD1.Visible = True
                lblAct.Text = "You have unjoined to the hospital successfully"
            Catch ex As Exception
                TD2.Visible = True
                lblError.Text = ex.Message
            Finally
                connection.Close()
            End Try
        ElseIf Request.QueryString("action") = "delhos" And core.getperm = 5 Then ' only for admin
            Try
                connection.Open()
                Dim cmd As New SqlCommand("DELETE FROM tblHospital WHERE id=" & Request.QueryString("hid"), connection.connection)
                cmd.ExecuteNonQuery()
                Dim cmd2 As New SqlCommand("DELETE FROM tblLogin WHERE id=" & Request.QueryString("hid"), connection.connection)
                cmd2.ExecuteNonQuery()
                'cascade delete disabled on sql
                Dim cmd3 As New SqlCommand("DELETE FROM tblClinic WHERE crid=" & Request.QueryString("hid"), connection.connection)
                cmd3.ExecuteNonQuery()
                TD1.Visible = True
                lblAct.Text = "Hopital Deleted Successfully"
            Catch ex As Exception
                TD2.Visible = True
                lblError.Text = ex.Message
            Finally
                connection.Close()
            End Try
        ElseIf Request.QueryString("action") = "val" And core.getperm = 5 Then
            Try
                connection.Open()
                Dim cmd As New SqlCommand("UPDATE tblHospital SET isvalid=1 WHERE id=" & Request.QueryString("hid"), connection.connection)
                cmd.ExecuteNonQuery()
                TD1.Visible = True
                lblAct.Text = "Hospital Validated Successfully"
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
        pagen = Val(Request.QueryString("pagen"))
        If pagen < 1 Then
            pagen = 1
        End If

        querycount = "SELECT * FROM tblHospital"
        numpages = core.getnumpages(querycount, itemsperpage)
        If pagen > numpages And numpages <> 0 Then
            pagen = numpages
        End If
        limitstart = (pagen - 1) * itemsperpage
        query = "SELECT TOP " & itemsperpage & " * FROM tblHospital WHERE id NOT IN (SELECT TOP " & limitstart & " id FROM tblHospital)"

        If Request.QueryString("did") <> Nothing Then
            querycount = "SELECT h.id, h.name, h.logo, h.address, h.city, h.phone, h.email, h.details, h.joined, h.lastactive, h.log_id FROM tblHospital h, tblAffhospital a WHERE h.id=a.hospital_id AND a.doc_id=" & Request.QueryString("did")
            numpages = core.getnumpages(querycount, itemsperpage)
            If pagen > numpages And numpages <> 0 Then
                pagen = numpages
            End If
            limitstart = (pagen - 1) * itemsperpage
            query = "SELECT TOP " & itemsperpage & " h.id, h.name, h.logo, h.address, h.city, h.phone, h.email, h.details, h.joined, h.lastactive, h.log_id FROM tblHospital h, tblAffhospital a WHERE h.id=a.hospital_id AND a.doc_id=" & Request.QueryString("did") & " AND h.id NOT IN (SELECT TOP " & limitstart & " h.id FROM tblHospital h, tblAffhospital a WHERE h.id=a.hospital_id AND a.doc_id=" & Request.QueryString("did") & ")"
            lblRef.Text = "- " & core.getnamebyid(Request.QueryString("did"))
        ElseIf Request.QueryString("hosid") <> Nothing Then
            querycount = "SELECT * FROM tblHospital WHERE id=" & Request.QueryString("hosid")
            numpages = core.getnumpages(querycount, itemsperpage)
            If pagen > numpages And numpages <> 0 Then
                pagen = numpages
            End If
            limitstart = (pagen - 1) * itemsperpage
            query = "SELECT TOP " & itemsperpage & " * FROM tblHospital WHERE id=" & Request.QueryString("hosid") & " AND id NOT IN (SELECT TOP " & limitstart & " id FROM tblHospital WHERE id=" & Request.QueryString("hosid") & ")"
            lblRef.Text = "- " & core.getnamebyid(Request.QueryString("hosid"))
        ElseIf Request.QueryString("clid") <> Nothing Then
            querycount = "SELECT h.id, h.name, h.logo, h.address, h.city, h.phone, h.email, h.details, h.joined, h.lastactive, h.log_id FROM tblHospital h, tblClinic c WHERE h.id= c.crid AND c.id=" & Request.QueryString("clid")
            numpages = core.getnumpages(querycount, itemsperpage)
            If pagen > numpages And numpages <> 0 Then
                pagen = numpages
            End If
            limitstart = (pagen - 1) * itemsperpage
            query = "SELECT TOP " & itemsperpage & " h.id, h.name, h.logo, h.address, h.city, h.phone, h.email, h.details, h.joined, h.lastactive, h.log_id FROM tblHospital h, tblClinic c WHERE h.id= c.crid AND c.id=" & Request.QueryString("clid") & " AND h.id NOT IN (SELECT TOP " & limitstart & " h.id FROM tblHospital h, tblClinic c WHERE h.id= c.crid AND c.id=" & Request.QueryString("clid") & ")"
            lblRef.Text = "- " & core.getclnamebyid(Request.QueryString("clid"))
        ElseIf Request.QueryString("sin") <> "" And Request.QueryString("sfor") <> "" Then
            query = "SELECT * FROM tblHospial WHERE " & Request.QueryString("sin") & " LIKE '%" & Request.QueryString("sfor") & "%'"
            numpages = core.getnumpages(querycount, itemsperpage)
            If pagen > numpages And numpages <> 0 Then
                pagen = numpages
            End If
            limitstart = (pagen - 1) * itemsperpage
            query = "SELECT TOP " & itemsperpage & " * FROM tblHospital WHERE " & Request.QueryString("sin") & " LIKE '%" & Request.QueryString("sfor") & "%' AND id NOT IN (SELECT TOP " & limitstart & " id FROM tblHospital WHERE " & Request.QueryString("sin") & " LIKE '%" & Request.QueryString("sfor") & "%' )"
            lblRef.Text = "- Search (" & Request.QueryString("sfor") & ")"
        End If
        'navigation buttons
        lblPagen.Text = pagen
        lblNumpages.Text = numpages
        lblPagen2.Text = pagen
        lblNumpages2.Text = numpages
        lblPagen3.Text = pagen
        lblNumpages3.Text = numpages
        If pagen < numpages Then
            btnNext.Enabled = True
            btnNext2.Enabled = True
            btnNext3.Enabled = True
        End If
        If pagen > 1 Then
            btnPrev.Enabled = True
            btnPrev2.Enabled = True
            btnPrev3.Enabled = True
        End If
        showitems(query)
    End Sub

    Sub showitems(ByVal query As String)
        Try
            Dim adapter As New SqlDataAdapter(query, connection.connection)
            Dim dsItem As New Data.DataSet
            adapter.Fill(dsItem, "tblHospital")
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
            Repeater3.DataSource = dsItem
            Repeater3.DataBind()
            If Repeater3.Items.Count = 0 Then
                tblRp3.Visible = True
                tblNavi3.Visible = False
            End If
        Catch ex As Exception
            TD2.Visible = True
            lblError.Text = ex.Message
        Finally
            connection.Close()
        End Try
    End Sub

    Public Function geturl(ByVal id As Integer) As String 'action by doctor
        Dim count As Integer
        Try
            connection.Open()
            Dim cmdcount As New SqlCommand("SELECT count(*) FROM tblAffhospital WHERE hospital_id=" & id & " AND doc_id=" & core.getmyses, connection.connection)
            count = cmdcount.ExecuteScalar()
        Catch ex As Exception
        Finally
            connection.Close()
        End Try
        If count = 0 Then
            Return "~/Hospitals.aspx?action=join&hid=" & id & urlextend()
        Else
            Return "~/Hospitals.aspx?action=unjoin&hid=" & id & urlextend()
        End If
    End Function

    Public Function getcaption(ByVal id As Integer) As String 'action by doctor
        Dim count As Integer
        Try
            connection.Open()
            Dim cmdcount As New SqlCommand("SELECT count(*) FROM tblAffhospital WHERE hospital_id=" & id & " AND doc_id=" & core.getmyses, connection.connection)
            count = cmdcount.ExecuteScalar()
        Catch ex As Exception
        Finally
            connection.Close()
        End Try
        If count = 0 Then
            Return "Join"
        Else
            Return "Unjoin"
        End If
    End Function

    Public Function endoctors(ByVal hid As Integer) As Boolean 'hospital have doctors?
        Dim count As Integer
        Try
            connection.Open()
            Dim cmd As New SqlCommand("SELECT COUNT(*) FROM tblAffhospital WHERE hospital_id=" & hid, connection.connection)
            count = cmd.ExecuteScalar
        Catch ex As Exception
        Finally
            connection.Close()
        End Try
        Return count > 0
    End Function

    Public Function enclinics(ByVal hid As Integer) As Boolean 'hospital have clinics?
        Dim count As Integer
        Try
            connection.Open()
            Dim cmd As New SqlCommand("SELECT COUNT(*) FROM tblClinic WHERE crid=" & hid, connection.connection)
            count = cmd.ExecuteScalar
        Catch ex As Exception
        Finally
            connection.Close()
        End Try
        Return count > 0
    End Function

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        Response.Redirect("Hospitals.aspx?sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text)
    End Sub

    Protected Sub btnNext_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNext.Click
        Response.Redirect("Hospitals.aspx?pagen=" & pagen + 1 & "&sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text & "&clid=" & Request.QueryString("clid") & "&did=" & Request.QueryString("did"))
    End Sub

    Protected Sub btnPrev_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrev.Click
        Response.Redirect("Hospitals.aspx?pagen=" & pagen - 1 & "&sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text & "&clid=" & Request.QueryString("clid") & "&did=" & Request.QueryString("did"))
    End Sub

    Protected Sub btnNext2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNext2.Click
        Response.Redirect("Hospitals.aspx?pagen=" & pagen + 1 & "&sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text & "&clid=" & Request.QueryString("clid") & "&did=" & Request.QueryString("did"))
    End Sub

    Protected Sub btnPrev2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrev2.Click
        Response.Redirect("Hospitals.aspx?pagen=" & pagen - 1 & "&sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text & "&clid=" & Request.QueryString("clid") & "&did=" & Request.QueryString("did"))
    End Sub

    Protected Sub btnNext3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNext3.Click
        Response.Redirect("Hospitals.aspx?pagen=" & pagen + 1 & "&sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text & "&clid=" & Request.QueryString("clid") & "&did=" & Request.QueryString("did"))
    End Sub

    Protected Sub btnPrev3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrev3.Click
        Response.Redirect("Hospitals.aspx?pagen=" & pagen - 1 & "&sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text & "&clid=" & Request.QueryString("clid") & "&did=" & Request.QueryString("did"))
    End Sub

    Public Function urlextend() As String 'avoid missing the reffered page
        Return "&sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text & "&clid=" & Request.QueryString("clid") & "&did=" & Request.QueryString("did") & "&pagen=" & pagen
    End Function

    Public Function validated(ByVal id As Integer) As Boolean
        Try
            connection.Open()
            Dim cmd As New SqlCommand("SELECT isvalid FROM tblHospital WHERE id=" & id, connection.connection)
            Return cmd.ExecuteScalar = 0
        Catch ex As Exception
        Finally
            connection.Close()
        End Try
        Return True
    End Function

    Public Function dvalidated(ByVal id As Integer) As Boolean
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
