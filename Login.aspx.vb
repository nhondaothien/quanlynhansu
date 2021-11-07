Imports System.Web.Configuration
Imports System.Data.SqlClient

Public Class Login
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
        Dim MaCongTy As String = ddlMaCongTy.SelectedValue

        Dim da As New SqlDataAdapter("SELECT * FROM v00_PhanQuyenCongTy WHERE Email=@Email AND MatKhau=@MatKhau AND MaCongTy=@MaCongTy", connection)
        da.SelectCommand.Parameters.AddWithValue("Email", user)
        da.SelectCommand.Parameters.AddWithValue("MatKhau", password)
        da.SelectCommand.Parameters.AddWithValue("MaCongTy", MaCongTy)

        Dim t As New DataTable
        da.Fill(t)
        e.Authenticated = t.Rows.Count > 0

        Session("LoginOK") = e.Authenticated
        If e.Authenticated Then
            'Set Level cho Session Level
            Session("Email") = t.Rows(0)("Email").ToString()
            Session("MaPhanHe") = t.Rows(0)("MaPhanHe").ToString()
            Session("MaCongTy") = t.Rows(0)("MaCongTy").ToString()
            Session("Quyen") = t.Rows(0)("Quyen").ToString()
            Response.Redirect("/PhanHe.aspx")
        Else
            ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Vui lòng nhập đúng Tài Khoản, Mật Khẩu!');", True)
        End If

    End Sub

End Class