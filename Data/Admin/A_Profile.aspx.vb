Imports System
Imports System.Collections.Generic
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Text
Imports System.Data.Common
Imports System.Data.OleDb
Public Class A_Profile
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Session("LoginOK") Then
            Response.Redirect("A_Login")
        End If
        panelPhanQuyen.Visible = True
        panelThongBao.Visible = False
        panelError.Visible = False
    End Sub
    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs)
        Dim index As Integer = Convert.ToInt32(e.CommandArgument)

        If e.CommandName.Equals("editRecord") Then
            Dim gvrow As GridViewRow = GridView1.Rows(index)
            txtTaiKhoan1.Text = HttpUtility.HtmlDecode(gvrow.Cells(1).Text).ToString()
            txtMaKhau1.Text = HttpUtility.HtmlDecode(gvrow.Cells(2).Text).ToString().ToString()
            txtHoTen1.Text = HttpUtility.HtmlDecode(gvrow.Cells(3).Text).ToString().Trim()

            lblResult.Visible = False
            Dim sb As StringBuilder = New StringBuilder()
            sb.Append("<script type='text/javascript'>")
            sb.Append("$('#editModal').modal('show');")
            sb.Append("</script>")
            ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "EditModalScript", sb.ToString(), False)

        End If
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As EventArgs)
        If IsValid Then
            Dim parameters = SqlDataSource1.UpdateParameters
            parameters("Username").DefaultValue = txtTaiKhoan1.Text
            parameters("Password").DefaultValue = txtMaKhau1.Text
            parameters("FullName").DefaultValue = txtHoTen1.Text

            Try

                If txtTaiKhoan1.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.' + txtTaiKhoan.Text);", True)
                ElseIf txtMaKhau1.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.' + txtTaiKhoan.Text);", True)
                ElseIf txtHoTen1.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.' + txtTaiKhoan.Text);", True)
                Else
                    SqlDataSource1.Update()
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