Imports System.Text
Public Class hrU01_BangCap
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Session("LoginOK") Then
            Response.Redirect("/Login.aspx")
        End If
        panelPhanQuyen.Visible = True
        panelThongBao.Visible = False
        panelError.Visible = False
        lblMaNhanVien.Text = Session("MaNhanVien")
    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim sb As StringBuilder = New StringBuilder()
        sb.Append("<script type='text/javascript'>")
        sb.Append("$('#addModal').modal('show');")
        sb.Append("</script>")
        ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "AddShowModalScript", sb.ToString(), False)
    End Sub

    Protected Sub btnAddRecord_Click(ByVal sender As Object, ByVal e As EventArgs)
        '[SoBang], [TenBang], [NgayCap], [DonViCap], [DinhKem], [MaNhanVien], [MaLoai]

        If IsValid Then
            Dim parameters = SqlDataSource1.InsertParameters
            parameters("SoBang").DefaultValue = txtSoBang.Text
            parameters("TenBang").DefaultValue = txtTenBang.Text
            parameters("NgayCap").DefaultValue = txtNgayCap.Text
            parameters("DonViCap").DefaultValue = txtDonViCap.Text
            parameters("DinhKem").DefaultValue = txtDinhKem.Text
            parameters("MaNhanVien").DefaultValue = lblMaNhanVien.Text
            parameters("MaLoai").DefaultValue = cbMaLoaiBangCap.SelectedValue

            Try

                If txtSoBang.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
                ElseIf txtTenBang.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
                Else
                    SqlDataSource1.Insert()

                    txtSoBang.Text = ""
                    txtTenBang.Text = ""
                    txtNgayCap.Text = ""
                    txtDonViCap.Text = ""
                    txtDinhKem.Text = ""

                    Dim sb As StringBuilder = New StringBuilder()
                    sb.Append("<script type='text/javascript'>")
                    sb.Append("alert('Thêm thành công!');")
                    sb.Append("$('#addModal').modal('hide');")
                    sb.Append("</script>")
                    ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "AddHideModalScript", sb.ToString(), False)
                End If

            Catch __unusedException1__ As Exception
                ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Vui lòng kiểm tra lại.');", True)
            End Try
        End If
    End Sub

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs)
        Dim index As Integer = Convert.ToInt32(e.CommandArgument)

        If e.CommandName.Equals("editRecord") Then
            Dim gvrow As GridViewRow = GridView1.Rows(index)
            txtMaBang1.Text = HttpUtility.HtmlDecode(gvrow.Cells(2).Text).ToString()
            txtSoBang1.Text = HttpUtility.HtmlDecode(gvrow.Cells(3).Text).ToString()
            txtTenBang1.Text = HttpUtility.HtmlDecode(gvrow.Cells(4).Text).ToString()
            txtNgayCap1.Text = HttpUtility.HtmlDecode(gvrow.Cells(5).Text).ToString()
            txtDonViCap1.Text = HttpUtility.HtmlDecode(gvrow.Cells(6).Text).ToString()
            txtDinhKem1.Text = HttpUtility.HtmlDecode(gvrow.Cells(7).Text).ToString()
            cbMaLoaiBangCap1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(8).Text).ToString().Trim()

            lblResult.Visible = False
            Dim sb As StringBuilder = New StringBuilder()
            sb.Append("<script type='text/javascript'>")
            sb.Append("$('#editModal').modal('show');")
            sb.Append("</script>")
            ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "EditModalScript", sb.ToString(), False)
        ElseIf e.CommandName.Equals("deleteRecord") Then
            Dim gvrow As GridViewRow = GridView1.Rows(index)
            Dim code As String = HttpUtility.HtmlDecode(gvrow.Cells(2).Text).ToString()
            hfCode.Value = code
            Dim sb As StringBuilder = New StringBuilder()
            sb.Append("<script type='text/javascript'>")
            sb.Append("$('#deleteModal').modal('show');")
            sb.Append("</script>")
            ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "DeleteModalScript", sb.ToString(), False)
        End If
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As EventArgs)
        If IsValid Then

            '[SoBang], [TenBang], [NgayCap], [DonViCap], [DinhKem], [MaNhanVien], [MaLoai]

            Dim parameters = SqlDataSource1.UpdateParameters
            parameters("MaBang").DefaultValue = txtMaBang1.Text
            parameters("SoBang").DefaultValue = txtSoBang1.Text
            parameters("TenBang").DefaultValue = txtTenBang1.Text
            parameters("NgayCap").DefaultValue = txtNgayCap1.Text
            parameters("DonViCap").DefaultValue = txtDonViCap1.Text
            parameters("DinhKem").DefaultValue = txtDinhKem1.Text
            parameters("MaNhanVien").DefaultValue = lblMaNhanVien.Text
            parameters("MaLoai").DefaultValue = cbMaLoaiBangCap1.SelectedValue

            Try

                If txtSoBang1.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
                ElseIf txtTenBang1.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
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

    Private Sub executeDelete(ByVal code As String)
        If IsValid Then
            Dim parameters = SqlDataSource1.DeleteParameters
            parameters("MaBang").DefaultValue = code

            Try
                SqlDataSource1.Delete()
            Catch __unusedException1__ As Exception
                ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Vui lòng kiểm tra lại.');", True)
            End Try
        End If
    End Sub

    Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim code As String = hfCode.Value
        executeDelete(code)
        Dim sb As StringBuilder = New StringBuilder()
        sb.Append("<script type='text/javascript'>")
        sb.Append("alert('Đã xóa thành công!');")
        sb.Append("$('#deleteModal').modal('hide');")
        sb.Append("</script>")
        ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "delHideModalScript", sb.ToString(), False)
    End Sub
End Class