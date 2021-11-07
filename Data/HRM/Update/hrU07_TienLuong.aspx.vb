Imports System.Text
Public Class hrU07_TienLuong
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
        '[Ngay], [GioCongChuan], [GioCongThucTe], [LuongCoBan], [HeSo], [PhuCap], [HoTroKhac], [BaoHiemBatBuoc], 
        '                           [ThueTNCN], [TangCa], [Khac], [GhiChu], [MaNhanVien]]
        Dim Ngay As String = txtNgay.Text
        Dim GioCongChuan As String = txtGioCongChuan.Text
        Dim GioCongThucTe As String = txtGioCongThucTe.Text
        Dim LuongCoBan As String = txtLuongCoBan.Text
        Dim HeSo As String = txtHeSo.Text
        Dim PhuCap As String = txtPhuCap.Text
        Dim HoTroKhac As String = txtHoTroKhac.Text
        Dim BaoHiemBatBuoc As String = ddlBaoHiemBatBuoc.SelectedValue
        Dim ThueTNCN As String = txtThueTNCN.Text
        Dim TangCa As String = txtTangCa.Text
        Dim Khac As String = txtKhac.Text
        Dim GhiChu As String = txtGhiChu.Text
        Dim MaNhanVien As String = Session("MaNhanVien")
        Dim parameters = SqlDataSource1.InsertParameters

        parameters("Ngay").DefaultValue = Ngay
        parameters("GioCongChuan").DefaultValue = GioCongChuan
        parameters("GioCongThucTe").DefaultValue = GioCongThucTe
        parameters("LuongCoBan").DefaultValue = LuongCoBan
        parameters("HeSo").DefaultValue = HeSo
        parameters("PhuCap").DefaultValue = PhuCap
        parameters("HoTroKhac").DefaultValue = HoTroKhac
        parameters("BaoHiemBatBuoc").DefaultValue = BaoHiemBatBuoc
        parameters("ThueTNCN").DefaultValue = ThueTNCN
        parameters("TangCa").DefaultValue = TangCa
        parameters("Khac").DefaultValue = Khac
        parameters("GhiChu").DefaultValue = GhiChu
        parameters("MaNhanVien").DefaultValue = MaNhanVien


        Try
            If (txtNgay.Text = "") Then
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
    '[Ngay], [GioCongChuan], [GioCongThucTe], [LuongCoBan], [HeSo], [PhuCap], [HoTroKhac], [BaoHiemBatBuoc], 
    '                           [ThueTNCN], [TangCa], [Khac], [GhiChu], [MaNhanVien]]
    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        Dim Index As Integer = Convert.ToInt32(e.CommandArgument)
        If (e.CommandName.Equals("editRecord")) Then
            Dim gvrow As GridViewRow = GridView1.Rows(Index)
            txtMaLuong1.Text = HttpUtility.HtmlDecode(gvrow.Cells(2).Text).ToString()
            txtNgay1.Text = HttpUtility.HtmlDecode(gvrow.Cells(3).Text).ToString().Trim()
            txtGioCongChuan1.Text = HttpUtility.HtmlDecode(gvrow.Cells(4).Text).ToString().Trim()
            txtGioCongThucTe1.Text = HttpUtility.HtmlDecode(gvrow.Cells(5).Text).ToString().Trim()
            txtLuongCoBan1.Text = HttpUtility.HtmlDecode(gvrow.Cells(6).Text).ToString().Trim()
            txtHeSo1.Text = HttpUtility.HtmlDecode(gvrow.Cells(7).Text).ToString().Trim()
            txtPhuCap1.Text = HttpUtility.HtmlDecode(gvrow.Cells(8).Text).ToString().Trim()
            txtHoTroKhac1.Text = HttpUtility.HtmlDecode(gvrow.Cells(9).Text).ToString().Trim()
            ddlBaoHiemBatBuoc1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(10).Text).ToString().Trim()
            txtThueTNCN1.Text = HttpUtility.HtmlDecode(gvrow.Cells(11).Text).ToString().Trim()
            txtTangCa1.Text = HttpUtility.HtmlDecode(gvrow.Cells(12).Text).ToString().Trim()
            txtKhac1.Text = HttpUtility.HtmlDecode(gvrow.Cells(13).Text).ToString().Trim()
            txtGhiChu1.Text = HttpUtility.HtmlDecode(gvrow.Cells(14).Text).ToString().Trim()

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
        Dim MaLuong As String = txtMaLuong1.Text
        Dim Ngay As String = txtNgay1.Text
        Dim GioCongChuan As String = txtGioCongChuan1.Text
        Dim GioCongThucTe As String = txtGioCongThucTe1.Text
        Dim LuongCoBan As String = txtLuongCoBan1.Text
        Dim HeSo As String = txtHeSo1.Text
        Dim PhuCap As String = txtPhuCap1.Text
        Dim HoTroKhac As String = txtHoTroKhac1.Text
        Dim BaoHiemBatBuoc As String = ddlBaoHiemBatBuoc1.SelectedValue
        Dim ThueTNCN As String = txtThueTNCN1.Text
        Dim TangCa As String = txtTangCa1.Text
        Dim Khac As String = txtKhac1.Text
        Dim GhiChu As String = txtGhiChu1.Text
        Dim MaNhanVien As String = Session("MaNhanVien")

        Dim parameters = SqlDataSource1.UpdateParameters
        parameters("MaLuong").DefaultValue = MaLuong
        parameters("Ngay").DefaultValue = Ngay
        parameters("GioCongChuan").DefaultValue = GioCongChuan
        parameters("GioCongThucTe").DefaultValue = GioCongThucTe
        parameters("LuongCoBan").DefaultValue = LuongCoBan
        parameters("HeSo").DefaultValue = HeSo
        parameters("PhuCap").DefaultValue = PhuCap
        parameters("HoTroKhac").DefaultValue = HoTroKhac
        parameters("BaoHiemBatBuoc").DefaultValue = BaoHiemBatBuoc
        parameters("ThueTNCN").DefaultValue = ThueTNCN
        parameters("TangCa").DefaultValue = TangCa
        parameters("Khac").DefaultValue = Khac
        parameters("GhiChu").DefaultValue = GhiChu
        parameters("MaNhanVien").DefaultValue = MaNhanVien

        Try
            If (txtMaLuong1.Text = "") Then
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
            parameters("MaLuong").DefaultValue = code

            Try
                SqlDataSource1.Delete()
            Catch ex As Exception
                ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Vui lòng kiểm tra lại.');", True)
            End Try
        End If
    End Sub
End Class