Public Class hrM04_PhieuTraLuongHangThang
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Session("LoginOK") Then
            Response.Redirect("/Login.aspx")
        End If
    End Sub

    Protected Sub gv_PhieuTraLuong_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_PhieuTraLuong.SelectedIndexChanged
        Dim row As GridViewRow = gv_PhieuTraLuong.SelectedRow
        Dim MaLuong As String = row.Cells(1).Text
        Session("MaLuong1") = MaLuong
        Response.Redirect("/Data/HRM/Report/hrR21_TienLuong.aspx")
    End Sub

End Class