Imports System.Text
Public Class hrU00_NhanSu
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Session("LoginOK") Then
            Response.Redirect("/Login.aspx")
        End If
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
        '[MaNhanVien], [HoLot], [Ten], [NgaySinh], [NoiSinh],
        '[NguyenQuan], [GioiTinh], [TinhTrangHonNhan], [SoCon], [SoCMND], [NgayCap], 
        '[NoiCap], [DiaChiThuongTru], [DiaChiTamTru], [ChucVuHienTai], [NgayVaoLamViec],
        '
        '[NgayKetThucThuViec], [NgayKyHopDongLaoDong],
        '[DienThoai], [DiDong], [Email], [EmailCaNhan], [FaceBook], [SoBHXH], [MaSoThue],
        '[SoTaiKhoan], [HinhAnh], [BoPhanLamViecID],
        '[QuocTichID], [DanTocID], [TonGiaoID], [TrinhDoHocVanID],
        '[ThongBaoTrungTuyen], [QuyetDinhTuyenDung], [HoSo], [TinhTrang],
        '[NgayNghi], [MatKhau], [GhiChu]
        Dim MaNhanVien As String = txtMaNhanVien.Text
        Dim HoLot As String = txtHoLot.Text
        Dim Ten As String = txtTen.Text
        Dim NgaySinh As String = txtNgaySinh.Text
        Dim NoiSinh As String = txtNoiSinh.Text
        Dim NguyenQuan As String = txtNguyenQuan.Text
        Dim GioiTinh As String = cbGioiTinh.SelectedValue
        Dim TinhTrangHonNhan As String = cbTinhTrangHonNhan.SelectedValue
        Dim SoCon As String = txtSoCon.Text
        Dim SoCMND As String = txtSoCMND.Text
        Dim NgayCap As String = txtNgayCap.Text
        Dim NoiCap As String = txtNoiCap.Text
        Dim DiaChiThuongTru As String = txtThuongTru.Text
        Dim DiaChiTamTru As String = txtTamTru.Text
        Dim ChucVuHienTai As String = txtChucVu.Text
        Dim NgayVaoLamViec As String = txtNgayVaoLamViec.Text
        Dim NgayKetThucThuViec As String = txtNgayKetThucThuViec.Text
        Dim NgayKyHopDongLaoDong As String = txtNgayKyHopDongLaoDong.Text
        Dim DienThoai As String = txtDienThoai.Text
        Dim DiDong As String = txtDiDong.Text
        Dim Email As String = txtEmail.Text
        Dim EmailCaNhan As String = txtEmailCaNhan.Text
        Dim FaceBook As String = txtFacebook.Text
        Dim SoBHXH As String = txtSoBHXH.Text
        Dim MaSoThue As String = txtMaSoThue.Text
        Dim SoTaiKhoan As String = txtSoTaiKhoan.Text
        Dim HinhAnh As String = txtHinhAnh.Text
        Dim BoPhanLamViecID As String = cbBanNganh.SelectedValue
        Dim QuocTichID As String = cbQuocTich.SelectedValue
        Dim DanTocID As String = cbDanToc.SelectedValue
        Dim TonGiaoID As String = cbTonGiao.SelectedValue
        Dim TrinhDoHocVanID As String = cbTrinhDoHocVan.SelectedValue
        Dim ThongBaoTrungTuyen As String = txtThongBaoTrungTuyen.Text
        Dim QuyetDinhTuyenDung As String = txtQuyetDinhTuyenDung.Text
        Dim HoSo As String = txtHoSo.Text
        Dim TinhTrang As String = cbTinhTrang.SelectedValue
        Dim NgayNghi As String = txtNgayNghi.Text
        Dim MatKhau As String = txtMatKhau.Text
        Dim GhiChu As String = txtGhiChu.Text

        Dim parameters = SqlDataSource1_NhanSu.InsertParameters

        parameters("MaNhanVien").DefaultValue = MaNhanVien
        parameters("HoLot").DefaultValue = HoLot
        parameters("Ten").DefaultValue = Ten
        parameters("NgaySinh").DefaultValue = NgaySinh
        parameters("NoiSinh").DefaultValue = NoiSinh
        parameters("NguyenQuan").DefaultValue = NguyenQuan
        parameters("GioiTinh").DefaultValue = GioiTinh
        parameters("TinhTrangHonNhan").DefaultValue = TinhTrangHonNhan
        parameters("SoCon").DefaultValue = SoCon
        parameters("SoCMND").DefaultValue = SoCMND
        parameters("NgayCap").DefaultValue = NgayCap
        parameters("NoiCap").DefaultValue = NoiCap
        parameters("DiaChiThuongTru").DefaultValue = DiaChiThuongTru
        parameters("DiaChiTamTru").DefaultValue = DiaChiTamTru
        parameters("ChucVuHienTai").DefaultValue = ChucVuHienTai
        parameters("NgayVaoLamViec").DefaultValue = NgayVaoLamViec
        parameters("NgayKetThucThuViec").DefaultValue = NgayKetThucThuViec
        parameters("NgayKyHopDongLaoDong").DefaultValue = NgayKyHopDongLaoDong
        parameters("DienThoai").DefaultValue = DienThoai
        parameters("DiDong").DefaultValue = DiDong
        parameters("Email").DefaultValue = Email
        parameters("EmailCaNhan").DefaultValue = EmailCaNhan
        parameters("FaceBook").DefaultValue = FaceBook
        parameters("SoBHXH").DefaultValue = SoBHXH
        parameters("MaSoThue").DefaultValue = MaSoThue
        parameters("SoTaiKhoan").DefaultValue = SoTaiKhoan
        parameters("HinhAnh").DefaultValue = HinhAnh
        parameters("BoPhanLamViecID").DefaultValue = BoPhanLamViecID
        parameters("QuocTichID").DefaultValue = QuocTichID
        parameters("DanTocID").DefaultValue = DanTocID
        parameters("TonGiaoID").DefaultValue = TonGiaoID
        parameters("TrinhDoHocVanID").DefaultValue = TrinhDoHocVanID
        parameters("ThongBaoTrungTuyen").DefaultValue = ThongBaoTrungTuyen
        parameters("QuyetDinhTuyenDung").DefaultValue = QuyetDinhTuyenDung
        parameters("HoSo").DefaultValue = HoSo
        parameters("TinhTrang").DefaultValue = TinhTrang
        parameters("NgayNghi").DefaultValue = NgayNghi
        parameters("MatKhau").DefaultValue = MatKhau
        parameters("GhiChu").DefaultValue = GhiChu

        Try
            If MaNhanVien = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            Else
                SqlDataSource1_NhanSu.Insert()
                txtMaNhanVien.Text = ""
                txtHoLot.Text = ""
                txtTen.Text = ""
                txtNgaySinh.Text = ""
                txtNoiSinh.Text = ""
                txtNguyenQuan.Text = ""
                txtSoCon.Text = ""
                txtSoCMND.Text = ""
                txtNgayCap.Text = ""
                txtNoiCap.Text = ""
                txtThuongTru.Text = ""
                txtTamTru.Text = ""
                txtChucVu.Text = ""
                txtNgayVaoLamViec.Text = ""
                txtNgayKetThucThuViec.Text = ""
                txtNgayKyHopDongLaoDong.Text = ""
                txtDienThoai.Text = ""
                txtDiDong.Text = ""
                txtEmail.Text = ""
                txtEmailCaNhan.Text = ""
                txtFacebook.Text = ""
                txtSoBHXH.Text = ""
                txtMaSoThue.Text = ""
                txtSoTaiKhoan.Text = ""
                txtHinhAnh.Text = ""
                txtThongBaoTrungTuyen.Text = ""
                txtQuyetDinhTuyenDung.Text = ""
                txtHoSo.Text = ""
                txtNgayNghi.Text = ""
                txtMatKhau.Text = ""
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
    '[MaNhanVien], [HoLot], [Ten], [NgaySinh], [NoiSinh], [NguyenQuan], [GioiTinh], [TinhTrangHonNhan], [SoCon], [SoCMND], [NgayCap], 
    '[NoiCap], [DiaChiThuongTru], [DiaChiTamTru], [ChucVuHienTai], [NgayVaoLamViec], [NgayKetThucThuViec], [NgayKyHopDongLaoDong], 
    '[DienThoai], [DiDong], [Email], [EmailCaNhan], [FaceBook], [SoBHXH], [MaSoThue], [SoTaiKhoan], [HinhAnh], [BoPhanLamViecID], 
    '[QuocTichID], [DanTocID], [TonGiaoID], [TrinhDoHocVanID], [ThongBaoTrungTuyen], [QuyetDinhTuyenDung], [HoSo], [TinhTrang], 
    '[NgayNghi], [MatKhau], [GhiChu]
    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        Dim Index As Integer = Convert.ToInt32(e.CommandArgument)
        If (e.CommandName.Equals("editRecord")) Then
            Dim gvrow As GridViewRow = GridView1.Rows(Index)
            txtMaNhanVien1.Text = HttpUtility.HtmlDecode(gvrow.Cells(3).Text).ToString()
            txtHoLot1.Text = HttpUtility.HtmlDecode(gvrow.Cells(4).Text).ToString().Trim()
            txtTen1.Text = HttpUtility.HtmlDecode(gvrow.Cells(5).Text).ToString().Trim()
            txtNgaySinh1.Text = HttpUtility.HtmlDecode(gvrow.Cells(6).Text).ToString().Trim()
            txtNoiSinh1.Text = HttpUtility.HtmlDecode(gvrow.Cells(7).Text).ToString().Trim()
            txtNguyenQuan1.Text = HttpUtility.HtmlDecode(gvrow.Cells(8).Text).ToString().Trim()
            cbGioiTinh1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(9).Text).ToString()
            cbTinhTrangHonNhan1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(10).Text).ToString()
            txtSoCon1.Text = HttpUtility.HtmlDecode(gvrow.Cells(11).Text).ToString().Trim()
            txtSoCMND1.Text = HttpUtility.HtmlDecode(gvrow.Cells(12).Text).ToString().Trim()
            txtNgayCap1.Text = HttpUtility.HtmlDecode(gvrow.Cells(13).Text).ToString().Trim()
            txtNoiCap1.Text = HttpUtility.HtmlDecode(gvrow.Cells(14).Text).ToString().Trim()
            txtThuongTru1.Text = HttpUtility.HtmlDecode(gvrow.Cells(15).Text).ToString().Trim()
            txtTamTru1.Text = HttpUtility.HtmlDecode(gvrow.Cells(16).Text).ToString().Trim()
            txtChucVu1.Text = HttpUtility.HtmlDecode(gvrow.Cells(17).Text).ToString().Trim()
            txtNgayVaoLamViec1.Text = HttpUtility.HtmlDecode(gvrow.Cells(18).Text).ToString().Trim()
            txtNgayKetThucThuViec1.Text = HttpUtility.HtmlDecode(gvrow.Cells(19).Text).ToString().Trim()
            txtNgayKyHopDongLaoDong1.Text = HttpUtility.HtmlDecode(gvrow.Cells(20).Text).ToString().Trim()
            txtDienThoai1.Text = HttpUtility.HtmlDecode(gvrow.Cells(21).Text).ToString().Trim()
            txtDiDong1.Text = HttpUtility.HtmlDecode(gvrow.Cells(22).Text).ToString().Trim()
            txtEmail1.Text = HttpUtility.HtmlDecode(gvrow.Cells(23).Text).ToString().Trim()
            txtEmailCaNhan1.Text = HttpUtility.HtmlDecode(gvrow.Cells(24).Text).ToString().Trim()
            txtFacebook1.Text = HttpUtility.HtmlDecode(gvrow.Cells(25).Text).ToString().Trim()
            txtSoBHXH1.Text = HttpUtility.HtmlDecode(gvrow.Cells(26).Text).ToString().Trim()
            txtMaSoThue1.Text = HttpUtility.HtmlDecode(gvrow.Cells(27).Text).ToString().Trim()
            txtSoTaiKhoan1.Text = HttpUtility.HtmlDecode(gvrow.Cells(28).Text).ToString().Trim()
            txtHinhAnh1.Text = HttpUtility.HtmlDecode(gvrow.Cells(29).Text).ToString().Trim()
            cbBanNganh1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(30).Text).ToString()
            cbQuocTich1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(31).Text).ToString()
            cbDanToc1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(32).Text).ToString()
            cbTonGiao1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(33).Text).ToString()
            cbTrinhDoHocVan1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(34).Text).ToString()
            txtThongBaoTrungTuyen1.Text = HttpUtility.HtmlDecode(gvrow.Cells(35).Text).ToString().Trim()
            txtQuyetDinhTuyenDung1.Text = HttpUtility.HtmlDecode(gvrow.Cells(36).Text).ToString().Trim()
            txtHoSo1.Text = HttpUtility.HtmlDecode(gvrow.Cells(37).Text).ToString().Trim()
            cbTinhTrang1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(38).Text).ToString()
            txtNgayNghi1.Text = HttpUtility.HtmlDecode(gvrow.Cells(39).Text).ToString().Trim()
            txtMatKhau1.Text = HttpUtility.HtmlDecode(gvrow.Cells(40).Text).ToString().Trim()
            txtGhiChu1.Text = HttpUtility.HtmlDecode(gvrow.Cells(41).Text).ToString().Trim()

            lblResult.Visible = False
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
            Dim gvrow As GridViewRow = GridView1.Rows(Index)
            Session("MaNhanVien") = HttpUtility.HtmlDecode(gvrow.Cells(3).Text).ToString()
            lblMaNhanVien.Text = Session("MaNhanVien")
            Dim sb As StringBuilder = New StringBuilder()
            sb.Append("<script type='text/javascript'>")
            sb.Append("$('#selectModal').modal('show');")
            sb.Append("</script>")
            ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "SelectModalScript", sb.ToString(), False)
        End If
    End Sub
    'Lưu sửa dữ liệu
    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim MaNhanVien As String = txtMaNhanVien1.Text
        Dim HoLot As String = txtHoLot1.Text
        Dim Ten As String = txtTen1.Text
        Dim NgaySinh As String = txtNgaySinh1.Text
        Dim NoiSinh As String = txtNoiSinh1.Text
        Dim NguyenQuan As String = txtNguyenQuan1.Text
        Dim GioiTinh As String = cbGioiTinh1.SelectedValue
        Dim TinhTrangHonNhan As String = cbTinhTrangHonNhan1.SelectedValue
        Dim SoCon As String = txtSoCon1.Text
        Dim SoCMND As String = txtSoCMND1.Text
        Dim NgayCap As String = txtNgayCap1.Text
        Dim NoiCap As String = txtNoiCap1.Text
        Dim DiaChiThuongTru As String = txtThuongTru1.Text
        Dim DiaChiTamTru As String = txtTamTru1.Text
        Dim ChucVuHienTai As String = txtChucVu1.Text
        Dim NgayVaoLamViec As String = txtNgayVaoLamViec1.Text
        Dim NgayKetThucThuViec As String = txtNgayKetThucThuViec1.Text
        Dim NgayKyHopDongLaoDong As String = txtNgayKyHopDongLaoDong1.Text
        Dim DienThoai As String = txtDienThoai1.Text
        Dim DiDong As String = txtDiDong1.Text
        Dim Email As String = txtEmail1.Text
        Dim EmailCaNhan As String = txtEmailCaNhan1.Text
        Dim FaceBook As String = txtFacebook1.Text
        Dim SoBHXH As String = txtSoBHXH1.Text
        Dim MaSoThue As String = txtMaSoThue1.Text
        Dim SoTaiKhoan As String = txtSoTaiKhoan1.Text
        Dim HinhAnh As String = txtHinhAnh1.Text
        Dim BoPhanLamViecID As String = cbBanNganh1.SelectedValue
        Dim QuocTichID As String = cbQuocTich1.SelectedValue
        Dim DanTocID As String = cbDanToc1.SelectedValue
        Dim TonGiaoID As String = cbTonGiao1.SelectedValue
        Dim TrinhDoHocVanID As String = cbTrinhDoHocVan1.SelectedValue
        Dim ThongBaoTrungTuyen As String = txtThongBaoTrungTuyen1.Text
        Dim QuyetDinhTuyenDung As String = txtQuyetDinhTuyenDung1.Text
        Dim HoSo As String = txtHoSo1.Text
        Dim TinhTrang As String = cbTinhTrang1.SelectedValue
        Dim NgayNghi As String = txtNgayNghi1.Text
        Dim MatKhau As String = txtMatKhau1.Text
        Dim GhiChu As String = txtGhiChu1.Text

        Dim parameters = SqlDataSource1_NhanSu.UpdateParameters

        parameters("MaNhanVien").DefaultValue = MaNhanVien
        parameters("HoLot").DefaultValue = HoLot
        parameters("Ten").DefaultValue = Ten
        parameters("NgaySinh").DefaultValue = NgaySinh
        parameters("NoiSinh").DefaultValue = NoiSinh
        parameters("NguyenQuan").DefaultValue = NguyenQuan
        parameters("GioiTinh").DefaultValue = GioiTinh
        parameters("TinhTrangHonNhan").DefaultValue = TinhTrangHonNhan
        parameters("SoCon").DefaultValue = SoCon
        parameters("SoCMND").DefaultValue = SoCMND
        parameters("NgayCap").DefaultValue = NgayCap
        parameters("NoiCap").DefaultValue = NoiCap
        parameters("DiaChiThuongTru").DefaultValue = DiaChiThuongTru
        parameters("DiaChiTamTru").DefaultValue = DiaChiTamTru
        parameters("ChucVuHienTai").DefaultValue = ChucVuHienTai
        parameters("NgayVaoLamViec").DefaultValue = NgayVaoLamViec
        parameters("NgayKetThucThuViec").DefaultValue = NgayKetThucThuViec
        parameters("NgayKyHopDongLaoDong").DefaultValue = NgayKyHopDongLaoDong
        parameters("DienThoai").DefaultValue = DienThoai
        parameters("DiDong").DefaultValue = DiDong
        parameters("Email").DefaultValue = Email
        parameters("EmailCaNhan").DefaultValue = EmailCaNhan
        parameters("FaceBook").DefaultValue = FaceBook
        parameters("SoBHXH").DefaultValue = SoBHXH
        parameters("MaSoThue").DefaultValue = MaSoThue
        parameters("SoTaiKhoan").DefaultValue = SoTaiKhoan
        parameters("HinhAnh").DefaultValue = HinhAnh
        parameters("BoPhanLamViecID").DefaultValue = BoPhanLamViecID
        parameters("QuocTichID").DefaultValue = QuocTichID
        parameters("DanTocID").DefaultValue = DanTocID
        parameters("TonGiaoID").DefaultValue = TonGiaoID
        parameters("TrinhDoHocVanID").DefaultValue = TrinhDoHocVanID
        parameters("ThongBaoTrungTuyen").DefaultValue = ThongBaoTrungTuyen
        parameters("QuyetDinhTuyenDung").DefaultValue = QuyetDinhTuyenDung
        parameters("HoSo").DefaultValue = HoSo
        parameters("TinhTrang").DefaultValue = TinhTrang
        parameters("NgayNghi").DefaultValue = NgayNghi
        parameters("MatKhau").DefaultValue = MatKhau
        parameters("GhiChu").DefaultValue = GhiChu

        Try
            If txtMaNhanVien1.Text = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Các trường * không được để trống.');", True)

            Else
                SqlDataSource1_NhanSu.Update()
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
            Dim parameters = SqlDataSource1_NhanSu.DeleteParameters
            parameters("MaNhanVien").DefaultValue = code

            Try
                SqlDataSource1_NhanSu.Delete()
            Catch ex As Exception
                ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Vui lòng kiểm tra lại.');", True)
            End Try
        End If
    End Sub
End Class