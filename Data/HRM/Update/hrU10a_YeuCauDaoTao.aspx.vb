Public Class hrU10a_YeuCauDaoTao
    Inherits System.Web.UI.Page
    'MaChiNhanh + "/DT/" + Mid(NgayYeuCau, 3, 2) + "/" + MaYeuCau
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Session("LoginOK") Then
            Response.Redirect("/Login.aspx")
        End If
        cbMaNhanVien.SelectedValue = Session("MaNhanVien")
    End Sub

    Protected Sub btnSave1_Click(sender As Object, e As EventArgs) Handles btnSave1.Click
        'MaYeuCau, NoiDungDaoTao, TenKhoaHoc, DonViToChuc, ThoiGian, ChiPhiDuKien, DiaDiem, NguoiDangKy, TruongDonVi, PheDuyet, DonVi, MaChiNhanh, NgayYeuCau
        If txtMaYeuCau.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Vui long nhap Ma Yeu Cau!');", True)
        Else
            Dim MaYeuCau As String = txtMaYeuCau.Text
            Dim NgayYeuCau As String = txtNgayYeuCau.Text
            Dim NoiDungDaoTao As String = txtNoiDungDaoTao.Text
            Dim TenKhoaHoc As String = txtTenKhoaHoc.Text
            Dim DonViToChuc As String = txtDonViToChuc.Text
            Dim ThoiGian As String = txtThoiGian.Text
            Dim ChiPhiDuKien As String = txtChiPhiDuKien.Text
            Dim DiaDiem As String = txtDiaDiem.Text
            Dim NguoiDangKy As String = cbNguoiDangKy.SelectedValue
            Dim TruongDonVi As String = cbTruongDonVi.SelectedValue
            Dim PheDuyet As String = cbPheDuyet.SelectedValue
            Dim DonVi As String = cbDonVi.SelectedValue
            Dim MaChiNhanh As String = Session("MaChiNhanh")

            SqlDataSource_YeuCauDaoTao.InsertParameters("MaYeuCau").DefaultValue = MaChiNhanh + "/DT/" + Mid(NgayYeuCau, 3, 2) + "/" + MaYeuCau
            SqlDataSource_YeuCauDaoTao.InsertParameters("NoiDungDaoTao").DefaultValue = NoiDungDaoTao
            SqlDataSource_YeuCauDaoTao.InsertParameters("TenKhoaHoc").DefaultValue = TenKhoaHoc
            SqlDataSource_YeuCauDaoTao.InsertParameters("DonViToChuc").DefaultValue = DonViToChuc
            SqlDataSource_YeuCauDaoTao.InsertParameters("ThoiGian").DefaultValue = ThoiGian
            SqlDataSource_YeuCauDaoTao.InsertParameters("ChiPhiDuKien").DefaultValue = ChiPhiDuKien
            SqlDataSource_YeuCauDaoTao.InsertParameters("DiaDiem").DefaultValue = DiaDiem
            SqlDataSource_YeuCauDaoTao.InsertParameters("NguoiDangKy").DefaultValue = NguoiDangKy
            SqlDataSource_YeuCauDaoTao.InsertParameters("TruongDonVi").DefaultValue = TruongDonVi
            SqlDataSource_YeuCauDaoTao.InsertParameters("PheDuyet").DefaultValue = PheDuyet
            SqlDataSource_YeuCauDaoTao.InsertParameters("DonVi").DefaultValue = DonVi
            SqlDataSource_YeuCauDaoTao.InsertParameters("MaChiNhanh").DefaultValue = MaChiNhanh
            SqlDataSource_YeuCauDaoTao.InsertParameters("NgayYeuCau").DefaultValue = NgayYeuCau

            Try
                SqlDataSource_YeuCauDaoTao.Insert()
                txtMaYeuCau.Text = ""
                txtNoiDungDaoTao.Text = ""
                txtTenKhoaHoc.Text = ""
                txtDonViToChuc.Text = ""
                txtThoiGian.Text = ""
                txtChiPhiDuKien.Text = ""
                txtDiaDiem.Text = ""

            Catch ex As Exception
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Vui long kiem tra lai!');", True)
            End Try
        End If
    End Sub

    Protected Sub txtChiPhiDuKien_TextChanged(sender As Object, e As EventArgs) Handles txtChiPhiDuKien.TextChanged
        Dim amount As Double = Convert.ToDouble(txtChiPhiDuKien.Text.Trim())
        txtChiPhiDuKien.Text = FormatNumber(amount, 2, , , TriState.True)
    End Sub

    Protected Sub btnSave2_Click(sender As Object, e As EventArgs) Handles btnSave2.Click
        If lblMaYeuCau.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Vui long chon Ma Yeu Cau!');", True)
        ElseIf cbMaNhanVien.SelectedValue.ToString = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Vui long chon Nhan Vien!');", True)
        Else
            Dim MaYeuCau As String = lblMaYeuCau.Text
            Dim MaNhanVien As String = cbMaNhanVien.SelectedValue
            Dim Ngay As String = ""
            Dim SoLuong As String = 0
            Dim GhiChu As String = txtGhiChu.Text

            SqlDataSource_ChiTietYeuCauDaoTao.InsertParameters("MaYeuCau").DefaultValue = MaYeuCau
            SqlDataSource_ChiTietYeuCauDaoTao.InsertParameters("MaNhanVien").DefaultValue = MaNhanVien
            SqlDataSource_ChiTietYeuCauDaoTao.InsertParameters("Ngay").DefaultValue = Ngay
            SqlDataSource_ChiTietYeuCauDaoTao.InsertParameters("SoLuong").DefaultValue = SoLuong
            SqlDataSource_ChiTietYeuCauDaoTao.InsertParameters("GhiChu").DefaultValue = GhiChu

            Try
                SqlDataSource_ChiTietYeuCauDaoTao.Insert()
                txtGhiChu.Text = ""

            Catch ex As Exception
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Vui long kiem tra lai!');", True)
            End Try
        End If
    End Sub

    Protected Sub gv_DaoTao_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_DaoTao.SelectedIndexChanged
        Dim row As GridViewRow = gv_DaoTao.SelectedRow
        Dim MaYeuCau As String = row.Cells(1).Text
        lblMaYeuCau.Text = MaYeuCau
    End Sub

    Protected Sub gv_DaoTao_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles gv_DaoTao.RowUpdated
        If e.Exception IsNot Nothing Then
            Session("Error") = e.Exception.Message
            Response.Redirect("Error.aspx")
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        ElseIf e.AffectedRows = 0 Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Vui long kiem tra lai!');", True)
        End If
    End Sub

    Protected Sub gv_DaoTao_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles gv_DaoTao.RowDeleted
        If e.Exception IsNot Nothing Then
            Session("Error") = e.Exception.Message
            Response.Redirect("Error.aspx")
            e.ExceptionHandled = True
        ElseIf e.AffectedRows = 0 Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Vui long kiem tra lai!');", True)
        End If
    End Sub

    Protected Sub gv_ChiTietDaoTao_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles gv_ChiTietDaoTao.RowUpdated
        If e.Exception IsNot Nothing Then
            Session("Error") = e.Exception.Message
            Response.Redirect("Error.aspx")
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        ElseIf e.AffectedRows = 0 Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Vui long kiem tra lai!');", True)
        End If
    End Sub

    Protected Sub gv_ChiTietDaoTao_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles gv_ChiTietDaoTao.RowDeleted
        If e.Exception IsNot Nothing Then
            Session("Error") = e.Exception.Message
            Response.Redirect("Error.aspx")
            e.ExceptionHandled = True
        ElseIf e.AffectedRows = 0 Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Vui long kiem tra lai!');", True)
        End If
    End Sub
End Class