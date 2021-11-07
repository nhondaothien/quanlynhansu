Public Class hrM02_PhepNam
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Session("LoginOK") Then
            Response.Redirect("/Login.aspx")
        End If
    End Sub

    Protected Sub gv_PhepNam_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_PhepNam.SelectedIndexChanged
        Dim row As GridViewRow = gv_PhepNam.SelectedRow
        Dim MaPhepNam As String = row.Cells(1).Text
        Session("MaPhepNam1") = MaPhepNam
        Response.Redirect("/Data/HRM/Report/hrR16a_PhieuBaoNghiPhep.aspx")
    End Sub
End Class