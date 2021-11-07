Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.OleDb
Imports System.Configuration
Imports System.Data.Common
Imports CKFinder

Public Class A_DuAn
    Inherits System.Web.UI.Page
    'Public Property FileBrowser1 As FileBrowser
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Session("LoginOK") Then
            Response.Redirect("A_Login.aspx")
        End If
        panelPhanQuyen.Visible = True
        panelThongBao.Visible = False
        panelError.Visible = False
    End Sub

    Protected Sub btnImport_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim sb As StringBuilder = New StringBuilder()
        sb.Append("<script type='text/javascript'>")
        sb.Append("$('#importModal').modal('show');")
        sb.Append("</script>")
        ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "ImportShowModalScript", sb.ToString(), False)
    End Sub

    Protected Sub btnImportRecord_Click(ByVal sender As Object, ByVal e As EventArgs)
        If IsValid Then
            Dim ExcelContentType As String = "application/vnd.ms-excel"
            Dim Excel2010ContentType As String = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"

            If FileUpload1.HasFile Then

                If FileUpload1.PostedFile.ContentType = ExcelContentType OrElse FileUpload1.PostedFile.ContentType = Excel2010ContentType Then

                    Try
                        Dim path As String = String.Concat(Server.MapPath("../../BulkFolder/"), FileUpload1.FileName)
                        FileUpload1.SaveAs(path)
                        Dim excelConnectionString As String = String.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=Excel 8.0", path)

                        Using connection As OleDbConnection = New OleDbConnection(excelConnectionString)
                            Dim command As OleDbCommand = New OleDbCommand("Select * FROM [Sheet1$]", connection)
                            connection.Open()

                            Using dr As DbDataReader = command.ExecuteReader()
                                Dim sqlConnectionString As String = ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString

                                Using bulkCopy As SqlBulkCopy = New SqlBulkCopy(sqlConnectionString)
                                    bulkCopy.DestinationTableName = "dts00_DuAn"
                                    bulkCopy.WriteToServer(dr)
                                    panelError.Visible = True
                                    lblError.Text = "The data has been exported succefuly from Excel to SQL"
                                    GridView1.DataBind()
                                End Using
                            End Using
                        End Using

                        Dim sb As StringBuilder = New StringBuilder()
                        sb.Append("<script type='text/javascript'>")
                        sb.Append("alert('Record Imported Successfully');")
                        sb.Append("$('#importModal').modal('hide');")
                        sb.Append("</script>")
                        ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "ImportHideModalScript", sb.ToString(), False)
                    Catch ex As Exception
                        panelError.Visible = True
                        lblError.Text = ex.Message
                    End Try
                End If
            End If
        End If
    End Sub
    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim sb As StringBuilder = New StringBuilder()
        sb.Append("<script type='text/javascript'>")
        sb.Append("$('#addModal').modal('show');")
        sb.Append("</script>")
        ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "AddShowModalScript", sb.ToString(), False)
    End Sub

    Protected Sub btnAddRecord_Click(ByVal sender As Object, ByVal e As EventArgs)
        '([MaDuAn], [TenDuAn], [ViTri], [DichVu], [SoHopDong],
        '[NgayKy], [BatDau], [KetThuc], [TinhTrang], [QuyMo],
        '[HinhAnh], [GhiChu], [MaKhachHang], [HoSoUrl])

        If IsValid Then
            Dim parameters = SqlDataSource1_DuAn.InsertParameters

            parameters("MaDuAn").DefaultValue = txtMaDuAn.Text
            parameters("TenDuAn").DefaultValue = txtTenDuAn.Text
            parameters("ViTri").DefaultValue = txtViTri.Text
            parameters("DichVu").DefaultValue = txtDichVu.Text
            parameters("SoHopDong").DefaultValue = txtSoHopDong.Text
            parameters("NgayKy").DefaultValue = txtNgayKy.Text
            parameters("BatDau").DefaultValue = txtBatDau.Text
            parameters("KetThuc").DefaultValue = txtKetThuc.Text
            parameters("TinhTrang").DefaultValue = cbTinhTrang.SelectedValue
            parameters("QuyMo").DefaultValue = txtQuyMo.Text
            parameters("HinhAnh").DefaultValue = txtHinhAnh.Text
            parameters("GhiChu").DefaultValue = txtGhiChu.Text
            parameters("MaKhachHang").DefaultValue = cbKhachHang.SelectedValue
            parameters("HoSoUrl").DefaultValue = txtHoSo.Text

            Try

                If txtMaDuAn.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
                ElseIf txtTenDuAn.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
                ElseIf txtViTri.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
                Else

                    SqlDataSource1_DuAn.Insert()
                    txtMaDuAn.Text = ""
                    txtTenDuAn.Text = ""
                    txtViTri.Text = ""
                    txtDichVu.Text = ""
                    txtSoHopDong.Text = ""
                    txtNgayKy.Text = ""
                    txtBatDau.Text = ""
                    txtKetThuc.Text = ""
                    txtQuyMo.Text = ""
                    txtHinhAnh.Text = ""
                    txtGhiChu.Text = ""
                    txtHoSo.Text = ""
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
        '([MaDuAn], [TenDuAn], [ViTri], [DichVu], [SoHopDong], [NgayKy],
        '[BatDau], [KetThuc], [TinhTrang], [QuyMo], [HinhAnh],
        '[GhiChu], [MaKhachHang], [HoSoUrl])

        If e.CommandName.Equals("editRecord") Then
            Dim gvrow As GridViewRow = GridView1.Rows(index)

            txtMaDuAn1.Text = HttpUtility.HtmlDecode(gvrow.Cells(3).Text).ToString()
            txtTenDuAn1.Text = HttpUtility.HtmlDecode(gvrow.Cells(4).Text).ToString().ToString()
            txtViTri1.Text = HttpUtility.HtmlDecode(gvrow.Cells(5).Text).ToString().Trim()
            txtDichVu1.Text = HttpUtility.HtmlDecode(gvrow.Cells(6).Text).ToString().Trim()
            txtSoHopDong1.Text = HttpUtility.HtmlDecode(gvrow.Cells(7).Text).ToString().Trim()
            txtNgayKy1.Text = HttpUtility.HtmlDecode(gvrow.Cells(8).Text).ToString().Trim()
            txtBatDau1.Text = HttpUtility.HtmlDecode(gvrow.Cells(9).Text).ToString().Trim()
            txtKetThuc1.Text = HttpUtility.HtmlDecode(gvrow.Cells(10).Text).ToString().Trim()
            cbTinhTrang1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(11).Text).ToString().Trim()
            txtQuyMo1.Text = HttpUtility.HtmlDecode(gvrow.Cells(12).Text).ToString().Trim()
            txtHinhAnh1.Text = HttpUtility.HtmlDecode(gvrow.Cells(13).Text).ToString().Trim()
            txtGhiChu1.Text = HttpUtility.HtmlDecode(gvrow.Cells(14).Text).ToString().Trim()
            cbKhachHang1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(15).Text).ToString().Trim()
            txtHoSo1.Text = HttpUtility.HtmlDecode(gvrow.Cells(16).Text).ToString().Trim()


            lblResult.Visible = False
            Dim sb As StringBuilder = New StringBuilder()
            sb.Append("<script type='text/javascript'>")
            sb.Append("$('#editModal').modal('show');")
            sb.Append("</script>")
            ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "EditModalScript", sb.ToString(), False)
        ElseIf e.CommandName.Equals("deleteRecord") Then
            Dim gvrow As GridViewRow = GridView1.Rows(index)
            Dim code As String = HttpUtility.HtmlDecode(gvrow.Cells(3).Text).ToString()
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
            Dim parameters = SqlDataSource1_DuAn.UpdateParameters
            parameters("MaDuAn").DefaultValue = txtMaDuAn1.Text
            parameters("TenDuAn").DefaultValue = txtTenDuAn1.Text
            parameters("ViTri").DefaultValue = txtViTri1.Text
            parameters("DichVu").DefaultValue = txtDichVu1.Text
            parameters("SoHopDong").DefaultValue = txtSoHopDong1.Text
            parameters("NgayKy").DefaultValue = txtNgayKy1.Text
            parameters("BatDau").DefaultValue = txtBatDau1.Text
            parameters("KetThuc").DefaultValue = txtKetThuc1.Text
            parameters("TinhTrang").DefaultValue = cbTinhTrang1.SelectedValue
            parameters("QuyMo").DefaultValue = txtQuyMo1.Text
            parameters("HinhAnh").DefaultValue = txtHinhAnh1.Text
            parameters("GhiChu").DefaultValue = txtGhiChu1.Text
            parameters("MaKhachHang").DefaultValue = cbKhachHang1.SelectedValue
            parameters("HoSoUrl").DefaultValue = txtHoSo1.Text

            Try

                If txtMaDuAn1.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
                ElseIf txtTenDuAn1.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
                ElseIf txtViTri1.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
                Else
                    SqlDataSource1_DuAn.Update()
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
    Protected Sub GridView1_DataBound(sender As Object, e As EventArgs) Handles GridView1.DataBound
        Try
            GridView1.SelectedIndex = 0
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub btnSeach(sender As Object, e As EventArgs) Handles btnSearch.Click
        Dim Search As String
        Search = "Select * From dts00_DuAn Where (TenDuAn like N'%" + txtSearch.Text.ToString() + "%')"
        SqlDataSource1_DuAn.SelectCommand = Search
    End Sub

    Private Sub executeDelete(ByVal code As String)
        If IsValid Then
            Dim parameters = SqlDataSource1_DuAn.DeleteParameters
            parameters("MaDuAn").DefaultValue = code

            Try
                SqlDataSource1_DuAn.Delete()
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

    'Protected Sub FileBrowser1_Load(ByVal sender As Object, ByVal e As EventArgs)
    '    FileBrowser1 = New CKFinder.FileBrowser()
    '    FileBrowser1.BasePath = "/ckfinder/"
    '    FileBrowser1.SetupCKEditor(txtQuyMo)
    'End Sub


End Class