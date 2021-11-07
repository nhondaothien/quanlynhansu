Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.OleDb
Imports System.Configuration
Imports System.Data.Common
Imports CKFinder
Public Class staffU_ChamCong
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Session("LoginOK") Or Not Session("TinhTrang") = "1" Then
            Response.Redirect("staffLogin.aspx")
        End If
        panelPhanQuyen.Visible = True
        panelThongBao.Visible = False
        panelError.Visible = False
    End Sub

    Protected Sub GridView3_RowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs)
        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        '[MaChamCong], [NgayCong], [LoaiCong], [SoLuong], [GhiChu], [MaNhanSuDuAn]

        If e.CommandName.Equals("editRecord") Then
            Dim gvrow As GridViewRow = GridView3.Rows(index)

            txtMaChamCong1.Text = HttpUtility.HtmlDecode(gvrow.Cells(1).Text).ToString()
            txtNgayCong1.Text = HttpUtility.HtmlDecode(gvrow.Cells(2).Text).ToString().ToString()
            cbLoaiCong1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(3).Text).ToString().Trim()
            cbSoLuong1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(4).Text).ToString().Trim()
            txtGhiChu1.Text = HttpUtility.HtmlDecode(gvrow.Cells(5).Text).ToString().Trim()
            txtMaNhanSuDuAn1.Text = HttpUtility.HtmlDecode(gvrow.Cells(6).Text).ToString().Trim()
            txtPhanLoai1.Text = HttpUtility.HtmlDecode(gvrow.Cells(7).Text).ToString().Trim()

            lblResult.Visible = False
            Dim sb As StringBuilder = New StringBuilder()
            sb.Append("<script type='text/javascript'>")
            sb.Append("$('#editModal').modal('show');")
            sb.Append("</script>")
            ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "EditModalScript", sb.ToString(), False)

        End If
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As EventArgs)
        '[MaChamCong], [NgayCong], [LoaiCong], [SoLuong], [GhiChu], [MaNhanSuDuAn]

        If IsValid Then
            Dim parameters = SqlDataSource1_ChiTietChamCong.UpdateParameters

            parameters("MaChamCong").DefaultValue = txtMaChamCong1.Text
            parameters("NgayCong").DefaultValue = txtNgayCong1.Text
            parameters("LoaiCong").DefaultValue = cbLoaiCong1.SelectedValue
            parameters("SoLuong").DefaultValue = cbSoLuong1.SelectedValue
            parameters("GhiChu").DefaultValue = txtGhiChu1.Text
            parameters("MaNhanSuDuAn").DefaultValue = txtMaNhanSuDuAn1.Text
            parameters("PhanLoai").DefaultValue = txtPhanLoai1.Text

            Try

                If txtNgayCong1.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
                ElseIf cbLoaiCong1.SelectedValue = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
                ElseIf cbSoLuong1.SelectedValue = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
                Else
                    SqlDataSource1_ChiTietChamCong.Update()

                    Dim sb As StringBuilder = New StringBuilder()
                    sb.Append("<script type='text/javascript'>")
                    sb.Append("alert('Đã cập nhật thành công!');")
                    sb.Append("$('#editModal').modal('hide');")
                    sb.Append("</script>")
                    ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "EditHideModalScript", sb.ToString(), False)
                End If

            Catch __unusedException1__ As Exception
                ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Vui lòng kiểm tra lại.');", True)
            End Try
        End If
    End Sub
End Class