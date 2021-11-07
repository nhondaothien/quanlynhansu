Imports System.Data.SqlClient
Public Class hrM01_BangCap
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
            Search = "SELECT * FROM vhr_BangCap WHERE (MaChiNhanh = @MaChiNhanh) AND (SoBang like N'%" + txtSearch.Text.ToString() + "%')"
            SqlDataSource1_BangCap.SelectCommand = Search
        End If
        If cbSearch.SelectedValue = "2" Then
            Search = "SELECT * FROM vhr_BangCap WHERE (MaChiNhanh = @MaChiNhanh) AND (TenBang like N'%" + txtSearch.Text.ToString() + "%')"
            SqlDataSource1_BangCap.SelectCommand = Search
        End If
        If cbSearch.SelectedValue = "3" Then
            Search = "SELECT * FROM vhr_BangCap WHERE (MaChiNhanh = @MaChiNhanh) AND (LoaiBangCap like N'%" + txtSearch.Text.ToString() + "%')"
            SqlDataSource1_BangCap.SelectCommand = Search
        End If
        If cbSearch.SelectedValue = "4" Then
            Search = "SELECT * FROM vhr_BangCap WHERE (MaChiNhanh = @MaChiNhanh) AND (HoTen like N'%" + txtSearch.Text.ToString() + "%')"
            SqlDataSource1_BangCap.SelectCommand = Search
        End If

    End Sub
End Class