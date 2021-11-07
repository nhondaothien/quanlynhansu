<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrU10a_YeuCauDaoTao.aspx.vb" Inherits="HRM.hrU10a_YeuCauDaoTao" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        
     </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item active">
            CẬP NHẬT QUÁ TRÌNH ĐÀO TẠO
        </div>

        <div class="list-group-item document">
            <ul class="nav nav-tabs" id="myTab">
                <li class="active">
                    <a data-toggle="tab" href="#service-one">Đào Tạo</a>
                </li>
                <li>
                    <a data-toggle="tab" href="#service-two">Chi Tiết</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <%------------------------------------Tab Dao Tao----------------------------------------%>
                <div id="service-one" class="tab-pane fade in active" style="margin-top: 15px;">
                    <table class="table table-responsive">
                        <tr>
                            <td>
                                <asp:LinkButton ID="lbtnThem1" href="#myModal1" data-toggle="modal" class="btn btn-sm btn-primary" runat="server"><i class="fe-plus-square"></i> Thêm</asp:LinkButton></td>

                        </tr>
                    </table>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="gv_DaoTao" runat="server" AutoGenerateColumns="False" DataKeyNames="MaYeuCau" DataSourceID="SqlDataSource_YeuCauDaoTao" Width="2000px">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-xs mauxanh" CausesValidation="True" CommandName="Update" Text='<i class="fe-save"></i>'></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" CssClass="btn btn-xs mauxam" runat="server" CausesValidation="False" CommandName="Cancel" Text='<i class="glyphicon glyphicon-remove"></i>'></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-xs mauvang" CausesValidation="False" CommandName="Edit" Text='<i class="glyphicon glyphicon-edit"></i>'></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-xs maudo" CausesValidation="False" CommandName="Delete" Text='<i class="glyphicon glyphicon-trash"></i>'></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle Width="100px" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="MaYeuCau" HeaderText="Mã Yêu Cầu" ReadOnly="True" SortExpression="MaYeuCau" />
                                    <asp:TemplateField HeaderText="Ngày Yêu Cầu">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NgayYeuCau") %>'></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" BehaviorID="TextBox1_CalendarExtender" TargetControlID="TextBox1" Format="dd-MM-yyyy" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("NgayYeuCau", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="NoiDungDaoTao" HeaderText="Nội Dung Đào Tạo" SortExpression="NoiDungDaoTao" />
                                    <asp:BoundField DataField="TenKhoaHoc" HeaderText="Tên Khóa Học" SortExpression="TenKhoaHoc" />
                                    <asp:BoundField DataField="DonViToChuc" HeaderText="Đơn Vị Tổ Chức" SortExpression="DonViToChuc" />
                                    <asp:BoundField DataField="ThoiGian" HeaderText="Thời Gian" SortExpression="ThoiGian" />
                                    <asp:BoundField DataField="ChiPhiDuKien" HeaderText="Chi Phí Dự Kiến" SortExpression="ChiPhiDuKien" DataFormatString="{0:#,0.00;(#,0.00)}" />
                                    <asp:BoundField DataField="DiaDiem" HeaderText="Địa Điểm" SortExpression="DiaDiem" />
                                    <asp:BoundField DataField="NguoiDangKy" HeaderText="Người Đăng Ký" SortExpression="NguoiDangKy" />
                                    <asp:BoundField DataField="TruongDonVi" HeaderText="Trưởng Đơn Vị" SortExpression="TruongDonVi" />
                                    <asp:BoundField DataField="PheDuyet" HeaderText="Phê Duyệt" SortExpression="PheDuyet" />
                                    <asp:TemplateField HeaderText="Đơn Vị" SortExpression="DonVi">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource_DonVi" DataTextField="ChiNhanh" DataValueField="MaChiNhanh" SelectedValue='<%# Bind("DonVi") %>'>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("DonVi") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Mã Chi Nhánh" SortExpression="MaChiNhanh">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource_DonVi" DataTextField="ChiNhanh" DataValueField="MaChiNhanh" SelectedValue='<%# Bind("MaChiNhanh") %>'>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("MaChiNhanh") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <%------------------------------------Tab Chi Tiet Dao Tao----------------------------------------%>
                <div id="service-two" class="tab-pane fade" style="margin-top: 15px;">
                    <table class="table table-responsive">
                        <tr>
                            <td>
                                <asp:LinkButton ID="lbtnThem2" href="#myModal2" data-toggle="modal" class="btn btn-sm btn-primary" runat="server"><i class="fe-plus-square"></i> Thêm</asp:LinkButton></td>

                        </tr>
                    </table>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="gv_ChiTietDaoTao" runat="server" AutoGenerateColumns="False" DataKeyNames="MaChiTiet" DataSourceID="SqlDataSource_ChiTietYeuCauDaoTao" Width="100%">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-xs mauxanh" CausesValidation="True" CommandName="Update" Text='<i class="fe-save"></i>'></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" CssClass="btn btn-xs mauxam" runat="server" CausesValidation="False" CommandName="Cancel" Text='<i class="glyphicon glyphicon-remove"></i>'></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-xs maudo" CausesValidation="False" CommandName="Edit" Text='<i class="glyphicon glyphicon-edit"></i>'></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-xs mauvang" CausesValidation="False" CommandName="Delete" Text='<i class="glyphicon glyphicon-trash"></i>'></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle Width="100px" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="MaChiTiet" HeaderText="Mã Chi Tiết" InsertVisible="False" ReadOnly="True" SortExpression="MaChiTiet" />
                                    <asp:BoundField DataField="MaYeuCau" HeaderText="Mã Yêu Cầu" SortExpression="MaYeuCau" />
                                    <asp:TemplateField HeaderText="Mã Nhân Viên" SortExpression="MaNhanVien">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource_NhanVien" DataTextField="HoTen" DataValueField="MaNhanVien" SelectedValue='<%# Bind("MaNhanVien") %>'>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("MaNhanVien") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="GhiChu" HeaderText="Ghi Chú" SortExpression="GhiChu" />
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>

    <%------------------------------------Data----------------------------------------%>
    <div class="row">
        <div id="myModal1" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Thêm Mới</h4>
                    </div>
                    <div class="modal-body">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <div class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <asp:Label ID="Label2" runat="server" Text="Mã Yêu Cầu: (*)" CssClass="col-md-3 control-label"></asp:Label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="txtMaYeuCau" runat="server" placeholder="0001; 0002; 0003;..."></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label17" runat="server" Text="Ngày Yêu Cầu:" CssClass="col-md-3 control-label"></asp:Label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="txtNgayYeuCau" runat="server" TextMode="Date"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label1" runat="server" Text="Nội Dung Đào Tạo:" CssClass="col-md-3 control-label"></asp:Label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="txtNoiDungDaoTao" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label4" runat="server" Text="Tên Khóa Học:" CssClass="col-md-3 control-label"></asp:Label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="txtTenKhoaHoc" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label5" runat="server" Text="Đơn Vị Tổ Chức:" CssClass="col-md-3 control-label"></asp:Label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="txtDonViToChuc" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label6" runat="server" Text="Thời Gian:" CssClass="col-md-3 control-label"></asp:Label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="txtThoiGian" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label7" runat="server" Text="Chi Phí Dự Kiến:" CssClass="col-md-3 control-label"></asp:Label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="txtChiPhiDuKien" runat="server" AutoPostBack="True"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label8" runat="server" Text="Địa Điểm:" CssClass="col-md-3 control-label"></asp:Label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="txtDiaDiem" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label11" runat="server" Text="Người Đăng Ký:" CssClass="col-md-3 control-label"></asp:Label>
                                        <div class="col-md-9">
                                            <asp:DropDownList ID="cbNguoiDangKy" runat="server" DataSourceID="SqlDataSource_NhanVien" DataTextField="HoTen" DataValueField="HoTen"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label9" runat="server" Text="Trưởng Đơn Vị:" CssClass="col-md-3 control-label"></asp:Label>
                                        <div class="col-md-9">
                                            <asp:DropDownList ID="cbTruongDonVi" runat="server" DataSourceID="SqlDataSource_NhanVien" DataTextField="HoTen" DataValueField="HoTen"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label10" runat="server" Text="Phê Duyệt:" CssClass="col-md-3 control-label"></asp:Label>
                                        <div class="col-md-9">
                                            <asp:DropDownList ID="cbPheDuyet" runat="server" DataSourceID="SqlDataSource_NhanVien" DataTextField="HoTen" DataValueField="HoTen"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label3" runat="server" Text="Đơn Vị:" CssClass="col-md-3 control-label"></asp:Label>
                                        <div class="col-md-9">
                                            <asp:DropDownList ID="cbDonVi" runat="server" DataSourceID="SqlDataSource_DonVi" DataTextField="ChiNhanh" DataValueField="MaChiNhanh"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="modal-footer">
                        <asp:LinkButton ID="btnSave1" runat="server" CssClass="btn mauxanh"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Lưu</asp:LinkButton>
                        <button type="button" class="btn mauxam" data-dismiss="modal"><span class="glyphicon glyphicon-off" aria-hidden="true"></span>Ðóng</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource_YeuCauDaoTao" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" DeleteCommand="DELETE FROM [hr_YeuCauDaoTao] WHERE [MaYeuCau] = @MaYeuCau" InsertCommand="INSERT INTO hr_YeuCauDaoTao(MaYeuCau, NoiDungDaoTao, TenKhoaHoc, DonViToChuc, ThoiGian, ChiPhiDuKien, DiaDiem, NguoiDangKy, TruongDonVi, PheDuyet, DonVi, MaChiNhanh, NgayYeuCau) VALUES (@MaYeuCau, @NoiDungDaoTao, @TenKhoaHoc, @DonViToChuc, @ThoiGian, @ChiPhiDuKien, @DiaDiem, @NguoiDangKy, @TruongDonVi, @PheDuyet, @DonVi, @MaChiNhanh, @NgayYeuCau)" SelectCommand="SELECT MaYeuCau, NgayYeuCau, NoiDungDaoTao, TenKhoaHoc, DonViToChuc, ThoiGian, ChiPhiDuKien, DiaDiem, NguoiDangKy, TruongDonVi, PheDuyet, DonVi, MaChiNhanh FROM hr_YeuCauDaoTao WHERE (MaChiNhanh = @MaChiNhanh)" UpdateCommand="UPDATE hr_YeuCauDaoTao SET NoiDungDaoTao = @NoiDungDaoTao, TenKhoaHoc = @TenKhoaHoc, DonViToChuc = @DonViToChuc, ThoiGian = @ThoiGian, ChiPhiDuKien = @ChiPhiDuKien, DiaDiem = @DiaDiem, NguoiDangKy = @NguoiDangKy, TruongDonVi = @TruongDonVi, PheDuyet = @PheDuyet, DonVi = @DonVi, MaChiNhanh = @MaChiNhanh, NgayYeuCau = @NgayYeuCau WHERE (MaYeuCau = @MaYeuCau)">
            <DeleteParameters>
                <asp:Parameter Name="MaYeuCau" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MaYeuCau" Type="String" />
                <asp:Parameter Name="NoiDungDaoTao" Type="String" />
                <asp:Parameter Name="TenKhoaHoc" Type="String" />
                <asp:Parameter Name="DonViToChuc" Type="String" />
                <asp:Parameter Name="ThoiGian" Type="String" />
                <asp:Parameter Name="ChiPhiDuKien" Type="Double" />
                <asp:Parameter Name="DiaDiem" Type="String" />
                <asp:Parameter Name="NguoiDangKy" Type="String" />
                <asp:Parameter Name="TruongDonVi" Type="String" />
                <asp:Parameter Name="PheDuyet" Type="String" />
                <asp:Parameter Name="DonVi" Type="String" />
                <asp:Parameter Name="MaChiNhanh" Type="String" />
                <asp:Parameter Name="NgayYeuCau" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="MaChiNhanh" SessionField="MaChiNhanh" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="NoiDungDaoTao" Type="String" />
                <asp:Parameter Name="TenKhoaHoc" Type="String" />
                <asp:Parameter Name="DonViToChuc" Type="String" />
                <asp:Parameter Name="ThoiGian" Type="String" />
                <asp:Parameter Name="ChiPhiDuKien" Type="Double" />
                <asp:Parameter Name="DiaDiem" Type="String" />
                <asp:Parameter Name="NguoiDangKy" Type="String" />
                <asp:Parameter Name="TruongDonVi" Type="String" />
                <asp:Parameter Name="PheDuyet" Type="String" />
                <asp:Parameter Name="DonVi" Type="String" />
                <asp:Parameter Name="MaChiNhanh" Type="String" />
                <asp:Parameter Name="NgayYeuCau" />
                <asp:Parameter Name="MaYeuCau" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_NhanVien" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT MaNhanVien, HoLot + ' ' + Ten AS HoTen FROM hr_NhanVien ORDER BY HoLot, Ten"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_DonVi" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT [MaChiNhanh], [ChiNhanh] FROM [hr_ChiNhanh]"></asp:SqlDataSource>
    </div>

    <div class="row">
        <div id="myModal2" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Thêm Mới</h4>
                    </div>
                    <div class="modal-body">
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                                <div class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <asp:Label ID="Label12" runat="server" Text="Mã Yêu Cầu: (*)" CssClass="col-md-3 control-label"></asp:Label>
                                        <div class="col-md-9">
                                            <asp:Label ID="lblMaYeuCau" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label14" runat="server" Text="Nhân Viên:" CssClass="col-md-3 control-label"></asp:Label>
                                        <div class="col-md-9">
                                            <asp:DropDownList ID="cbMaNhanVien" runat="server" DataSourceID="SqlDataSource_NhanVien" DataTextField="HoTen" DataValueField="MaNhanVien">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label13" runat="server" Text="Ghi Chú:" CssClass="col-md-3 control-label"></asp:Label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="txtGhiChu" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="modal-footer">
                        <asp:LinkButton ID="btnSave2" runat="server" CssClass="btn mauxanh"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Lưu</asp:LinkButton>
                        <button type="button" class="btn mauxam" data-dismiss="modal"><span class="glyphicon glyphicon-off" aria-hidden="true"></span>Ðóng</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource_ChiTietYeuCauDaoTao" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" DeleteCommand="DELETE FROM [hr_ChiTietYeuCauDaoTao] WHERE [MaChiTiet] = @MaChiTiet" InsertCommand="INSERT INTO [hr_ChiTietYeuCauDaoTao] ([MaYeuCau], [MaNhanVien], [Ngay], [SoLuong], [GhiChu]) VALUES (@MaYeuCau, @MaNhanVien, @Ngay, @SoLuong, @GhiChu)" SelectCommand="SELECT * FROM [hr_ChiTietYeuCauDaoTao] WHERE ([MaYeuCau] = @MaYeuCau)" UpdateCommand="UPDATE [hr_ChiTietYeuCauDaoTao] SET [MaYeuCau] = @MaYeuCau, [MaNhanVien] = @MaNhanVien, [Ngay] = @Ngay, [SoLuong] = @SoLuong, [GhiChu] = @GhiChu WHERE [MaChiTiet] = @MaChiTiet">
            <DeleteParameters>
                <asp:Parameter Name="MaChiTiet" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MaYeuCau" Type="String" />
                <asp:Parameter Name="MaNhanVien" Type="String" />
                <asp:Parameter Name="Ngay" DbType="Date" />
                <asp:Parameter Name="SoLuong" Type="Double" />
                <asp:Parameter Name="GhiChu" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="lblMaYeuCau" Name="MaYeuCau" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="MaYeuCau" Type="String" />
                <asp:Parameter Name="MaNhanVien" Type="String" />
                <asp:Parameter Name="Ngay" DbType="Date" />
                <asp:Parameter Name="SoLuong" Type="Double" />
                <asp:Parameter Name="GhiChu" Type="String" />
                <asp:Parameter Name="MaChiTiet" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <div>
        <asp:HiddenField ID="TabName" runat="server" />
        <script type="text/javascript">
            $(function () {
                var tabName = $("[id*=TabName]").val() != "" ? $("[id*=TabName]").val() : "service-one";
                $('#myTab a[href="#' + tabName + '"]').tab('show');
                $("#myTab a").click(function () {
                    $("[id*=TabName]").val($(this).attr("href").replace("#", ""));
                });
            });
        </script>
    </div>
</asp:Content>
