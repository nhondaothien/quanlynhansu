Imports System.Text
Public Class hrU06_PhepNam
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Session("LoginOK") Then
            Response.Redirect("/Login.aspx")
        End If
        lblMaNhanVien.Text = Session("MaNhanVien")
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
        '[NgayXinPhep], [LyDoNghi], [NguoiDuyet], [MaNhanVien], [BanGiao], [LienLac]
        Dim NgayXinPhep As String = txtNgayXinPhep.Text
        Dim LyDoNghi As String = txtLyDoNghi.Text
        Dim NguoiDuyet As String = ddlNguoiDuyet.SelectedValue
        Dim MaNhanVien As String = Session("MaNhanVien")
        Dim BanGiao As String = txtNgayXinPhep.Text
        Dim LienLac As String = txtLienLac.Text

        Dim parameters = SqlDataSource1.InsertParameters

        parameters("NgayXinPhep").DefaultValue = NgayXinPhep
        parameters("LyDoNghi").DefaultValue = LyDoNghi
        parameters("NguoiDuyet").DefaultValue = NguoiDuyet
        parameters("MaNhanVien").DefaultValue = MaNhanVien
        parameters("BanGiao").DefaultValue = BanGiao
        parameters("LienLac").DefaultValue = LienLac

        Try
            If (txtNgayXinPhep.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            Else
                SqlDataSource1.Insert()

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
    '([MaPhepNam], [NgayXinPhep], [LyDoNghi], [NguoiDuyet], [MaNhanVien], [BanGiao], [LienLac]
    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        Dim Index As Integer = Convert.ToInt32(e.CommandArgument)
        If (e.CommandName.Equals("editRecord")) Then
            Dim gvrow As GridViewRow = GridView1.Rows(Index)
            txtMaPhepNam1.Text = HttpUtility.HtmlDecode(gvrow.Cells(3).Text).ToString()
            txtNgayXinPhep1.Text = HttpUtility.HtmlDecode(gvrow.Cells(4).Text).ToString().Trim()
            txtLyDoNghi1.Text = HttpUtility.HtmlDecode(gvrow.Cells(5).Text).ToString().Trim()
            ddlNguoiDuyet1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(6).Text).ToString()
            txtBanGiao1.Text = HttpUtility.HtmlDecode(gvrow.Cells(7).Text).ToString().Trim()
            txtLienLac1.Text = HttpUtility.HtmlDecode(gvrow.Cells(8).Text).ToString().Trim()

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

        ElseIf (e.CommandName.Equals("selectRecord")) Then
            Dim code As String = GridView1.DataKeys(Index).Value.ToString()
            Dim gvrow As GridViewRow = GridView1.Rows(Index)
            Session("MaPhepNam") = HttpUtility.HtmlDecode(gvrow.Cells(3).Text).ToString()
            Response.Redirect("/Data/HRM/Update/hrU06a_ChiTietPhepNam.aspx")
        End If


    End Sub
    'Lưu sửa dữ liệu
    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim MaPhepNam As String = txtMaPhepNam1.Text
        Dim NgayXinPhep As String = txtNgayXinPhep1.Text
        Dim LyDoNghi As String = txtLyDoNghi1.Text
        Dim NguoiDuyet As String = ddlNguoiDuyet1.SelectedValue
        Dim MaNhanVien As String = Session("MaNhanVien")
        Dim BanGiao As String = txtNgayXinPhep1.Text
        Dim LienLac As String = txtLienLac1.Text

        Dim parameters = SqlDataSource1.UpdateParameters

        parameters("MaPhepNam").DefaultValue = MaPhepNam
        parameters("NgayXinPhep").DefaultValue = NgayXinPhep
        parameters("LyDoNghi").DefaultValue = LyDoNghi
        parameters("NguoiDuyet").DefaultValue = NguoiDuyet
        parameters("MaNhanVien").DefaultValue = MaNhanVien
        parameters("BanGiao").DefaultValue = BanGiao
        parameters("LienLac").DefaultValue = LienLac

        Try
            If (txtNgayXinPhep1.Text = "") Then
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
            parameters("MaPhepNam").DefaultValue = code

            Try
                SqlDataSource1.Delete()
            Catch ex As Exception
                ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Vui lòng kiểm tra lại.');", True)
            End Try
        End If
    End Sub
End Class