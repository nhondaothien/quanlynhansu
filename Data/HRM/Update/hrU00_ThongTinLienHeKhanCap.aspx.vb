Public Class hrU00_ThongTinLienheKhanCap
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Session("LoginOK") Then
            Response.Redirect("/Login.aspx")
        End If
        panelPhanQuyen.Visible = True
        panelThongBao.Visible = False
        panelError.Visible = False
        cbNhanSu.SelectedValue = Session("MaNhanVien")

    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim sb As StringBuilder = New StringBuilder()
        sb.Append("<script type='text/javascript'>")
        sb.Append("$('#addModal').modal('show');")
        sb.Append("</script>")
        ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "AddShowModalScript", sb.ToString(), False)
    End Sub

    Protected Sub btnAddRecord_Click(ByVal sender As Object, ByVal e As EventArgs)
        '[NguoiLienHe], [QuanHe], [DienThoai], [DiDong], [DiaChi], [MaNhanVien]

        If IsValid Then
            Dim parameters = SqlDataSource1_LienHeKhanCap.InsertParameters

            parameters("NguoiLienHe").DefaultValue = txtNguoiLienHe.Text
            parameters("QuanHe").DefaultValue = txtQuanHe.Text
            parameters("DienThoai").DefaultValue = txtDienThoai.Text
            parameters("DiDong").DefaultValue = txtDiDong.Text
            parameters("DiaChi").DefaultValue = txtDiaChi.Text
            parameters("MaNhanVien").DefaultValue = cbNhanSu.SelectedValue

            Try

                If txtNguoiLienHe.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
                ElseIf txtQuanHe.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
                ElseIf txtDienThoai.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
                Else

                    SqlDataSource1_LienHeKhanCap.Insert()
                    txtNguoiLienHe.Text = ""
                    txtQuanHe.Text = ""
                    txtDienThoai.Text = ""
                    txtDiDong.Text = ""
                    txtDiaChi.Text = ""

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
        '[NguoiLienHe], [QuanHe], [DienThoai], [DiDong], [DiaChi], [MaNhanVien]


        If e.CommandName.Equals("editRecord") Then
            Dim gvrow As GridViewRow = GridView1.Rows(index)

            txtMaLienHe1.Text = HttpUtility.HtmlDecode(gvrow.Cells(2).Text).ToString()
            txtNguoiLienHe1.Text = HttpUtility.HtmlDecode(gvrow.Cells(3).Text).ToString().ToString()
            txtQuanHe1.Text = HttpUtility.HtmlDecode(gvrow.Cells(4).Text).ToString().ToString()
            txtDienThoai1.Text = HttpUtility.HtmlDecode(gvrow.Cells(5).Text).ToString().Trim()
            txtDiDong1.Text = HttpUtility.HtmlDecode(gvrow.Cells(6).Text).ToString().Trim()
            txtDiaChi1.Text = HttpUtility.HtmlDecode(gvrow.Cells(7).Text).ToString().Trim()
            cbNhanSu.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(8).Text).ToString().Trim()

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
            Dim parameters = SqlDataSource1_LienHeKhanCap.UpdateParameters

            parameters("MaLienHe").DefaultValue = txtMaLienHe1.Text
            parameters("NguoiLienHe").DefaultValue = txtNguoiLienHe1.Text
            parameters("QuanHe").DefaultValue = txtQuanHe1.Text
            parameters("DienThoai").DefaultValue = txtDienThoai1.Text
            parameters("DiDong").DefaultValue = txtDiDong1.Text
            parameters("DiaChi").DefaultValue = txtDiaChi1.Text
            parameters("MaNhanVien").DefaultValue = cbNhanSu.SelectedValue

            Try

                If txtNguoiLienHe1.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
                ElseIf txtQuanHe1.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
                ElseIf txtDienThoai1.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
                Else
                    SqlDataSource1_LienHeKhanCap.Update()
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
            Dim parameters = SqlDataSource1_LienHeKhanCap.DeleteParameters
            parameters("MaLienHe").DefaultValue = code

            Try
                SqlDataSource1_LienHeKhanCap.Delete()
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