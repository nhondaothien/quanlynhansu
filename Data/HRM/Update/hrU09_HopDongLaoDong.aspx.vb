Imports System.Text
Public Class hrU09_HopDongLaoDong
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
        '-[SoHopDong], [TenHopDong], [LoaiHopDongID], [TuNgay], [DenNgay], [DiaDiemLamViec], 
        '[SoLaoDong], [MoTaCongViec], [ThoiGianLamViec], [DongPhuc], [PhuongTienDiLai], [LuongCoBan],
        '[PhuCapTrachNhiem], [HoTroKhac], [HinhThucTraLuong], [TangLuong], [Thuong], [DaoTao], [CheDoNghiNgoi],
        '[BaoHiem], [NgayKy], [TinhTrang], [MaNhanVien], [NguoiSuDungLaoDong], [ChucVu]
        Dim SoHopDong As String = txtSoHopDong.Text
        Dim TenHopDong As String = txtTenHopDong.Text
        Dim LoaiHopDongID As String = ddlLoaiHopDongID.SelectedValue
        Dim TuNgay As String = txtTuNgay.Text
        Dim DenNgay As String = txtDenNgay.Text
        Dim DiaDiemLamViec As String = txtDiaDiemLamViec.Text
        Dim SoLaoDong As String = txtSoLaoDong.Text
        Dim MoTaCongViec As String = txtMoTaCongViec.Text
        Dim ThoiGianLamViec As String = txtThoiGianLamViec.Text
        Dim DongPhuc As String = txtDongPhuc.Text
        Dim PhuongTienDiLai As String = txtPhuongTienDiLai.Text
        Dim LuongCoBan As String = txtLuongCoBan.Text
        Dim PhuCapTrachNhiem As String = txtPhuCapTrachNhiem.Text
        Dim HoTroKhac As String = txtHoTroKhac.Text
        Dim HinhThucTraLuong As String = txtHinhThucTraLuong.Text
        Dim TangLuong As String = txtTangLuong.Text
        Dim Thuong As String = txtThuong.Text
        Dim DaoTao As String = txtDaoTao.Text
        Dim CheDoNghiNgoi As String = txtCheDoNghiNgoi.Text
        Dim BaoHiem As String = txtBaoHiem.Text
        Dim NgayKy As String = txtNgayKy.Text
        Dim TinhTrang As String = txtTinhTrang.Text
        Dim MaNhanVien As String = Session("MaNhanVien")
        Dim NguoiSuDungLaoDong As String = txtNguoiSuDungLaoDong.Text
        Dim ChucVu As String = txtChucVu.Text


        Dim parameters = SqlDataSource1.InsertParameters

        parameters("SoHopDong").DefaultValue = SoHopDong
        parameters("TenHopDong").DefaultValue = TenHopDong
        parameters("LoaiHopDongID").DefaultValue = LoaiHopDongID
        parameters("TuNgay").DefaultValue = TuNgay
        parameters("DenNgay").DefaultValue = DenNgay
        parameters("DiaDiemLamViec").DefaultValue = DiaDiemLamViec
        parameters("SoLaoDong").DefaultValue = SoLaoDong
        parameters("MoTaCongViec").DefaultValue = MoTaCongViec
        parameters("ThoiGianLamViec").DefaultValue = ThoiGianLamViec
        parameters("DongPhuc").DefaultValue = DongPhuc
        parameters("PhuongTienDiLai").DefaultValue = PhuongTienDiLai
        parameters("LuongCoBan").DefaultValue = LuongCoBan
        parameters("PhuCapTrachNhiem").DefaultValue = PhuCapTrachNhiem
        parameters("HoTroKhac").DefaultValue = HoTroKhac
        parameters("HinhThucTraLuong").DefaultValue = HinhThucTraLuong
        parameters("TangLuong").DefaultValue = TangLuong
        parameters("Thuong").DefaultValue = Thuong
        parameters("DaoTao").DefaultValue = DaoTao
        parameters("CheDoNghiNgoi").DefaultValue = CheDoNghiNgoi
        parameters("BaoHiem").DefaultValue = BaoHiem
        parameters("NgayKy").DefaultValue = NgayKy
        parameters("TinhTrang").DefaultValue = TinhTrang
        parameters("MaNhanVien").DefaultValue = MaNhanVien
        parameters("NguoiSuDungLaoDong").DefaultValue = NguoiSuDungLaoDong
        parameters("ChucVu").DefaultValue = ChucVu



        Try
            If (txtSoHopDong.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtTenHopDong.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (ddlLoaiHopDongID.SelectedValue = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtTuNgay.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtDenNgay.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtDiaDiemLamViec.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtSoLaoDong.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtMoTaCongViec.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtThoiGianLamViec.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtDongPhuc.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtPhuongTienDiLai.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtLuongCoBan.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtPhuCapTrachNhiem.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtHoTroKhac.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtHinhThucTraLuong.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtTangLuong.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtThuong.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtDaoTao.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtCheDoNghiNgoi.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtBaoHiem.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtNgayKy.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtTinhTrang.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtNguoiSuDungLaoDong.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtChucVu.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            Else
                SqlDataSource1.Insert()
                txtSoHopDong.Text = ""
                txtTenHopDong.Text = ""
                txtTuNgay.Text = ""
                txtDenNgay.Text = ""
                txtDiaDiemLamViec.Text = ""
                txtSoLaoDong.Text = ""
                txtMoTaCongViec.Text = ""
                txtThoiGianLamViec.Text = ""
                txtDongPhuc.Text = ""
                txtPhuongTienDiLai.Text = ""
                txtLuongCoBan.Text = ""
                txtPhuCapTrachNhiem.Text = ""
                txtHoTroKhac.Text = ""
                txtHinhThucTraLuong.Text = ""
                txtTangLuong.Text = ""
                txtThuong.Text = ""
                txtDaoTao.Text = ""
                txtCheDoNghiNgoi.Text = ""
                txtBaoHiem.Text = ""
                txtNgayKy.Text = ""
                txtTinhTrang.Text = ""
                txtNguoiSuDungLaoDong.Text = ""
                txtChucVu.Text = ""


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
    '-[SoHopDong], [TenHopDong], [LoaiHopDongID], [TuNgay], [DenNgay], [DiaDiemLamViec], 
    '[SoLaoDong], [MoTaCongViec], [ThoiGianLamViec], [DongPhuc], [PhuongTienDiLai], [LuongCoBan],
    '[PhuCapTrachNhiem], [HoTroKhac], [HinhThucTraLuong], [TangLuong], [Thuong], [DaoTao], [CheDoNghiNgoi],
    '[BaoHiem], [NgayKy], [TinhTrang], [MaNhanVien], [NguoiSuDungLaoDong], [ChucVu]
    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        Dim Index As Integer = Convert.ToInt32(e.CommandArgument)
        If (e.CommandName.Equals("editRecord")) Then
            Dim gvrow As GridViewRow = GridView1.Rows(Index)
            txtMaHopDong1.Text = HttpUtility.HtmlDecode(gvrow.Cells(2).Text).ToString()
            txtSoHopDong1.Text = HttpUtility.HtmlDecode(gvrow.Cells(3).Text).ToString().Trim()
            txtTenHopDong1.Text = HttpUtility.HtmlDecode(gvrow.Cells(4).Text).ToString().Trim()
            ddlLoaiHopDongID1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(5).Text).ToString()
            txtTuNgay1.Text = HttpUtility.HtmlDecode(gvrow.Cells(6).Text).ToString().Trim()
            txtDenNgay1.Text = HttpUtility.HtmlDecode(gvrow.Cells(7).Text).ToString().Trim()
            txtDiaDiemLamViec1.Text = HttpUtility.HtmlDecode(gvrow.Cells(8).Text).ToString().Trim()
            txtSoLaoDong1.Text = HttpUtility.HtmlDecode(gvrow.Cells(9).Text).ToString().Trim()
            txtMoTaCongViec1.Text = HttpUtility.HtmlDecode(gvrow.Cells(10).Text).ToString().Trim()
            txtThoiGianLamViec1.Text = HttpUtility.HtmlDecode(gvrow.Cells(11).Text).ToString().Trim()
            txtDongPhuc1.Text = HttpUtility.HtmlDecode(gvrow.Cells(12).Text).ToString().Trim()
            txtPhuongTienDiLai1.Text = HttpUtility.HtmlDecode(gvrow.Cells(13).Text).ToString().Trim()
            txtLuongCoBan1.Text = HttpUtility.HtmlDecode(gvrow.Cells(14).Text).ToString().Trim()
            txtPhuCapTrachNhiem1.Text = HttpUtility.HtmlDecode(gvrow.Cells(15).Text).ToString().Trim()
            txtHoTroKhac1.Text = HttpUtility.HtmlDecode(gvrow.Cells(16).Text).ToString().Trim()
            txtHinhThucTraLuong1.Text = HttpUtility.HtmlDecode(gvrow.Cells(17).Text).ToString().Trim()
            txtTangLuong1.Text = HttpUtility.HtmlDecode(gvrow.Cells(18).Text).ToString().Trim()
            txtThuong1.Text = HttpUtility.HtmlDecode(gvrow.Cells(19).Text).ToString().Trim()
            txtDaoTao1.Text = HttpUtility.HtmlDecode(gvrow.Cells(20).Text).ToString().Trim()
            txtCheDoNghiNgoi1.Text = HttpUtility.HtmlDecode(gvrow.Cells(21).Text).ToString().Trim()
            txtBaoHiem1.Text = HttpUtility.HtmlDecode(gvrow.Cells(22).Text).ToString().Trim()
            txtNgayKy1.Text = HttpUtility.HtmlDecode(gvrow.Cells(23).Text).ToString().Trim()
            txtTinhTrang1.Text = HttpUtility.HtmlDecode(gvrow.Cells(24).Text).ToString().Trim()
            txtNguoiSuDungLaoDong1.Text = HttpUtility.HtmlDecode(gvrow.Cells(25).Text).ToString().Trim()
            txtChucVu1.Text = HttpUtility.HtmlDecode(gvrow.Cells(26).Text).ToString().Trim()



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
        Dim MaHopDong As String = txtMaHopDong1.Text
        Dim SoHopDong As String = txtSoHopDong1.Text 'heredshhhhdsdsdsdsdgds
        Dim TenHopDong As String = txtTenHopDong1.Text
        Dim LoaiHopDongID As String = ddlLoaiHopDongID1.SelectedValue
        Dim TuNgay As String = txtTuNgay1.Text
        Dim DenNgay As String = txtDenNgay1.Text
        Dim DiaDiemLamViec As String = txtDiaDiemLamViec1.Text
        Dim SoLaoDong As String = txtSoLaoDong1.Text
        Dim MoTaCongViec As String = txtMoTaCongViec1.Text
        Dim ThoiGianLamViec As String = txtThoiGianLamViec1.Text
        Dim DongPhuc As String = txtDongPhuc1.Text
        Dim PhuongTienDiLai As String = txtPhuongTienDiLai1.Text
        Dim LuongCoBan As String = txtLuongCoBan1.Text
        Dim PhuCapTrachNhiem As String = txtPhuCapTrachNhiem1.Text
        Dim HoTroKhac As String = txtHoTroKhac1.Text
        Dim HinhThucTraLuong As String = txtHinhThucTraLuong1.Text
        Dim TangLuong As String = txtTangLuong1.Text
        Dim Thuong As String = txtThuong1.Text
        Dim DaoTao As String = txtDaoTao1.Text
        Dim CheDoNghiNgoi As String = txtCheDoNghiNgoi1.Text
        Dim BaoHiem As String = txtBaoHiem1.Text
        Dim NgayKy As String = txtNgayKy1.Text
        Dim TinhTrang As String = txtTinhTrang1.Text
        Dim MaNhanVien As String = Session("MaNhanVien")
        Dim NguoiSuDungLaoDong As String = txtNguoiSuDungLaoDong1.Text
        Dim ChucVu As String = txtChucVu1.Text

        Dim parameters = SqlDataSource1.UpdateParameters

        parameters("MaHopDong").DefaultValue = MaHopDong
        parameters("SoHopDong").DefaultValue = SoHopDong
        parameters("TenHopDong").DefaultValue = TenHopDong
        parameters("LoaiHopDongID").DefaultValue = LoaiHopDongID
        parameters("TuNgay").DefaultValue = TuNgay
        parameters("DenNgay").DefaultValue = DenNgay
        parameters("DiaDiemLamViec").DefaultValue = DiaDiemLamViec
        parameters("SoLaoDong").DefaultValue = SoLaoDong
        parameters("MoTaCongViec").DefaultValue = MoTaCongViec
        parameters("ThoiGianLamViec").DefaultValue = ThoiGianLamViec
        parameters("DongPhuc").DefaultValue = DongPhuc
        parameters("PhuongTienDiLai").DefaultValue = PhuongTienDiLai
        parameters("LuongCoBan").DefaultValue = LuongCoBan
        parameters("PhuCapTrachNhiem").DefaultValue = PhuCapTrachNhiem
        parameters("HoTroKhac").DefaultValue = HoTroKhac
        parameters("HinhThucTraLuong").DefaultValue = HinhThucTraLuong
        parameters("TangLuong").DefaultValue = TangLuong
        parameters("Thuong").DefaultValue = Thuong
        parameters("DaoTao").DefaultValue = DaoTao
        parameters("CheDoNghiNgoi").DefaultValue = CheDoNghiNgoi
        parameters("BaoHiem").DefaultValue = BaoHiem
        parameters("NgayKy").DefaultValue = NgayKy
        parameters("TinhTrang").DefaultValue = TinhTrang
        parameters("MaNhanVien").DefaultValue = MaNhanVien
        parameters("NguoiSuDungLaoDong").DefaultValue = NguoiSuDungLaoDong
        parameters("ChucVu").DefaultValue = ChucVu
        Try
            If (txtMaHopDong1.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtSoHopDong1.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtTenHopDong1.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (ddlLoaiHopDongID1.SelectedValue = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtTuNgay1.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtDenNgay1.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtDiaDiemLamViec1.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtSoLaoDong1.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtMoTaCongViec1.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtThoiGianLamViec1.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtDongPhuc1.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtPhuongTienDiLai1.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtLuongCoBan1.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtPhuCapTrachNhiem1.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtHoTroKhac1.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtHinhThucTraLuong1.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtTangLuong1.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtThuong1.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtDaoTao1.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtCheDoNghiNgoi1.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtBaoHiem1.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtNgayKy1.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtTinhTrang1.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtNguoiSuDungLaoDong1.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            ElseIf (txtChucVu1.Text = "") Then
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
            parameters("MaHopDong").DefaultValue = code

            Try
                SqlDataSource1.Delete()
            Catch ex As Exception
                ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Vui lòng kiểm tra lại.');", True)
            End Try
        End If
    End Sub
End Class