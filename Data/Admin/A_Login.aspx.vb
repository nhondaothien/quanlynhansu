Imports System.Web.Configuration
Imports System.Data.SqlClient
Public Class A_Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("LoginOK") = False
        Session.RemoveAll()
    End Sub

    Protected Sub Login1_Authenticate(sender As Object, e As AuthenticateEventArgs) Handles Login1.Authenticate
        Dim ConnectionString As String = WebConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString
        Dim connection As New SqlConnection(ConnectionString)
        connection.Open()
        'Lay thong tin dang nhap
        Dim user As String = Login1.UserName
        Dim password As String = Login1.Password

        'Kiem tra thong tin dang nhap
        Dim da As New SqlDataAdapter("SELECT * FROM A00_TaiKhoanChu WHERE Username=@Username AND Password=@Password", connection)
        da.SelectCommand.Parameters.AddWithValue("Username", user)
        da.SelectCommand.Parameters.AddWithValue("Password", password)

        Dim t As New DataTable
        da.Fill(t)
        e.Authenticated = t.Rows.Count > 0

        Session("LoginOK") = e.Authenticated
        If e.Authenticated Then
            'Set Level cho Session Level
            Session("Username") = t.Rows(0)("Username").ToString()
            Response.Redirect("/Data/Admin/A_Dashboard.aspx")
        End If
    End Sub
End Class