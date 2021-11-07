Public Class hrU05_ChamCong1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Session("LoginOK") Then
            Response.Redirect("/Login.aspx")
        End If
        lblMaSoChamCong.Text = Session("MaSoChamCong")
        lblMaDuAnChamCong.Text = Session("MaDuAnChamCong")
    End Sub
    'Mở modal thêm dữ liệu
    Protected Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
        Dim sb As StringBuilder = New StringBuilder()
        sb.Append("<script type='text/javascript'>")
        sb.Append("$('#addModal').modal('show');")
        sb.Append("</script>")
        ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "AddShowModalScript", sb.ToString(), False)
    End Sub
    'Lưu thêm dữ liệu
    Protected Sub btnAddRecord_Click(sender As Object, e As EventArgs) Handles btnAddRecord.Click
        '([NgayCong], [LoaiCong], [SoLuong], [GhiChu], [MaNhanSuDuAn], [PhanLoai]
        Dim NgayCong As String = txtNgayCong.Text
        Dim LoaiCong As String = ddlMaLoai.SelectedValue
        Dim SoLuong As String = txtSoLuong.Text
        Dim GhiChu As String = txtGhiChu.Text
        Dim MaNhanSuDuAn As String = lblMaSoChamCong.Text
        Dim PhanLoai As String = "TH"


        Dim parameters = SqlDataSource1.InsertParameters

        parameters("NgayCong").DefaultValue = NgayCong
        parameters("LoaiCong").DefaultValue = LoaiCong
        parameters("SoLuong").DefaultValue = SoLuong
        parameters("GhiChu").DefaultValue = GhiChu
        parameters("MaNhanSuDuAn").DefaultValue = MaNhanSuDuAn
        parameters("PhanLoai").DefaultValue = PhanLoai


        Try
            If (txtNgayCong.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)

            Else
                SqlDataSource1.Insert()
                txtNgayCong.Text = ""
                txtSoLuong.Text = "0"
                txtGhiChu.Text = ""

                Dim sb As StringBuilder = New StringBuilder()
                sb.Append("<script type='text/javascript'>")
                sb.Append("alert('Thêm thành công!');")
                sb.Append("$('#addModal').modal('hide');")
                sb.Append("</script>")
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "AddHideModalScript", sb.ToString(), False)
            End If
        Catch ex As Exception
            ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Vui long kiem tra lai');", True)
        End Try

    End Sub

    'Mở modal sửa, xóa
    '([MaChamCong], [NgayCong], [LoaiCong], [SoLuong], [GhiChu], [MaNhanSuDuAn], [PhanLoai]
    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        Dim Index As Integer = Convert.ToInt32(e.CommandArgument)
        If (e.CommandName.Equals("editRecord")) Then
            Dim gvrow As GridViewRow = GridView1.Rows(Index)
            txtMaChamCong1.Text = HttpUtility.HtmlDecode(gvrow.Cells(2).Text).ToString()
            txtNgayCong1.Text = HttpUtility.HtmlDecode(gvrow.Cells(3).Text).ToString().Trim()
            ddlMaLoai1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(4).Text).ToString()
            txtSoLuong1.Text = HttpUtility.HtmlDecode(gvrow.Cells(5).Text).ToString().Trim()
            txtGhiChu1.Text = HttpUtility.HtmlDecode(gvrow.Cells(6).Text).ToString().Trim()

            'lblResult.Visible = False
            Dim sb As StringBuilder = New StringBuilder()
            sb.Append("<script type='text/javascript'>")
            sb.Append("$('#editModal').modal('show');")
            sb.Append("</script>")
            ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "EditModalScript", sb.ToString(), False)

        ElseIf (e.CommandName.Equals("deleteRecord")) Then
            Dim code As String = GridView1.DataKeys(Index).Value.ToString()
            hfCode.Value = code
            Dim sb As StringBuilder = New StringBuilder()
            sb.Append("<script type='text/javascript'>")
            sb.Append("$('#deleteModal').modal('show');")
            sb.Append("</script>")
            ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "DeleteModalScript", sb.ToString(), False)
        End If
    End Sub
    'Lưu sửa dữ liệu
    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim MaChamCong As String = txtMaChamCong1.Text
        Dim NgayCong As String = txtNgayCong1.Text
        Dim LoaiCong As String = ddlMaLoai1.SelectedValue
        Dim SoLuong As String = txtSoLuong1.Text
        Dim GhiChu As String = txtGhiChu1.Text
        Dim MaNhanSuDuAn As String = lblMaSoChamCong.Text
        Dim PhanLoai As String = "TH"

        Dim parameters = SqlDataSource1.UpdateParameters

        parameters("MaChamCong").DefaultValue = MaChamCong
        parameters("NgayCong").DefaultValue = NgayCong
        parameters("LoaiCong").DefaultValue = LoaiCong
        parameters("SoLuong").DefaultValue = SoLuong
        parameters("GhiChu").DefaultValue = GhiChu
        parameters("MaNhanSuDuAn").DefaultValue = MaNhanSuDuAn
        parameters("PhanLoai").DefaultValue = PhanLoai

        Try
            If (txtNgayCong1.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)

            Else
                SqlDataSource1.Update()
                Dim sb As StringBuilder = New StringBuilder()
                sb.Append("<script type='text/javascript'>")
                sb.Append("alert('Đã cập nhật thành công!');")
                sb.Append("$('#editModal').modal('hide');")
                sb.Append("</script>")
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "EditHideModalScript", sb.ToString(), False)
            End If
        Catch ex As Exception
            ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Vui long kiem tra lai');", True)
        End Try
    End Sub

    'Lưu xóa dữ liệu
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

    'Hàm xóa dữ liệu
    Private Sub executeDelete(ByVal code As String)
        If IsValid Then
            Dim parameters = SqlDataSource1.DeleteParameters
            parameters("MaChamCong").DefaultValue = code

            Try
                SqlDataSource1.Delete()
            Catch ex As Exception
                ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Vui lòng kiểm tra lại.');", True)
            End Try
        End If
    End Sub
End Class