Imports System.Text
Public Class PhanQuyenDuAn
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
            Session("MaDuAn") = HttpUtility.HtmlDecode(gvrow.Cells(1).Text).ToString()
            Session("TenDuAn") = HttpUtility.HtmlDecode(gvrow.Cells(2).Text).ToString()
            Session("pms") = HttpUtility.HtmlDecode(gvrow.Cells(3).Text).ToString()
            Response.Redirect("/Data/PMS/2.SCHEDULE/Update/pmsU_wm_CongViec.aspx")
        End If
    End Sub

End Class