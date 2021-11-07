Imports System.Data.SqlClient
Public Class hrM09_HopDongLaoDong
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
            Search = "SELECT * FROM vhr_HopDongLaoDong WHERE (MaChiNhanh = @MaChiNhanh) AND (MaHopDong like N'%" + txtSearch.Text.ToString() + "%')"
            cmd.Parameters.Add("@MaChiNhanh", SqlDbType.NVarChar).Value = Session("MaChiNhanh")
            SqlDataSource1_HopDongLaoDong.SelectCommand = Search
        End If
        If cbSearch.SelectedValue = "2" Then
            Search = "SELECT * FROM vhr_HopDongLaoDong WHERE (MaChiNhanh = @MaChiNhanh) AND (SoHopDong like N'%" + txtSearch.Text.ToString() + "%')"
            cmd.Parameters.Add("@MaChiNhanh", SqlDbType.NVarChar).Value = Session("MaChiNhanh")
            SqlDataSource1_HopDongLaoDong.SelectCommand = Search
        End If
        If cbSearch.SelectedValue = "3" Then
            Search = "SELECT * FROM vhr_HopDongLaoDong WHERE (MaChiNhanh = @MaChiNhanh) AND (MaNhanVien like N'%" + txtSearch.Text.ToString() + "%')"
            cmd.Parameters.Add("@MaChiNhanh", SqlDbType.NVarChar).Value = Session("MaChiNhanh")
            SqlDataSource1_HopDongLaoDong.SelectCommand = Search
        End If
        If cbSearch.SelectedValue = "4" Then
            Search = "SELECT * FROM vhr_HopDongLaoDong WHERE (MaChiNhanh = @MaChiNhanh) AND (HoTen like N'%" + txtSearch.Text.ToString() + "%')"
            cmd.Parameters.Add("@MaChiNhanh", SqlDbType.NVarChar).Value = Session("MaChiNhanh")
            SqlDataSource1_HopDongLaoDong.SelectCommand = Search
        End If

    End Sub

    Protected Sub Ggv_HopDongLaoDong_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_HopDongLaoDong.SelectedIndexChanged
        Dim row As GridViewRow = gv_HopDongLaoDong.SelectedRow
        Dim MaHopDongLaoDong As String = row.Cells(1).Text
        Session("MaHopDongLaoDong1") = MaHopDongLaoDong
        Response.Redirect("/Data/HRM/Report/hrR09a_HopDongCaNhan.aspx")
    End Sub

    Protected Sub btnRefesh_Click(sender As Object, e As EventArgs) Handles btnRefesh.Click
        Response.Redirect("./hrM08_NhanSuCongTy.aspx")
    End Sub
End Class