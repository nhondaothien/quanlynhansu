Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.OleDb
Imports System.Configuration
Imports System.Data.Common
Imports CKFinder
Public Class A_CongTy
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Session("LoginOK") Then
            Response.Redirect("A_Login.aspx")
        End If
        panelPhanQuyen.Visible = True
        panelThongBao.Visible = False
        panelError.Visible = False
    End Sub
    '([TenCongTy], [DiaChiTruSoChinh], [MaSoThue], [DiaChiVanPhongLamViec], [DienThoai], [Fax], [Email], [Website], [Logo])
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
                                    bulkCopy.DestinationTableName = "hr_CongTy"
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
        '[MaCongTy], [TenCongTy], [DiaChiTruSoChinh], [MaSoThue], 
        '[DiaChiVanPhongLamViec], [DienThoai], [Fax], [Email], [Website], [Logo]

        If IsValid Then
            Dim parameters = SqlDataSource1.InsertParameters

            parameters("MaCongTy").DefaultValue = txtMaCongTy.Text
            parameters("TenCongTy").DefaultValue = txtTenCongTy.Text
            parameters("DiaChiTruSoChinh").DefaultValue = txtDiaChiTruSoChinh.Text
            parameters("MaSoThue").DefaultValue = txtMaSoThue.Text
            parameters("DiaChiVanPhongLamViec").DefaultValue = txtDiaChiVanPhongLamViec.Text
            parameters("DienThoai").DefaultValue = txtDienThoai.Text
            parameters("Fax").DefaultValue = txtFax.Text
            parameters("Email").DefaultValue = txtEmail.Text
            parameters("Website").DefaultValue = txtWebsite.Text
            parameters("Logo").DefaultValue = txtLogo.Text


            Try

                If txtMaCongTy.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
                ElseIf txtTenCongTy.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
                ElseIf txtMaSoThue.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
                Else

                    SqlDataSource1.Insert()
                    txtMaCongTy.Text = ""
                    txtTenCongTy.Text = ""
                    txtDiaChiTruSoChinh.Text = ""
                    txtMaSoThue.Text = ""
                    txtDiaChiVanPhongLamViec.Text = ""
                    txtDienThoai.Text = ""
                    txtFax.Text = ""
                    txtEmail.Text = ""
                    txtWebsite.Text = ""
                    txtLogo.Text = ""
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
        '[MaCongTy], [TenCongTy], [DiaChiTruSoChinh], [MaSoThue], 
        '[DiaChiVanPhongLamViec], [DienThoai], [Fax], [Email], [Website], [Logo]

        If e.CommandName.Equals("editRecord") Then
            Dim gvrow As GridViewRow = GridView1.Rows(index)

            txtMaCongTy1.Text = HttpUtility.HtmlDecode(gvrow.Cells(3).Text).ToString()
            txtTenCongTy1.Text = HttpUtility.HtmlDecode(gvrow.Cells(4).Text).ToString().ToString()
            txtDiaChiTruSoChinh1.Text = HttpUtility.HtmlDecode(gvrow.Cells(5).Text).ToString().Trim()
            txtMaSoThue1.Text = HttpUtility.HtmlDecode(gvrow.Cells(6).Text).ToString().Trim()
            txtDiaChiVanPhongLamViec1.Text = HttpUtility.HtmlDecode(gvrow.Cells(7).Text).ToString().Trim()
            txtDienThoai1.Text = HttpUtility.HtmlDecode(gvrow.Cells(8).Text).ToString().Trim()
            txtFax1.Text = HttpUtility.HtmlDecode(gvrow.Cells(9).Text).ToString().Trim()
            txtEmail1.Text = HttpUtility.HtmlDecode(gvrow.Cells(10).Text).ToString().Trim()
            txtWebsite1.Text = HttpUtility.HtmlDecode(gvrow.Cells(11).Text).ToString().Trim()
            txtLogo1.Text = HttpUtility.HtmlDecode(gvrow.Cells(12).Text).ToString().Trim()

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
        '[MaCongTy], [TenCongTy], [DiaChiTruSoChinh], [MaSoThue], 
        '[DiaChiVanPhongLamViec], [DienThoai], [Fax], [Email], [Website], [Logo]

        If IsValid Then
            Dim parameters = SqlDataSource1.UpdateParameters

            parameters("MaCongTy").DefaultValue = txtMaCongTy1.Text
            parameters("TenCongTy").DefaultValue = txtTenCongTy1.Text
            parameters("DiaChiTruSoChinh").DefaultValue = txtDiaChiTruSoChinh1.Text
            parameters("MaSoThue").DefaultValue = txtMaSoThue1.Text
            parameters("DiaChiVanPhongLamViec").DefaultValue = txtDiaChiVanPhongLamViec1.Text
            parameters("DienThoai").DefaultValue = txtDienThoai1.Text
            parameters("Fax").DefaultValue = txtFax1.Text
            parameters("Email").DefaultValue = txtEmail1.Text
            parameters("Website").DefaultValue = txtWebsite1.Text
            parameters("Logo").DefaultValue = txtLogo1.Text


            Try

                If txtMaCongTy1.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
                ElseIf txtTenCongTy1.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
                ElseIf txtMaSoThue1.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.');", True)
                Else
                    SqlDataSource1.Update()
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
        Search = "Select * From hr_CongTy Where (TenCongTy like N'%" + txtSearch.Text.ToString() + "%')"
        SqlDataSource1.SelectCommand = Search
    End Sub

    Private Sub executeDelete(ByVal code As String)
        If IsValid Then
            Dim parameters = SqlDataSource1.DeleteParameters
            parameters("MaCongTy").DefaultValue = code

            Try
                SqlDataSource1.Delete()
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