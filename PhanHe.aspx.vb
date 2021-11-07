Imports System.Text
Public Class PhanHe
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Session("LoginOK") Then
            Response.Redirect("/Login.aspx")
        End If
    End Sub

    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        Dim Index As Integer = Convert.ToInt32(e.CommandArgument)
        If (e.CommandName.Equals("selectRecord")) Then
            Dim code As String = GridView1.DataKeys(Index).Value.ToString()
            Dim gvrow As GridViewRow = GridView1.Rows(Index)
            Session("MaPhanHe") = HttpUtility.HtmlDecode(gvrow.Cells(1).Text).ToString()
            Session("Quyen") = HttpUtility.HtmlDecode(gvrow.Cells(3).Text).ToString()
            Session("MaCongTy") = HttpUtility.HtmlDecode(gvrow.Cells(4).Text).ToString()
            If (Session("MaPhanHe") = "ITR-HRM") Then
                Response.Redirect("/Data/HRM/Management/hrM08_NhanSuCongTy.aspx")
            ElseIf (Session("MaPhanHe") = "ITR-FMS") Then
                Response.Redirect("/Data/FMS/Update/fmU_SoQuyTienMat.aspx")
            ElseIf (Session("MaPhanHe") = "ITR-CRM") Then
                Response.Redirect("/Data/CRM/Update/mktU_KhachHang.aspx")
            ElseIf (Session("MaPhanHe") = "ITR-QMS") Then
                Response.Redirect("/Data/QMS/Update/dmsU_TaiLieuISO.aspx")
            ElseIf (Session("MaPhanHe") = "ITR-EMS") Then
                Response.Redirect("/Data/EMS/Update/eqmU_TinhTrangThietBi.aspx")
            ElseIf (Session("MaPhanHe") = "ITR-MMS") Then
                Response.Redirect("/Data/MMS/Update/matU_ChungTu.aspx")
            ElseIf (Session("MaPhanHe") = "ITR-PRM") Then
                Response.Redirect("/Data/PRM/Update/SoQuyTienMat.aspx")
            ElseIf (Session("MaPhanHe") = "ITR-WMS") Then
                Response.Redirect("/Data/WMS/Update/SoQuyTienMat.aspx")
            ElseIf (Session("MaPhanHe") = "ITR-PMS") Then
                Response.Redirect("/PhanQuyenDuAn.aspx")
            Else
                Response.Redirect("/Login.aspx")
            End If
        End If
    End Sub

End Class