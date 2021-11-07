Imports System.Data.SqlClient
Public Class hrM08_NhanSuCongTy
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Session("LoginOK") Then
            Response.Redirect("/Login.aspx")
        End If
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        Dim cmd As New SqlCommand
        Dim Search As String
        If cbSearch.SelectedValue = "1" Then
            Search = "SELECT hr_NhanVien.MaNhanVien, hr_NhanVien.HoLot, hr_NhanVien.Ten, hr_NhanVien.DiDong, hr_NhanVien.Email, hr_NhanVien.BoPhanLamViecID, hr_ChiNhanh.MaCongTy
                        FROM   hr_NhanVien INNER JOIN hr_BoPhanLamViec ON hr_NhanVien.BoPhanLamViecID = hr_BoPhanLamViec.MaBoPhan INNER JOIN hr_ChiNhanh ON hr_BoPhanLamViec.MaChiNhanh = hr_ChiNhanh.MaChiNhanh
                        WHERE (hr_ChiNhanh.MaCongTy = @MaCongTy) AND (MaNhanVien like N'%" + txtSearch.Text.ToString() + "%')"
            SqlDataSource01_NhanSu.SelectCommand = Search
        End If
        If cbSearch.SelectedValue = "2" Then
            Search = "SELECT hr_NhanVien.MaNhanVien, hr_NhanVien.HoLot, hr_NhanVien.Ten, hr_NhanVien.DiDong, hr_NhanVien.Email, hr_NhanVien.BoPhanLamViecID, hr_ChiNhanh.MaCongTy
                        FROM   hr_NhanVien INNER JOIN hr_BoPhanLamViec ON hr_NhanVien.BoPhanLamViecID = hr_BoPhanLamViec.MaBoPhan INNER JOIN hr_ChiNhanh ON hr_BoPhanLamViec.MaChiNhanh = hr_ChiNhanh.MaChiNhanh
                        WHERE (hr_ChiNhanh.MaCongTy = @MaCongTy) AND (Ten like N'%" + txtSearch.Text.ToString() + "%')"
            SqlDataSource01_NhanSu.SelectCommand = Search
        End If
        If cbSearch.SelectedValue = "3" Then
            Search = "SELECT hr_NhanVien.MaNhanVien, hr_NhanVien.HoLot, hr_NhanVien.Ten, hr_NhanVien.DiDong, hr_NhanVien.Email, hr_NhanVien.BoPhanLamViecID, hr_ChiNhanh.MaCongTy
                        FROM   hr_NhanVien INNER JOIN hr_BoPhanLamViec ON hr_NhanVien.BoPhanLamViecID = hr_BoPhanLamViec.MaBoPhan INNER JOIN hr_ChiNhanh ON hr_BoPhanLamViec.MaChiNhanh = hr_ChiNhanh.MaChiNhanh
                        WHERE (hr_ChiNhanh.MaCongTy = @MaCongTy) AND (TinhTrang like N'%" + txtSearch.Text.ToString() + "%')"
            SqlDataSource01_NhanSu.SelectCommand = Search
        End If

    End Sub
    Protected Sub GridView1_DataBound(sender As Object, e As EventArgs) Handles gv_NhanSu.DataBound
        Try
            gv_NhanSu.SelectedIndex = 0
        Catch ex As Exception
            ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Vui long kiem tra lai!');", True)
        End Try
    End Sub

    Protected Sub btnRefesh_Click(sender As Object, e As EventArgs) Handles btnRefesh.Click
        Response.Redirect("./hrM08_NhanSuCongTy.aspx")
    End Sub
End Class