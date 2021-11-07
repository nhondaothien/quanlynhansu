Imports System.Web.Configuration
Imports System.Data.SqlClient
Public Class hrLogin
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
        Dim user As String = LOGIN1.UserName
        Dim password As String = LOGIN1.Password
        Dim MaChiNhanh As String = cbChiNhanh.SelectedValue

        Dim da As New SqlDataAdapter("SELECT * FROM vfm_Role WHERE Email=@Email AND MatKhau=@MatKhau AND MaChiNhanh=@MaChiNhanh", connection)
        da.SelectCommand.Parameters.AddWithValue("Email", user)
        da.SelectCommand.Parameters.AddWithValue("MatKhau", password)
        da.SelectCommand.Parameters.AddWithValue("MaChiNhanh", MaChiNhanh)

        Dim t As New DataTable
        da.Fill(t)
        e.Authenticated = t.Rows.Count > 0

        Session("LoginOK") = e.Authenticated
        If e.Authenticated Then
            'Set Level cho Session Level

            Session("hr") = t.Rows(0)("fm").ToString()
            Session("Email") = t.Rows(0)("Email").ToString()
            Session("MaChiNhanh") = t.Rows(0)("MaChiNhanh").ToString()

            Response.Redirect("/Data/HRM/Management/hrM08_NhanSuCongTy.aspx")
        Else
            ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Vui lòng nhập đúng User, Password!');", True)
        End If

    End Sub

End Class