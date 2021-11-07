Imports System.Text
Public Class hrU02_ChungChi
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Session("LoginOK") Then
            Response.Redirect("/Login.aspx")
        End If
        lblMaNhanVien.Text = Session("MaNhanVien")
        panelPhanQuyen.Visible = True
        panelThongBao.Visible = False
        panelError.Visible = False
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
        '(([SoChungChi], [TenChungChi], [CapBac], [NgayCap], [ThoiHan], [DonViCap], [GhiChu], [DinhKem], [MaNhanVien], [MaLoai])
        Dim SoChungChi As String = txtSoChungChi.Text
        Dim TenChungChi As String = txtTenChungChi.Text
        Dim CapBac As String = txtCapBac.Text
        Dim NgayCap As String = txtNgayCap.Text
        Dim ThoiHan As String = txtThoiHan.Text
        Dim DonViCap As String = txtDonViCap.Text
        Dim GhiChu As String = txtGhiChu.Text
        Dim DinhKem As String = txtDinhKem.Text
        Dim MaNhanVien As String = Session("MaNhanVien")
        Dim MaLoai As String = ddlMaLoai.SelectedValue

        Dim parameters = SqlDataSource1.InsertParameters

        parameters("SoChungChi").DefaultValue = SoChungChi
        parameters("TenChungChi").DefaultValue = TenChungChi
        parameters("CapBac").DefaultValue = CapBac
        parameters("NgayCap").DefaultValue = NgayCap
        parameters("ThoiHan").DefaultValue = ThoiHan
        parameters("DonViCap").DefaultValue = DonViCap
        parameters("GhiChu").DefaultValue = GhiChu
        parameters("DinhKem").DefaultValue = DinhKem
        parameters("MaNhanVien").DefaultValue = MaNhanVien
        parameters("MaLoai").DefaultValue = MaLoai


        Try
            If (txtSoChungChi.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtTenChungChi.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            Else
                SqlDataSource1.Insert()
                txtSoChungChi.Text = ""
                txtTenChungChi.Text = ""
                txtCapBac.Text = ""
                txtNgayCap.Text = ""
                txtThoiHan.Text = ""
                txtDonViCap.Text = ""
                txtGhiChu.Text = ""
                txtDinhKem.Text = ""


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
    '(([SoChungChi], [TenChungChi], [CapBac], [NgayCap], [ThoiHan], [DonViCap], [GhiChu], [DinhKem], [MaNhanVien], [MaLoai])
    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        Dim Index As Integer = Convert.ToInt32(e.CommandArgument)
        If (e.CommandName.Equals("editRecord")) Then
            Dim gvrow As GridViewRow = GridView1.Rows(Index)
            txtMaChungChi1.Text = HttpUtility.HtmlDecode(gvrow.Cells(2).Text).ToString()
            txtSoChungChi1.Text = HttpUtility.HtmlDecode(gvrow.Cells(3).Text).ToString().Trim()
            txtTenChungChi1.Text = HttpUtility.HtmlDecode(gvrow.Cells(4).Text).ToString().Trim()
            txtCapBac1.Text = HttpUtility.HtmlDecode(gvrow.Cells(5).Text).ToString().Trim()
            txtNgayCap1.Text = HttpUtility.HtmlDecode(gvrow.Cells(6).Text).ToString().Trim()
            txtThoiHan1.Text = HttpUtility.HtmlDecode(gvrow.Cells(7).Text).ToString().Trim()
            txtDonViCap1.Text = HttpUtility.HtmlDecode(gvrow.Cells(8).Text).ToString().Trim()
            txtGhiChu1.Text = HttpUtility.HtmlDecode(gvrow.Cells(9).Text).ToString().Trim()
            txtDinhKem1.Text = HttpUtility.HtmlDecode(gvrow.Cells(10).Text).ToString().Trim()
            ddlMaLoai1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(11).Text).ToString()

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
        Dim MaChungChi As String = txtMaChungChi1.Text
        Dim SoChungChi As String = txtSoChungChi1.Text
        Dim TenChungChi As String = txtTenChungChi1.Text
        Dim CapBac As String = txtCapBac1.Text
        Dim NgayCap As String = txtNgayCap1.Text
        Dim ThoiHan As String = txtThoiHan1.Text
        Dim DonViCap As String = txtDonViCap1.Text
        Dim GhiChu As String = txtGhiChu1.Text
        Dim DinhKem As String = txtDinhKem1.Text
        Dim MaNhanVien As String = Session("MaNhanVien")
        Dim MaLoai As String = ddlMaLoai1.SelectedValue

        Dim parameters = SqlDataSource1.UpdateParameters

        parameters("MaChungChi").DefaultValue = MaChungChi
        parameters("SoChungChi").DefaultValue = SoChungChi
        parameters("TenChungChi").DefaultValue = TenChungChi
        parameters("CapBac").DefaultValue = CapBac
        parameters("NgayCap").DefaultValue = NgayCap
        parameters("ThoiHan").DefaultValue = ThoiHan
        parameters("DonViCap").DefaultValue = DonViCap
        parameters("GhiChu").DefaultValue = GhiChu
        parameters("DinhKem").DefaultValue = DinhKem
        parameters("MaNhanVien").DefaultValue = MaNhanVien
        parameters("MaLoai").DefaultValue = MaLoai
        Try
            If (txtSoChungChi1.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtTenChungChi1.Text = "") Then
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
            parameters("MaChungChi").DefaultValue = code

            Try
                SqlDataSource1.Delete()
            Catch ex As Exception
                ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Vui lòng kiểm tra lại.');", True)
            End Try
        End If
    End Sub
End Class