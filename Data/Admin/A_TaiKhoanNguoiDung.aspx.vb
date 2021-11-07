Imports System.Data.SqlClient
Imports System.Data.Common
Imports System.Data.OleDb
Public Class A_TaiKhoanNguoiDung
    Inherits System.Web.UI.Page

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
                        Dim path As String = String.Concat(Server.MapPath("../BulkFolder/"), FileUpload1.FileName)
                        FileUpload1.SaveAs(path)
                        Dim excelConnectionString As String = String.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=Excel 8.0", path)

                        Using connection As OleDbConnection = New OleDbConnection(excelConnectionString)
                            Dim command As OleDbCommand = New OleDbCommand("Select * FROM [Sheet1$]", connection)
                            connection.Open()

                            Using dr As DbDataReader = command.ExecuteReader()
                                Dim sqlConnectionString As String = ConfigurationManager.ConnectionStrings("DefaultConnection").ConnectionString

                                Using bulkCopy As SqlBulkCopy = New SqlBulkCopy(sqlConnectionString)
                                    bulkCopy.DestinationTableName = "A00_TaiKhoanNguoiDung"
                                    bulkCopy.WriteToServer(dr)
                                    panelError.Visible = True
                                    lblError.Text = "Dữ liệu bạn đã được import thành công!"
                                    GridView1.DataBind()
                                End Using
                            End Using
                        End Using

                        Dim sb As StringBuilder = New StringBuilder()
                        sb.Append("<script type='text/javascript'>")
                        sb.Append("alert('Thêm Thành công!');")
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
        '([Email], [MatKhau], [HoTen], [NgayTao], [TinhTrang])

        If IsValid Then
            Dim parameters = SqlDataSource1.InsertParameters
            parameters("Email").DefaultValue = txtEmail.Text
            parameters("MatKhau").DefaultValue = txtMaKhau.Text
            parameters("HoTen").DefaultValue = txtHoTen.Text
            parameters("NgayTao").DefaultValue = txtNgayTao.Text
            parameters("TinhTrang").DefaultValue = cbTinhTrang.SelectedValue

            Try

                If txtEmail.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.' );", True)
                ElseIf txtMaKhau.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.' );", True)
                ElseIf txtHoTen.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.' );", True)
                Else
                    SqlDataSource1.Insert()
                    txtEmail.Text = ""
                    txtMaKhau.Text = ""
                    txtHoTen.Text = ""
                    txtNgayTao.Text = ""
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

        If e.CommandName.Equals("editRecord") Then
            Dim gvrow As GridViewRow = GridView1.Rows(index)

            txtEmail1.Text = HttpUtility.HtmlDecode(gvrow.Cells(2).Text).ToString()
            txtMaKhau1.Text = HttpUtility.HtmlDecode(gvrow.Cells(3).Text).ToString()
            txtHoTen1.Text = HttpUtility.HtmlDecode(gvrow.Cells(4).Text).ToString().Trim()
            txtNgayTao1.Text = HttpUtility.HtmlDecode(gvrow.Cells(5).Text).ToString().Trim()
            cbTinhTrang1.SelectedValue = HttpUtility.HtmlDecode(gvrow.Cells(6).Text).ToString()

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
        '([Email], [MatKhau], [HoTen], [NgayTao], [TinhTrang])

        If IsValid Then

            Dim parameters = SqlDataSource1.UpdateParameters
            parameters("Email").DefaultValue = txtEmail1.Text
            parameters("MatKhau").DefaultValue = txtMaKhau1.Text
            parameters("HoTen").DefaultValue = txtHoTen1.Text
            parameters("NgayTao").DefaultValue = txtNgayTao1.Text
            parameters("TinhTrang").DefaultValue = cbTinhTrang1.SelectedValue

            Try

                If txtEmail1.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.' );", True)
                ElseIf txtMaKhau1.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.' );", True)
                ElseIf txtHoTen1.Text = "" Then
                    ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Các trường (*) không được bỏ trống.' );", True)
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

    Private Sub executeDelete(ByVal code As String)
        If IsValid Then
            Dim parameters = SqlDataSource1.DeleteParameters
            parameters("Email").DefaultValue = code

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