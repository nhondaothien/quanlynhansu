Public Class A_TaiKhoanDuAn
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
        '[Email], [MaDuAn], [pms]

        If IsValid Then
            Dim parameters = SqlDataSource2_ChiTietTaiKhoanDuAn.InsertParameters

            parameters("Email").DefaultValue = cbTaiKhoan.SelectedValue
            parameters("MaDuAn").DefaultValue = cbTenDuAn.SelectedValue
            parameters("pms").DefaultValue = cbPhanQuyen.SelectedValue

            Try
                SqlDataSource2_ChiTietTaiKhoanDuAn.Insert()
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

            txtMaSo1.Text = HttpUtility.HtmlDecode(gvrow.Cells(2).Text).ToString()
            cbTaiKhoan.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(3).Text).ToString()
            cbTenDuAn1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(4).Text).ToString().ToString()
            cbPhanQuyen1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(5).Text).ToString().Trim()

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
            Dim parameters = SqlDataSource2_ChiTietTaiKhoanDuAn.UpdateParameters

            parameters("MaSo").DefaultValue = txtMaSo1.Text
            parameters("Email").DefaultValue = cbTaiKhoan.SelectedValue
            parameters("MaDuAn").DefaultValue = cbTenDuAn1.SelectedValue
            parameters("pms").DefaultValue = cbPhanQuyen1.SelectedValue

            Try
                SqlDataSource2_ChiTietTaiKhoanDuAn.Update()
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
            Dim parameters = SqlDataSource2_ChiTietTaiKhoanDuAn.DeleteParameters
            parameters("MaSo").DefaultValue = code

            Try
                SqlDataSource2_ChiTietTaiKhoanDuAn.Delete()
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