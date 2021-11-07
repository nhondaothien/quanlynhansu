Imports System.Text
Public Class hrU04_CongTac
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
        '[ThoiGian], [CongTy], [ViTri], [MoTaCongViec], [MaNhanVien], [NgayBatDau]
        Dim ThoiGian As String = txtThoiGian.Text
        Dim CongTy As String = txtCongTy.Text
        Dim ViTri As String = txtViTri.Text
        Dim MoTaCongViec As String = txtMoTaCongViec.Text
        Dim MaNhanVien As String = lblMaNhanVien.Text
        Dim NgayBatDau As String = txtNgayBatDau.Text


        Dim parameters = SqlDataSource1.InsertParameters

        parameters("ThoiGian").DefaultValue = ThoiGian
        parameters("CongTy").DefaultValue = CongTy
        parameters("ViTri").DefaultValue = ViTri
        parameters("MaNhanVien").DefaultValue = MaNhanVien
        parameters("MoTaCongViec").DefaultValue = MoTaCongViec
        parameters("NgayBatDau").DefaultValue = NgayBatDau

        Try
            If (txtThoiGian.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            Else
                SqlDataSource1.Insert()
                txtThoiGian.Text = ""
                txtCongTy.Text = ""
                txtViTri.Text = ""
                txtMoTaCongViec.Text = ""
                txtNgayBatDau.Text = ""

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
    '[ThoiGian], [CongTy], [ViTri], [MoTaCongViec], [MaNhanVien], [NgayBatDau]
    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        Dim Index As Integer = Convert.ToInt32(e.CommandArgument)
        If (e.CommandName.Equals("editRecord")) Then
            Dim gvrow As GridViewRow = GridView1.Rows(Index)

            txtMaCongTac1.Text = HttpUtility.HtmlDecode(gvrow.Cells(2).Text).ToString()
            txtThoiGian1.Text = HttpUtility.HtmlDecode(gvrow.Cells(3).Text).ToString().Trim()
            txtCongTy1.Text = HttpUtility.HtmlDecode(gvrow.Cells(4).Text).ToString().Trim()
            txtViTri1.Text = HttpUtility.HtmlDecode(gvrow.Cells(5).Text).ToString().Trim()
            txtMoTaCongViec1.Text = HttpUtility.HtmlDecode(gvrow.Cells(6).Text).ToString().Trim()
            txtNgayBatDau1.Text = HttpUtility.HtmlDecode(gvrow.Cells(7).Text).ToString().Trim()


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
        Dim MaCongTac As String = txtMaCongTac1.Text
        Dim ThoiGian As String = txtThoiGian1.Text
        Dim CongTy As String = txtCongTy1.Text
        Dim ViTri As String = txtViTri1.Text
        Dim MoTaCongViec As String = txtMoTaCongViec1.Text
        Dim MaNhanVien As String = lblMaNhanVien.Text
        Dim NgayBatDau As String = txtNgayBatDau1.Text

        Dim parameters = SqlDataSource1.UpdateParameters

        parameters("MaCongTac").DefaultValue = MaCongTac
        parameters("ThoiGian").DefaultValue = ThoiGian
        parameters("CongTy").DefaultValue = CongTy
        parameters("ViTri").DefaultValue = ViTri
        parameters("MaNhanVien").DefaultValue = MaNhanVien
        parameters("MoTaCongViec").DefaultValue = MoTaCongViec
        parameters("NgayBatDau").DefaultValue = NgayBatDau

        Try
            If (txtMaCongTac1.Text = "") Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Cac truong * khong de trong.');", True)
            Else
                SqlDataSource1.Update()
                txtThoiGian1.Text = ""
                txtCongTy1.Text = ""
                txtViTri1.Text = ""
                txtMoTaCongViec1.Text = ""
                txtNgayBatDau1.Text = ""
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
            parameters("MaCongTac").DefaultValue = code

            Try
                SqlDataSource1.Delete()
            Catch ex As Exception
                ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Vui lòng kiểm tra lại.');", True)
            End Try
        End If
    End Sub
End Class