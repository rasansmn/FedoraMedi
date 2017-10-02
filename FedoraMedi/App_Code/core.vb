Imports Microsoft.VisualBasic
Imports System.Security.Cryptography
Imports System.Data.SqlClient

Public Class core
    Inherits System.Web.UI.Page
    Dim send_email As Boolean = False 'turn on email notifications

    Public Class connection
        Public connection As New SqlConnection("Integrated Security=True; Data Source=.\SQLEXPRESS; initial catalog=FedoraDB;")
        Sub Open()
            connection.Open()
        End Sub
        Sub Close()
            connection.Close()
        End Sub
    End Class

    Public Function getmd5(ByVal SourceText As String) As String
        Dim Ue As New UnicodeEncoding()
        Dim ByteSourceText() As Byte = Ue.GetBytes(SourceText)
        Dim Md5 As New MD5CryptoServiceProvider()
        Dim ByteHash() As Byte = Md5.ComputeHash(ByteSourceText)
        Return Convert.ToBase64String(ByteHash)
    End Function

    Public Function Checkfile(ByVal filename As String) As Boolean
        Dim strExt As String = ""
        If filename.Length > 0 Then
            strExt = filename.Substring(filename.LastIndexOf(".")).ToLower()
        End If
        Return (strExt = ".jpg") Or (strExt = ".gif")
    End Function

    Public Function login(ByVal username As String, ByVal password As String) As Boolean
        Dim connection As New connection
        Dim id As Object
        Try
            connection.Open()
            Dim cmd As New SqlCommand("SELECT id FROM tblLogin WHERE username='" & username & "' AND password='" & getmd5(password) & "'", connection.connection)
            id = cmd.ExecuteScalar
            If CInt(id) = 0 Then
                Return False
            Else
                setlogged(CInt(id))
                Return True
            End If
        Catch ex As Exception
        Finally
            connection.Close()
        End Try
        Return False
    End Function

    Public Function getnewid(ByVal tblname As String) As Integer
        Dim connection As New connection
        Dim count, newid As Integer
        Try
            connection.Open()
            Dim cmdcount As New SqlCommand("SELECT COUNT (*) FROM " & tblname, connection.connection)
            count = cmdcount.ExecuteScalar
            If count > 0 Then
                Dim cmd As New SqlCommand("SELECT max(id) FROM " & tblname, connection.connection)
                newid = cmd.ExecuteScalar
            End If
            newid += 1
        Catch ex As Exception
        Finally
            connection.Close()
        End Try
        Return newid
    End Function

    Sub setlogged(ByVal uid As Integer)
        Session("uid") = Nothing
        Session("uid") = uid
    End Sub

    Public Function getmyses() As Integer
        If Session("uid") <> Nothing Then
            Return Session("uid")
        End If
        Return 0
    End Function

    Sub logout()
        Session("uid") = Nothing
    End Sub

    Public Function getperm() As Integer
        Dim connection As New connection
        If getmyses() > 0 Then
            Try
                connection.Open()
                Dim cmd As New SqlCommand("SELECT permission FROM tblLogin WHERE id=" & getmyses(), connection.connection)
                Return cmd.ExecuteScalar
            Catch ex As Exception
            Finally
                connection.Close()
            End Try
        End If
        Return 0
    End Function

    Public Function getpermbyid(ByVal id As Integer) As Integer
        Dim connection As New connection
        Try
            connection.Open()
            Dim cmd As New SqlCommand("SELECT permission FROM tblLogin WHERE id=" & id, connection.connection)
            Return cmd.ExecuteScalar
        Catch ex As Exception
        Finally
            connection.Close()
        End Try
        Return 0
    End Function

    Public Function getacceptermail(ByVal clid As Integer) As String
        Dim connection As New connection
        Dim created As String = ""
        Dim crid As Integer
        Try
            connection.Open()
            Dim cmd As New SqlCommand("SELECT created, crid FROM tblClinic WHERE id=" & clid, connection.connection)
            Dim read As SqlDataReader = cmd.ExecuteReader
            While read.Read = True
                created = read.Item("created").ToString
                crid = read.Item("crid").ToString
            End While
            read.Close()
            If created = "Doctor" Then
                Dim cmd2 As New SqlCommand("SELECT email FROM tblDoctor WHERE id=" & crid, connection.connection)
                Return cmd2.ExecuteScalar
            ElseIf created = "Hospital" Then
                Dim cmd2 As New SqlCommand("SELECT email FROM tblHospital WHERE id=" & crid, connection.connection)
                Return cmd2.ExecuteScalar
            End If
        Catch ex As Exception
        Finally
            connection.Close()
        End Try
        Return ""
    End Function

    Public Function getrequestermail(ByVal appid As String) As String
        Dim connection As New connection
        Try
            connection.Open()
            Dim cmd As New SqlCommand("SELECT m.email FROM tblMember m, tblAppointment a WHERE m.id=a.mem_id AND a.id=" & appid, connection.connection)
            Return cmd.ExecuteScalar.ToString
        Catch ex As Exception
        Finally
            connection.Close()
        End Try
        Return ""
    End Function

    Public Sub sendmail(ByVal toaddr As String, ByVal msg As String)
        Try
            Dim sb As New StringBuilder
            Dim mailmsg As New System.Net.Mail.MailMessage
            Dim mailaddr As New System.Net.Mail.MailAddress("fedoramedi@wegaspace.com")
            Dim mailer As New System.Net.Mail.SmtpClient()
            Dim creds As New System.Net.NetworkCredential("fedoramedi@wegaspace.com", "1234")
            sb.AppendLine(msg)
            sb.AppendLine("<br>Thank you.") 'add additional text
            mailmsg.IsBodyHtml = True
            mailmsg.Subject = "Appointment Request on FedoraMedi"
            mailmsg.Body = sb.ToString()
            mailmsg.From = mailaddr
            mailer.Host = "mail.wegaspace.com"
            mailer.UseDefaultCredentials = False
            mailer.Credentials = creds
            If send_email = True Then
                mailmsg.To.Add(toaddr)
                mailer.Send(mailmsg)
            End If
        Catch ex As Exception
        End Try
    End Sub

    Public Function getnumpages(ByVal query As String, ByVal itemsperpage As Integer) As Integer
        Try
            Dim connection As New connection
            Dim adapt As New SqlDataAdapter(query, connection.connection)
            Dim ds As New Data.DataSet
            adapt.Fill(ds, "tblCount")
            Return Math.Ceiling(ds.Tables("tblCount").Rows.Count / itemsperpage)
        Catch ex As Exception
        End Try
        Return 1
    End Function

    Public Function getnamebyid(ByVal id As Integer) As String
        Dim connection As New connection
        Dim perm As Integer = getpermbyid(id)
        Try
            connection.Open()
            If perm = 1 Then
                Dim cmd As New SqlCommand("SELECT name FROM tblMember WHERE id=" & id, connection.connection)
                Return cmd.ExecuteScalar.ToString
            ElseIf perm = 2 Then
                Dim cmd As New SqlCommand("SELECT name FROM tblDoctor WHERE id=" & id, connection.connection)
                Return cmd.ExecuteScalar.ToString
            ElseIf perm = 3 Then
                Dim cmd As New SqlCommand("SELECT name FROM tblHospital WHERE id=" & id, connection.connection)
                Return cmd.ExecuteScalar.ToString
            ElseIf perm = 4 Then
                Dim cmd As New SqlCommand("SELECT name FROM tblDonator WHERE id=" & id, connection.connection)
                Return cmd.ExecuteScalar.ToString
            ElseIf perm = 5 Then
                Return "Administrator"
            End If
        Catch ex As Exception
        Finally
            connection.Close()
        End Try
        Return ""
    End Function

    Public Function getclnamebyid(ByVal id As Integer) As String
        Dim connection As New connection
        Try
            connection.Open()
            Dim cmd As New SqlCommand("SELECT name FROM tblClinic WHERE id=" & id, connection.connection)
            Return cmd.ExecuteScalar.ToString
        Catch ex As Exception
        Finally
            connection.Close()
        End Try
        Return ""
    End Function
End Class
