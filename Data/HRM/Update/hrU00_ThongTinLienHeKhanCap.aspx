<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrU00_ThongTinLienHeKhanCap.aspx.vb" Inherits="HRM.hrU00_ThongTinLienheKhanCap" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="panelPhanQuyen" runat="server">
        <div class="list-group mt-5">
            <div class="list-group-item active">
                CẬP NHẬT THÔNG TIN LIÊN HỆ KHẨN CẤP
            </div>

            <div class="list-group-item">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <table class="table table-active">
                            <tr>
                                <td>
                                    <asp:DropDownList ID="cbNhanSu" CssClass="form-control" runat="server" DataSourceID="SqlDataSource_NhanSu" DataTextField="HoTen" DataValueField="MaNhanVien" AutoPostBack="True">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn mauxanh" ToolTip="Thêm mới" OnClick="btnAdd_Click"><i class="fe-plus-square"></i> New</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-responsive" OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="False" DataKeyNames="MaLienHe" DataSourceID="SqlDataSource1_LienHeKhanCap">
                            <Columns>
                                <asp:ButtonField CommandName="editRecord" ButtonType="Link" HeaderText="Sửa" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn mauvang btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" HeaderText="Xóa" Text='<i class="fe-trash-2"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn maudo btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:BoundField HeaderText="Mã Liên Hệ" DataField="MaLienHe" ReadOnly="True" SortExpression="MaLienHe" InsertVisible="False"></asp:BoundField>
                                <asp:BoundField HeaderText="Người Liên Hệ" DataField="NguoiLienHe" SortExpression="NguoiLienHe"></asp:BoundField>
                                <asp:BoundField HeaderText="Quan Hệ" DataField="QuanHe" SortExpression="QuanHe" />
                                <asp:BoundField DataField="DienThoai" HeaderText="Điện Thoại" SortExpression="DienThoai" />
                                <asp:BoundField DataField="DiDong" HeaderText="Di Động" SortExpression="DiDong" />
                                <asp:BoundField DataField="DiaChi" HeaderText="Địa Chỉ" SortExpression="DiaChi" />
                                <asp:BoundField DataField="MaNhanVien" HeaderText="Mã Nhân Viên" SortExpression="MaNhanVien" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

        </div>

        <!--Bắt đầu Thêm -->
        <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalScrollableTitle">Add</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true"><b>&times;</b></span>
                        </button>
                    </div>
                    <asp:UpdatePanel ID="upAdd" runat="server">
                        <ContentTemplate>
                            <div class="modal-body p-4">
                                <%--[NguoiLienHe], [QuanHe], [DienThoai], [DiDong], [DiaChi], [MaNhanVien]--%>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Người Liên Hệ (*)</label>
                                            <asp:TextBox ID="txtNguoiLienHe" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Quan Hệ (*)</label>
                                            <asp:TextBox ID="txtQuanHe" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Điện Thoại (*)</label>
                                            <asp:TextBox ID="txtDienThoai" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Di Động </label>
                                            <asp:TextBox ID="txtDiDong" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Địa Chỉ </label>
                                            <asp:TextBox ID="txtDiaChi" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:LinkButton ID="btnAddRecord" runat="server" CssClass="btn mauxanh" OnClick="btnAddRecord_Click"><i class="fe-save"></i> Lưu</asp:LinkButton>
                                <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i>Đóng</button>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnAddRecord" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

        <!--Kết thúc thêm-->

        <!--Bắt đầu Sửa -->
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Edit</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <asp:UpdatePanel ID="upEdit" runat="server">
                        <ContentTemplate>
                            <div class="modal-body p-4">
                                <%--[NguoiLienHe], [QuanHe], [DienThoai], [DiDong], [DiaChi], [MaNhanVien]--%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Mã Liên Hệ (*)</label>
                                            <asp:TextBox ID="txtMaLienHe1" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Người Liên Hệ (*)</label>
                                            <asp:TextBox ID="txtNguoiLienHe1" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Quan Hệ (*)</label>
                                            <asp:TextBox ID="txtQuanHe1" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Điện Thoại (*)</label>
                                            <asp:TextBox ID="txtDienThoai1" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Di Động </label>
                                            <asp:TextBox ID="txtDiDong1" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Địa Chỉ </label>
                                            <asp:TextBox ID="txtDiaChi1" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Label ID="lblResult" Visible="false" runat="server"></asp:Label>
                                <asp:LinkButton ID="btnSave" runat="server" CssClass="btn mauxanh" OnClick="btnSave_Click"><i class="fe-save"></i> Cập nhật</asp:LinkButton>
                                <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i>Đóng</button>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
                            <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <!-- Kết thúc sửa -->

        <!--Bắt đầu Xóa-->
        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteModalLabel">Delete</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <asp:UpdatePanel ID="upDel" runat="server">
                        <ContentTemplate>
                            <div class="modal-body">
                                Bạn có chắc xóa dữ liệu này?
                                    <asp:HiddenField ID="hfCode" runat="server" />
                            </div>
                            <div class="modal-footer">
                                <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn maudo" OnClick="btnDelete_Click"><i class="fe-trash-2"></i> Xóa</asp:LinkButton>
                                <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i>Đóng</button>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <!--Kết thúc xóa -->

        <div>
            <asp:SqlDataSource ID="SqlDataSource1_LienHeKhanCap" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT * FROM [hr_LienHeKhanCap] WHERE ([MaNhanVien] = @MaNhanVien)" DeleteCommand="DELETE FROM [hr_LienHeKhanCap] WHERE [MaLienHe] = @MaLienHe" InsertCommand="INSERT INTO [hr_LienHeKhanCap] ([NguoiLienHe], [QuanHe], [DienThoai], [DiDong], [DiaChi], [MaNhanVien]) VALUES (@NguoiLienHe, @QuanHe, @DienThoai, @DiDong, @DiaChi, @MaNhanVien)" UpdateCommand="UPDATE [hr_LienHeKhanCap] SET [NguoiLienHe] = @NguoiLienHe, [QuanHe] = @QuanHe, [DienThoai] = @DienThoai, [DiDong] = @DiDong, [DiaChi] = @DiaChi, [MaNhanVien] = @MaNhanVien WHERE [MaLienHe] = @MaLienHe">
                <DeleteParameters>
                    <asp:Parameter Name="MaLienHe" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="NguoiLienHe" Type="String" />
                    <asp:Parameter Name="QuanHe" Type="String" />
                    <asp:Parameter Name="DienThoai" Type="String" />
                    <asp:Parameter Name="DiDong" Type="String" />
                    <asp:Parameter Name="DiaChi" Type="String" />
                    <asp:Parameter Name="MaNhanVien" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="cbNhanSu" Name="MaNhanVien" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="NguoiLienHe" Type="String" />
                    <asp:Parameter Name="QuanHe" Type="String" />
                    <asp:Parameter Name="DienThoai" Type="String" />
                    <asp:Parameter Name="DiDong" Type="String" />
                    <asp:Parameter Name="DiaChi" Type="String" />
                    <asp:Parameter Name="MaNhanVien" Type="String" />
                    <asp:Parameter Name="MaLienHe" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource_NhanSu" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT hr_NhanVien.MaNhanVien, hr_NhanVien.MaNhanVien + '_' + hr_NhanVien.HoLot + ' ' + hr_NhanVien.Ten AS HoTen, hr_CongTy.MaCongTy FROM hr_NhanVien INNER JOIN hr_BoPhanLamViec ON hr_NhanVien.BoPhanLamViecID = hr_BoPhanLamViec.MaBoPhan CROSS JOIN hr_CongTy WHERE (hr_CongTy.MaCongTy = @MaCongTy)">
                <SelectParameters>
                    <asp:SessionParameter Name="MaCongTy" SessionField="MaCongTy" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

    </asp:Panel>
    <asp:Panel ID="panelThongBao" runat="server" Visible="False">
        <h4 class="alert alert-warning" role="alert">Sorry. You don't authorize to access this page. Please contact your admin.</h4>
    </asp:Panel>
    <asp:Panel ID="panelError" runat="server" Visible="True">
        <h4 class="alert alert-warning" role="alert">
            <asp:Label ID="lblError" runat="server" Text=""></asp:Label></h4>
    </asp:Panel>
</asp:Content>

