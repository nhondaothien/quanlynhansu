Public Class A_TaiKhoanCongTy
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Session("LoginOK") Then
            Response.Redirect("A_Login.aspx")
        End If
        panelPhanQuyen.Visible = True
        panelThongBao.Visible = False
        panelError.Visible = False
    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim sb As StringBuilder = New StringBuilder()
        sb.Append("<script type='text/javascript'>")
        sb.Append("$('#addModal').modal('show');")
        sb.Append("</script>")
        ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "AddShowModalScript", sb.ToString(), False)
    End Sub

    Protected Sub btnAddRecord_Click(ByVal sender As Object, ByVal e As EventArgs)
        '[Email], [MaPhanHe], [Quyen], [MaCongTy]

        If IsValid Then
            Dim parameters = SqlDataSource2_PhanQuyenCongTy.InsertParameters

            parameters("Email").DefaultValue = cbEmail.SelectedValue
            parameters("MaPhanHe").DefaultValue = cbPhanHe.SelectedValue
            parameters("Quyen").DefaultValue = cbPhanQuyen.SelectedValue
            parameters("MaCongTy").DefaultValue = cbCongTy.SelectedValue

            Try
                SqlDataSource2_PhanQuyenCongTy.Insert()
                Dim sb As StringBuilder = New StringBuilder()
                sb.Append("<script type='text/javascript'>")
                sb.Append("alert('Thêm thành công!');")
                sb.Append("$('#addModal').modal('hide');")
                sb.Append("</script>")
                ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "AddHideModalScript", sb.ToString(), False)
            Catch __unusedException1__ As Exception
                ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Vui lòng kiểm tra lại.');", True)
            End Try
        End If
    End Sub

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs)
        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        '[MaBoPhan], [TenBoPhan], [MaChiNhanh]


        If e.CommandName.Equals("editRecord") Then
            Dim gvrow As GridViewRow = GridView1.Rows(index)

            txtId1.Text = HttpUtility.HtmlDecode(gvrow.Cells(2).Text).ToString()
            cbEmail1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(3).Text).ToString()
            cbPhanHe.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(4).Text).ToString().ToString()
            cbPhanQuyen1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(5).Text).ToString()
            cbCongTy1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(6).Text).ToString()

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
            Dim parameters = SqlDataSource2_PhanQuyenCongTy.UpdateParameters

            parameters("Id").DefaultValue = txtId1.Text
            parameters("Email").DefaultValue = cbEmail.SelectedValue
            parameters("MaPhanHe").DefaultValue = cbPhanHe.SelectedValue
            parameters("Quyen").DefaultValue = cbPhanQuyen.SelectedValue
            parameters("MaCongTy").DefaultValue = cbCongTy.SelectedValue

            Try
                SqlDataSource2_PhanQuyenCongTy.Update()
                Dim sb As StringBuilder = New StringBuilder()
                sb.Append("<script type='text/javascript'>")
                sb.Append("alert('Đã cập nhật thành công!');")
                sb.Append("$('#editModal').modal('hide');")
                sb.Append("</script>")
                ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "EditHideModalScript", sb.ToString(), False)
            Catch __unusedException1__ As Exception
                ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Vui lòng kiểm tra lại.');", True)
            End Try
        End If
    End Sub


    Private Sub executeDelete(ByVal code As String)
        If IsValid Then
            Dim parameters = SqlDataSource2_PhanQuyenCongTy.DeleteParameters
            parameters("Id").DefaultValue = code

            Try
                SqlDataSource2_PhanQuyenCongTy.Delete()
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