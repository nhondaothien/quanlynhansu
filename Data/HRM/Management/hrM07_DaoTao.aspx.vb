Imports System.Data.SqlClient
Public Class hrM07_DaoTao
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
            Search = "SELECT * FROM vhr_DaoTao WHERE (MaChiNhanh = @MaChiNhanh) AND (MaYeuCau like N'%" + txtSearch.Text.ToString() + "%')"
            cmd.Parameters.Add("@MaChiNhanh", SqlDbType.NVarChar).Value = Session("MaChiNhanh")
            SqlDataSource1_DaoTao.SelectCommand = Search
        End If
        If cbSearch.SelectedValue = "2" Then
            Search = "SELECT * FROM vhr_DaoTao WHERE (MaChiNhanh = @MaChiNhanh) AND (NoiDungDaoTao like N'%" + txtSearch.Text.ToString() + "%')"
            cmd.Parameters.Add("@MaChiNhanh", SqlDbType.NVarChar).Value = Session("MaChiNhanh")
            SqlDataSource1_DaoTao.SelectCommand = Search
        End If
        If cbSearch.SelectedValue = "3" Then
            Search = "SELECT * FROM vhr_DaoTao WHERE (MaChiNhanh = @MaChiNhanh) AND (TenKhoaHoc like N'%" + txtSearch.Text.ToString() + "%')"
            cmd.Parameters.Add("@MaChiNhanh", SqlDbType.NVarChar).Value = Session("MaChiNhanh")
            SqlDataSource1_DaoTao.SelectCommand = Search
        End If
        If cbSearch.SelectedValue = "4" Then
            Search = "SELECT * FROM vhr_DaoTao WHERE (MaChiNhanh = @MaChiNhanh) AND (DiaDiem like N'%" + txtSearch.Text.ToString() + "%')"
            cmd.Parameters.Add("@MaChiNhanh", SqlDbType.NVarChar).Value = Session("MaChiNhanh")
            SqlDataSource1_DaoTao.SelectCommand = Search
        End If

    End Sub

    Protected Sub gv_DaoTao_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_DaoTao.SelectedIndexChanged
        Dim row As GridViewRow = gv_DaoTao.SelectedRow
        Dim MaYeuCau As String = row.Cells(1).Text
        Session("MaYeuCauDaoTao1") = MaYeuCau
        Response.Redirect("/Data/HRM/Report/hrR07a_PhieuYeuCauDaoTao.aspx")
    End Sub
End Class