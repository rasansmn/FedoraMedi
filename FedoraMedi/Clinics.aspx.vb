Imports System.Data.SqlClient

Partial Class Clinics
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
            TD3.Visible = False
            TD4.Visible = False
        End If
        'actions performed by user
        If Request.QueryString("action") = "req" Then
            If core.getperm = 0 Or core.getperm = 4 Then 'user must login to do this
                Response.Redirect("RegMember.aspx?ref=request")
            Else
                If getstatus(Request.QueryString("id")) = "Full" Then
                    TD2.Visible = True
                    lblError.Text = "Appointmemnts limit of this clinic is exceeded"
                Else
                    If isfree(Request.QueryString("id")) = False Then
                        TD3.Visible = True
                        TD4.Visible = True
                    Else
                        Try
                            connection.Open()
                            Dim cmdin As New SqlCommand("INSERT INTO tblAppointment VALUES (" & core.getnewid("tblAppointment") & ",'Pending' ," & Request.QueryString("id") & "," & core.getmyses & ")", connection.connection)
                            cmdin.ExecuteNonQuery()
                            core.sendmail(core.getacceptermail(Request.QueryString("id")), "You have received a new appointment request for your clinic")
                            TD1.Visible = True
                            lblAct.Text = "Appointment request added successfully"
                        Catch ex As Exception
                            TD2.Visible = True
                            lblError.Text = ex.Message
                        Finally
                            connection.Close()
                        End Try
                    End If
                End If
            End If
        ElseIf Request.QueryString("action") = "canreq" Then
            Try
                connection.Open()
                Dim cmd As New SqlCommand("DELETE FROM tblAppointment WHERE clinic_id=" & Request.QueryString("id") & " AND mem_id=" & core.getmyses, connection.connection)
                cmd.ExecuteNonQuery()
                TD1.Visible = True
                lblAct.Text = "Appointment deleted successfully"
            Catch ex As Exception
                TD2.Visible = True
                lblError.Text = ex.Message
            Finally
                connection.Close()
            End Try
        ElseIf Request.QueryString("action") = "aff" Then
            If validated(core.getmyses) = True Then
                Try
                    connection.Open()
                    Dim cmdin As New SqlCommand("INSERT INTO tblAffclinic VALUES (" & core.getnewid("tblAffclinic") & "," & Request.QueryString("clid") & "," & core.getmyses & ")", connection.connection)
                    cmdin.ExecuteNonQuery()
                    TD1.Visible = True
                    lblAct.Text = "You have affiliated to the clinic successfully"
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
        ElseIf Request.QueryString("action") = "unaff" Then
            Try
                connection.Open()
                Dim cmd As New SqlCommand("DELETE FROM tblAffclinic WHERE clinic_id=" & Request.QueryString("clid") & " AND doc_id=" & core.getmyses, connection.connection)
                cmd.ExecuteNonQuery()
                TD1.Visible = True
                lblAct.Text = "You have cancelled affiliation successfully"
            Catch ex As Exception
                TD2.Visible = True
                lblError.Text = ex.Message
            Finally
                connection.Close()
            End Try
        ElseIf Request.QueryString("action") = "delcl" And (core.getperm = 5 Or Request.QueryString("crid") = core.getmyses) Then
            Try
                connection.Open()
                Dim cmd As New SqlCommand("DELETE FROM tblClinic WHERE id=" & Request.QueryString("clid"), connection.connection)
                cmd.ExecuteNonQuery()
                TD1.Visible = True
                lblAct.Text = "Clinic Removed Successfully"
            Catch ex As Exception
                TD2.Visible = True
                lblError.Text = ex.Message
            Finally
                connection.Close()
            End Try
        End If

        pagen = Val(Request.QueryString("pagen")) 'page number?
        If pagen < 1 Then
            pagen = 1
        End If
        'prepare the query for requested page
        querycount = "SELECT * FROM tblClinic"
        numpages = core.getnumpages(querycount, itemsperpage)
        If pagen > numpages And numpages <> 0 Then
            pagen = numpages
        End If
        limitstart = (pagen - 1) * itemsperpage
        query = "SELECT TOP " & itemsperpage & " * FROM tblClinic WHERE id NOT IN (SELECT TOP " & limitstart & " id FROM tblClinic)"

        If Request.QueryString("did") <> Nothing Then
            querycount = "SELECT c.id, c.name, c.location, c.time, c.details, c.max_app, c.charge, c.created, c.crid FROM tblClinic c, tblAffclinic a WHERE c.id=a.clinic_id AND a.doc_id=" & Request.QueryString("did")
            numpages = core.getnumpages(querycount, itemsperpage)
            If pagen > numpages And numpages <> 0 Then
                pagen = numpages
            End If
            limitstart = (pagen - 1) * itemsperpage
            query = "SELECT TOP " & itemsperpage & " c.id, c.name, c.location, c.time, c.details, c.max_app, c.charge, c.created, c.crid FROM tblClinic c, tblAffclinic a WHERE c.id=a.clinic_id AND a.doc_id=" & Request.QueryString("did") & " AND c.id NOT IN (SELECT TOP " & limitstart & " c.id FROM tblClinic c, tblAffclinic a WHERE c.id=a.clinic_id AND a.doc_id=" & Request.QueryString("did") & ")"
            lblRef.Text = "- " & core.getnamebyid(Request.QueryString("did"))
        ElseIf Request.QueryString("hid") <> Nothing Then
            querycount = "SELECT * FROM tblClinic WHERE crid=" & Request.QueryString("hid")
            numpages = core.getnumpages(querycount, itemsperpage)
            If pagen > numpages And numpages <> 0 Then
                pagen = numpages
            End If
            limitstart = (pagen - 1) * itemsperpage
            query = "SELECT TOP " & itemsperpage & " * FROM tblClinic WHERE crid=" & Request.QueryString("hid") & " AND id NOT IN (SELECT TOP " & limitstart & " id FROM tblClinic WHERE crid=" & Request.QueryString("hid") & ")"
            lblRef.Text = "- " & core.getnamebyid(Request.QueryString("hid"))
        ElseIf Request.QueryString("cid") <> Nothing Then
            querycount = "SELECT * FROM tblClinic WHERE id=" & Request.QueryString("cid")
            numpages = core.getnumpages(querycount, itemsperpage)
            If pagen > numpages And numpages <> 0 Then
                pagen = numpages
            End If
            limitstart = (pagen - 1) * itemsperpage
            query = "SELECT TOP " & itemsperpage & " * FROM tblClinic WHERE id=" & Request.QueryString("cid") & " AND id NOT IN (SELECT TOP " & limitstart & " id FROM tblClinic WHERE id=" & Request.QueryString("cid") & ")"
            lblRef.Text = "- Of Appointment"
        ElseIf Request.QueryString("sin") <> "" And Request.QueryString("sfor") <> "" Then
            querycount = "SELECT * FROM tblClinic WHERE " & Request.QueryString("sin") & " LIKE '%" & Request.QueryString("sfor") & "%'"
            numpages = core.getnumpages(querycount, itemsperpage)
            If pagen > numpages And numpages <> 0 Then
                pagen = numpages
            End If
            limitstart = (pagen - 1) * itemsperpage
            query = "SELECT TOP " & itemsperpage & " * FROM tblClinic WHERE " & Request.QueryString("sin") & " LIKE '%" & Request.QueryString("sfor") & "%' AND id NOT IN (SELECT TOP " & limitstart & " id FROM tblClinic WHERE " & Request.QueryString("sin") & " LIKE '%" & Request.QueryString("sfor") & "%' )"
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
        showitems(query) ' show clinics
    End Sub

    Public Function geturl(ByVal id As Integer) As String 'patient action
        Dim count As Integer
        Try
            connection.Open()
            Dim cmdcount As New SqlCommand("SELECT count(*) FROM tblAppointment WHERE clinic_id=" & id & " AND mem_id=" & core.getmyses, connection.connection)
            count = cmdcount.ExecuteScalar()
        Catch ex As Exception
        Finally
            connection.Close()
        End Try
        If count = 0 Then
            Return "~/Clinics.aspx?action=req&id=" & id & urlextend()
        Else
            Return "~/Clinics.aspx?action=canreq&id=" & id & urlextend()
        End If
    End Function

    Public Function getcaption(ByVal id As Integer) As String 'patient action
        Dim count As Integer
        Try
            connection.Open()
            Dim cmdcount As New SqlCommand("SELECT count(*) FROM tblAppointment WHERE clinic_id=" & id & " AND mem_id=" & core.getmyses, connection.connection)
            count = cmdcount.ExecuteScalar()
        Catch ex As Exception
        Finally
            connection.Close()
        End Try
        If count = 0 Then
            Return "Request Appointment"
        Else
            Return "Cancel Appointment"
        End If
    End Function

    Public Function getact(ByVal id As Integer, ByVal crid As Integer) As String 'action of doctor
        Dim count As Integer
        If crid = core.getmyses Then
            Return "~/Clinics.aspx?action=delcl&clid=" & id & "&crid=" & crid & urlextend()
        Else
            Try
                connection.Open()
                Dim cmdcount As New SqlCommand("SELECT count(*) FROM tblAffclinic WHERE clinic_id=" & id & " AND doc_id=" & core.getmyses, connection.connection)
                count = cmdcount.ExecuteScalar()
            Catch ex As Exception
            Finally
                connection.Close()
            End Try
        End If
        If count = 0 Then
            Return "~/Clinics.aspx?action=aff&clid=" & id & urlextend()
        Else
            Return "~/Clinics.aspx?action=unaff&clid=" & id & urlextend()
        End If
    End Function

    Public Function getactcap(ByVal id As Integer, ByVal crid As Integer) As String 'action of doctor
        Dim count As Integer
        If crid = core.getmyses Then
            Return "Remove"
        Else
            Try
                connection.Open()
                Dim cmdcount As New SqlCommand("SELECT count(*) FROM tblAffclinic WHERE clinic_id=" & id & " AND doc_id=" & core.getmyses, connection.connection)
                count = cmdcount.ExecuteScalar()
            Catch ex As Exception
            Finally
                connection.Close()
            End Try
        End If
        If count = 0 Then
            Return "Affiliate"
        Else
            Return "Unaffiliate"
        End If
    End Function

    Public Function getenable(ByVal created As String) As Boolean ' if created by doctor
        If created = "Doctor" Then
            Return False
        End If
        Return True
    End Function

    Public Function endoctors(ByVal cid As Integer) As Boolean 'if it have doctors
        Dim count As Integer
        Try
            connection.Open()
            Dim cmd As New SqlCommand("SELECT COUNT(*) FROM tblAffclinic WHERE clinic_id=" & cid, connection.connection)
            count = cmd.ExecuteScalar
        Catch ex As Exception
        Finally
            connection.Close()
        End Try
        Return count > 0
    End Function

    Public Function isfree(ByVal clid As String) As Boolean
        Try
            connection.Open()
            Dim cmd As New SqlCommand("SELECT charge FROM tblClinic WHERE id=" & clid, connection.connection)
            Return cmd.ExecuteScalar.ToString = "Free"
        Catch ex As Exception
        Finally
            connection.Close()
        End Try
        Return False
    End Function

    Public Function getstatus(ByVal clid As Integer) As String
        Dim countapp, max As Integer
        Try
            connection.Open()
            Dim cmd As New SqlCommand("SELECT COUNT(*) FROM tblAppointment WHERE clinic_id=" & clid & " AND approved!='Rejected' ", connection.connection)
            countapp = cmd.ExecuteScalar
            Dim cmd2 As New SqlCommand("SELECT max_app FROM tblClinic WHERE id=" & clid, connection.connection)
            max = cmd2.ExecuteScalar
        Catch ex As Exception
        Finally
            connection.Close()
        End Try
        If countapp < max Then
            Return "Available"
        End If
        Return "Full"
    End Function

    Sub showitems(ByVal query As String)
        Try
            Dim adapter As New SqlDataAdapter(query, connection.connection)
            Dim dsItem As New Data.DataSet
            adapter.Fill(dsItem, "tblClinic")
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
        End Try
    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        Response.Redirect("Clinics.aspx?sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text)
    End Sub

    Protected Sub btnNext_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNext.Click
        Response.Redirect("Clinics.aspx?pagen=" & pagen + 1 & "&sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text & "&did=" & Request.QueryString("did") & "&hid=" & Request.QueryString("hid") & "&cid=" & Request.QueryString("cid"))
    End Sub

    Protected Sub btnPrev_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrev.Click
        Response.Redirect("Clinics.aspx?pagen=" & pagen - 1 & "&sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text & "&did=" & Request.QueryString("did") & "&hid=" & Request.QueryString("hid") & "&cid=" & Request.QueryString("cid"))
    End Sub

    Protected Sub btnNext2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNext2.Click
        Response.Redirect("Clinics.aspx?pagen=" & pagen + 1 & "&sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text & "&did=" & Request.QueryString("did") & "&hid=" & Request.QueryString("hid") & "&cid=" & Request.QueryString("cid"))
    End Sub

    Protected Sub btnPrev2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrev2.Click
        Response.Redirect("Clinics.aspx?pagen=" & pagen - 1 & "&sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text & "&did=" & Request.QueryString("did") & "&hid=" & Request.QueryString("hid") & "&cid=" & Request.QueryString("cid"))
    End Sub

    Protected Sub btnNext3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNext3.Click
        Response.Redirect("Clinics.aspx?pagen=" & pagen + 1 & "&sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text & "&did=" & Request.QueryString("did") & "&hid=" & Request.QueryString("hid") & "&cid=" & Request.QueryString("cid"))
    End Sub

    Protected Sub btnPrev3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrev3.Click
        Response.Redirect("Clinics.aspx?pagen=" & pagen - 1 & "&sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text & "&did=" & Request.QueryString("did") & "&hid=" & Request.QueryString("hid") & "&cid=" & Request.QueryString("cid"))
    End Sub

    Public Function urlextend() As String 'avoid miss the reffered page
        Return "&sin=" & ddllookin.Text & "&sfor=" & txtSearch.Text & "&did=" & Request.QueryString("did") & "&hid=" & Request.QueryString("hid") & "&cid=" & Request.QueryString("cid") & "&pagen=" & pagen
    End Function

    Public Function validated(ByVal id As Integer) As Boolean
        Try
            connection.Open()
            Dim cmd As New SqlCommand("SELECT isvalid FROM tblDoctor WHERE id=" & id, connection.connection)
            Return cmd.ExecuteScalar = 1
        Catch ex As Exception
        Finally
            connection.Close()
        End Try
        Return False
    End Function

    Protected Sub btnPay_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPay.Click
        Try
            connection.Open()
            Dim appid As Integer = core.getnewid("tblAppointment")
            Dim cmdin As New SqlCommand("INSERT INTO tblAppointment VALUES (" & appid & ",'Pending' ," & Request.QueryString("id") & "," & core.getmyses & ")", connection.connection)
            cmdin.ExecuteNonQuery()
            Dim cmdin2 As New SqlCommand("INSERT INTO tblPayment VALUES (" & core.getnewid("tblPayment") & ",'" & ddlMethod.Text & "','" & txtCrdt.Text & "'," & core.getmyses & "," & appid & ")", connection.connection)
            cmdin2.ExecuteNonQuery()
            core.sendmail(core.getacceptermail(Request.QueryString("id")), "You have received a new appointment request for your clinic")
            TD3.Visible = False
            TD4.Visible = False
            TD1.Visible = True
            lblAct.Text = "Appointment request added successfully"
        Catch ex As Exception
            TD2.Visible = True
            lblError.Text = ex.Message
        Finally
            connection.Close()
        End Try
    End Sub
End Class
