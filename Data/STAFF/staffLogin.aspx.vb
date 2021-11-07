Imports System.Web.Configuration
Imports System.Data.SqlClient
Public Class staffLogin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("LoginOK") = False
        Session.RemoveAll()
    End Sub

    Protected Sub Login1_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles Login1.Authenticate
        Dim ConnectionString As String = WebConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString
        Dim connection As New SqlConnection(ConnectionString)
        connection.Open()
        'Lay thong tin dang nhap
        Dim user As String = Login1.UserName
        Dim password As String = Login1.Password

        Dim da As New SqlDataAdapter("SELECT * FROM A00_TaiKhoanNguoiDung WHERE Email=@Email AND MatKhau=@MatKhau", connection)
        da.SelectCommand.Parameters.AddWithValue("Email", user)
        da.SelectCommand.Parameters.AddWithValue("MatKhau", password)

        Dim t As New DataTable
        da.Fill(t)
        e.Authenticated = t.Rows.Count > 0

        Session("LoginOK") = e.Authenticated
        If e.Authenticated Then
            'Set Level cho Session Level

            Session("Email") = t.Rows(0)("Email").ToString()
            Session("TinhTrang") = t.Rows(0)("TinhTrang").ToString()
            Response.Redirect("staffM_NhanSu.aspx")
        Else
            ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Vui lòng nhập đúng User, Password!');", True)
        End If

    End Sub

End Class