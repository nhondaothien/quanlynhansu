<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrU00_NhanSu.aspx.vb" Inherits="HRM.hrU00_NhanSu" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Namespace="CKFinder" Assembly="CKFinder" TagPrefix="CKFinder" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadContent">
    <style>
        .hidden-col{
            display : none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item active">
            CẬP NHẬT NHÂN SỰ
        </div>

        <div class="list-group-item document">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <table class="table">
                        <tr>
                            <td>
                                <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn mauxanh" OnClick="btnAdd_Click" CausesValidation="False"><i class="fe-plus-square"></i> Thêm Mới</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-responsive" Width="100%" HorizontalAlign="Center" AutoGenerateColumns="False" DataSourceID="SqlDataSource1_NhanSu" DataKeyNames="MaNhanVien" OnRowCommand="GridView1_RowCommand">
                        <Columns>
                            <asp:ButtonField CommandName="selectRecord" ButtonType="Link" HeaderText="Chọn" Text='<i class="fe-list"></i>' ItemStyle-Width="40px">
                                <ControlStyle CssClass="btn btn-xs maureu" ForeColor="White"></ControlStyle>
                                <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:ButtonField CommandName="editRecord" ButtonType="Link" HeaderText="Sửa" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                <ControlStyle CssClass="btn btn-xs mauvang" ForeColor="White"></ControlStyle>
                                <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" HeaderText="Xóa" Text='<i class="fe-trash-2"></i>' ItemStyle-Width="40px">
                                <ControlStyle CssClass="btn btn-xs maudo" ForeColor="White"></ControlStyle>
                                <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:BoundField DataField="MaNhanVien" HeaderText="Mã Nhân Viên" SortExpression="MaNhanVien" ReadOnly="True"></asp:BoundField>
                            <asp:BoundField DataField="HoLot" HeaderText="Họ Lót" SortExpression="HoLot" />
                            <asp:BoundField DataField="Ten" HeaderText="Tên" SortExpression="Ten" />
                            <asp:BoundField DataField="NgaySinh" HeaderText="Ngày Sinh" SortExpression="NgaySinh" DataFormatString="{0:MM/dd/yyyy}" />
                            <asp:BoundField DataField="NoiSinh" HeaderText="Nơi Sinh" SortExpression="NoiSinh" />
                            <asp:BoundField DataField="NguyenQuan" HeaderText="Nguyên Quán" SortExpression="NguyenQuan" />
                            <asp:BoundField DataField="GioiTinh" HeaderText="Giới Tính" SortExpression="GioiTinh" />
                            <asp:BoundField DataField="TinhTrangHonNhan" HeaderText="Tình Trạng Hôn Nhân" SortExpression="TinhTrangHonNhan" />
                            <asp:BoundField DataField="SoCon" HeaderText="Số Con" SortExpression="SoCon" />
                            <asp:BoundField DataField="SoCMND" HeaderText="Số CMND" SortExpression="SoCMND" />
                            <asp:BoundField DataField="NgayCap" HeaderText="Ngày Cấp" SortExpression="NgayCap" DataFormatString="{0:MM/dd/yyyy}" />
                            <asp:BoundField DataField="NoiCap" HeaderText="Nơi Cấp" SortExpression="NoiCap" />
                            <asp:BoundField DataField="DiaChiThuongTru" HeaderText="Địa Chỉ Thường Trú" SortExpression="DiaChiThuongTru" />
                            <asp:BoundField DataField="DiaChiTamTru" HeaderText="Địa Chỉ Tạm Trú" SortExpression="DiaChiTamTru" />
                            <asp:BoundField DataField="ChucVuHienTai" HeaderText="Chức Vụ" SortExpression="ChucVuHienTai" />
                            <asp:BoundField DataField="NgayVaoLamViec" HeaderText="Ngày Vào Làm Việc" SortExpression="NgayVaoLamViec" DataFormatString="{0:MM/dd/yyyy}" />
                            <asp:BoundField DataField="NgayKetThucThuViec" HeaderText="Ngày Kết Thúc Thử Việc" SortExpression="NgayKetThucThuViec" DataFormatString="{0:MM/dd/yyyy}" />
                            <asp:BoundField DataField="NgayKyHopDongLaoDong" HeaderText="Ngày Ký Hợp Đồng" SortExpression="NgayKyHopDongLaoDong" DataFormatString="{0:MM/dd/yyyy}" />
                            <asp:BoundField DataField="DienThoai" HeaderText="Điện Thoại" SortExpression="DienThoai" />
                            <asp:BoundField DataField="DiDong" HeaderText="Di Động" SortExpression="DiDong" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="EmailCaNhan" HeaderText="Email Cá Nhân" SortExpression="EmailCaNhan" />
                            <asp:BoundField DataField="FaceBook" HeaderText="FaceBook" SortExpression="FaceBook" />
                            <asp:BoundField DataField="SoBHXH" HeaderText="Số BHXH" SortExpression="SoBHXH" />
                            <asp:BoundField DataField="MaSoThue" HeaderText="Mã Số Thuế" SortExpression="MaSoThue" />
                            <asp:BoundField DataField="SoTaiKhoan" HeaderText="Số Tài Khoản" SortExpression="SoTaiKhoan" />
                            <asp:BoundField DataField="HinhAnh" HeaderText="Hình Ảnh" SortExpression="HinhAnh" />
                            <asp:BoundField DataField="BoPhanLamViecID" HeaderText="Mã Bộ Phận" SortExpression="BoPhanLamViecID" />
                            <asp:BoundField DataField="QuocTichID" HeaderText="Mã Quốc Tịch" SortExpression="QuocTichID" />
                            <asp:BoundField DataField="DanTocID" HeaderText="Mã Dân Tộc" SortExpression="DanTocID" />
                            <asp:BoundField DataField="TonGiaoID" HeaderText="Mã Tôn Giáo" SortExpression="TonGiaoID" />
                            <asp:BoundField DataField="TrinhDoHocVanID" HeaderText="Mã Trình Độ Học Vấn" SortExpression="TrinhDoHocVanID" />
                            <asp:BoundField DataField="ThongBaoTrungTuyen" HeaderText="Thông Báo Tuyển Dụng" SortExpression="ThongBaoTrungTuyen" />
                            <asp:BoundField DataField="QuyetDinhTuyenDung" HeaderText="Quyết Định Tuyển Dụng" SortExpression="QuyetDinhTuyenDung" />
                            <asp:BoundField DataField="HoSo" HeaderText="Hồ Sơ" SortExpression="HoSo" />
                            <asp:BoundField DataField="TinhTrang" HeaderText="Tình Trạng" SortExpression="TinhTrang" />
                            <asp:BoundField DataField="NgayNghi" HeaderText="Ngày Nghỉ" SortExpression="NgayNghi" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="MatKhau" HeaderText="Mật Khẩu" SortExpression="MatKhau" ItemStyle-CssClass="hidden-col" HeaderStyle-CssClass="hidden-col" >
                            <HeaderStyle CssClass="hidden-col" />
                            <ItemStyle CssClass="hidden-col" />
                            </asp:BoundField>
                            <asp:BoundField DataField="GhiChu" HeaderText="Ghi Chú" SortExpression="GhiChu" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
            <div class="modal-full">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalScrollableTitle">Add</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true"><b>&times;</b></span>
                        </button>
                    </div>
                    <asp:UpdatePanel ID="upAdd" runat="server">
                        <ContentTemplate>
                            <div class="modal-body p-4 margin-top20">
                                <%--[MaNhanVien], [HoLot], [Ten], [NgaySinh], [NoiSinh], [NguyenQuan], [GioiTinh], [TinhTrangHonNhan], [SoCon], [SoCMND], [NgayCap], 
                                    [NoiCap], [DiaChiThuongTru], [DiaChiTamTru], [ChucVuHienTai], [NgayVaoLamViec], [NgayKetThucThuViec], [NgayKyHopDongLaoDong], 
                                    [DienThoai], [DiDong], [Email], [EmailCaNhan], [FaceBook], [SoBHXH], [MaSoThue], [SoTaiKhoan], [HinhAnh], [BoPhanLamViecID], 
                                    [QuocTichID], [DanTocID], [TonGiaoID], [TrinhDoHocVanID], [ThongBaoTrungTuyen], [QuyetDinhTuyenDung], [HoSo], [TinhTrang], 
                                    [NgayNghi], [MatKhau], [GhiChu]--%>

                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Mã Nhân Viên: (*)</label>
                                            <asp:TextBox ID="txtMaNhanVien" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Họ Lót</label>
                                            <asp:TextBox ID="txtHoLot" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Tên</label>
                                            <asp:TextBox ID="txtTen" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Ngày Sinh</label>
                                            <asp:TextBox ID="txtNgaySinh" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgaySinh_CalendarExtender" TargetControlID="txtNgaySinh" ID="txtNgaySinh_CalendarExtender"></ajaxToolkit:CalendarExtender>

                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Nơi Sinh</label>
                                            <asp:TextBox ID="txtNoiSinh" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Nguyên Quán</label>
                                            <asp:TextBox ID="txtNguyenQuan" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Giới Tính</label>
                                            <asp:DropDownList ID="cbGioiTinh" runat="server">
                                                <asp:ListItem>Nam</asp:ListItem>
                                                <asp:ListItem>Nữ</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Hôn Nhân</label>
                                            <asp:DropDownList ID="cbTinhTrangHonNhan" runat="server">
                                                <asp:ListItem>Lập Gia Đình</asp:ListItem>
                                                <asp:ListItem>Độc Thân</asp:ListItem>
                                                <asp:ListItem>Khác</asp:ListItem>
                                            </asp:DropDownList>                                        
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Số Con</label>
                                            <asp:TextBox ID="txtSoCon" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Số CMND</label>
                                            <asp:TextBox ID="txtSoCMND" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Ngày Cấp</label>
                                            <asp:TextBox ID="txtNgayCap" CssClass="form-control" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgayCap_CalendarExtender" TargetControlID="txtNgayCap" ID="txtNgayCap_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Nơi Cấp</label>
                                            <asp:TextBox ID="txtNoiCap" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-3" class="control-label">Đ/c Thường Trú</label>
                                            <asp:TextBox ID="txtThuongTru" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-4" class="control-label">Đ/c Tạm trú</label>
                                            <asp:TextBox ID="txtTamTru" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Chức Vụ</label>
                                            <asp:TextBox ID="txtChucVu" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Thông Tin Trúng Tuyển</label>
                                            <asp:TextBox ID="txtThongBaoTrungTuyen" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Quyết Định Tuyển Dụng</label>
                                            <asp:TextBox ID="txtQuyetDinhTuyenDung" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Hồ Sơ</label>
                                            <asp:TextBox ID="txtHoSo" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Ngày Vào Làm Việc</label>
                                            <asp:TextBox ID="txtNgayVaoLamViec" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgayVaoLamViec_CalendarExtender" TargetControlID="txtNgayVaoLamViec" ID="txtNgayVaoLamViec_CalendarExtender"></ajaxToolkit:CalendarExtender>

                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Ngày Kết Thúc Thử Việc</label>
                                            <asp:TextBox ID="txtNgayKetThucThuViec" CssClass="form-control" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgayKetThucThuViec_CalendarExtender" TargetControlID="txtNgayKetThucThuViec" ID="txtNgayKetThucThuViec_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Ngày Ký Hợp Đồng Lao Động</label>
                                            <asp:TextBox ID="txtNgayKyHopDongLaoDong" CssClass="form-control" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgayKyHopDongLaoDong_CalendarExtender" TargetControlID="txtNgayKyHopDongLaoDong" ID="txtNgayKyHopDongLaoDong_CalendarExtender"></ajaxToolkit:CalendarExtender>

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Điện Thoại</label>
                                            <asp:TextBox ID="txtDienThoai" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Di Động</label>
                                            <asp:TextBox ID="txtDiDong" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Email</label>
                                            <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Email Cá Nhân</label>
                                            <asp:TextBox ID="txtEmailCaNhan" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">FaceBook</label>
                                            <asp:TextBox ID="txtFacebook" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-5" class="control-label">Số BHXH</label>
                                            <asp:TextBox ID="txtSoBHXH" CssClass="form-control" runat="server"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-6" class="control-label">Mã Số Thuế</label>
                                        <asp:TextBox ID="txtMaSoThue" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-7" class="control-label">Số Tài Khoản Ngân Hàng</label>
                                            <asp:TextBox ID="txtSoTaiKhoan" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-8" class="control-label">Hình Ảnh</label>
                                            <asp:TextBox ID="txtHinhAnh" CssClass="form-control" runat="server"></asp:TextBox>
                                            <div class="input-group-btn margin-top20">
                                                <asp:HyperLink ID="uploadlink" runat="server" CssClass="btn btn btn-primary margin-top20" NavigateUrl="./hr00_Upload.aspx" Target="_blank"><i class="fe-link"></i> Get Link</asp:HyperLink>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-9" class="control-label">Quốc Tịch</label>
                                            <asp:DropDownList ID="cbQuocTich" runat="server" DataSourceID="SqlDataSource3_QuocTich" DataTextField="TenQuocTich" DataValueField="MaQuocTich">
                                            </asp:DropDownList>                                        
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-10" class="control-label">Dân Tộc</label>
                                            <asp:DropDownList ID="cbDanToc" runat="server" DataSourceID="SqlDataSource4_DanToc" DataTextField="TenDanToc" DataValueField="MaDanToc">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-11" class="control-label">Tôn Giáo</label>
                                            <asp:DropDownList ID="cbTonGiao" runat="server" DataSourceID="SqlDataSource5_TonGiao" DataTextField="TenTonGiao" DataValueField="MaTonGiao">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-12" class="control-label">Bộ Phận</label>
                                            <asp:DropDownList ID="cbBanNganh" runat="server" DataSourceID="SqlDataSource8_BoPhanLamViec" DataTextField="TenBoPhan" DataValueField="MaBoPhan"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Trình Độ Học Vấn</label>
                                            <asp:DropDownList ID="cbTrinhDoHocVan" runat="server" DataSourceID="SqlDataSource6_TrinhDoHocVan" DataTextField="TrinhDoHocVan" DataValueField="MaTrinhDoHocVan">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Tình Trạng Làm Việc</label>
                                            <asp:DropDownList ID="cbTinhTrang" runat="server">
                                                <asp:ListItem>YES</asp:ListItem>
                                                <asp:ListItem>NO</asp:ListItem>
                                            </asp:DropDownList>                                       
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Ngày Nghỉ</label>
                                            <asp:TextBox ID="txtNgayNghi" CssClass="form-control" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgayNghi_CalendarExtender" TargetControlID="txtNgayNghi" ID="txtNgayNghi_CalendarExtender"></ajaxToolkit:CalendarExtender>

                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Mật Khẩu</label>
                                            <asp:TextBox ID="txtMatKhau" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-13" class="control-label">Ghi Chú</label>
                                            <asp:TextBox ID="txtGhiChu" CssClass="form-control" runat="server"></asp:TextBox>
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
   
        <!--End Add-->

<!--Bắt đầu Sửa -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-full">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Edit</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <asp:UpdatePanel ID="upEdit" runat="server">
                <ContentTemplate>
                    <div class="modal-body p-4 margin-top20">
                        <%--[MaDuAn], [TenDuAn], [ViTri], [DichVu], [SoHopDong], 
                            [NgayKy], [BatDau], [KetThuc], [TinhTrang], [QuyMo], 
                            [HinhAnh], [GhiChu], [MaKhachHang], [HoSoUrl]--%>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="field-1" class="control-label">Mã Nhân Viên: (*)</label>
                                        <asp:TextBox ID="txtMaNhanVien1" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="field-2" class="control-label">Họ Lót</label>
                                        <asp:TextBox ID="txtHoLot1" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="field-2" class="control-label">Tên</label>
                                        <asp:TextBox ID="txtTen1" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="field-1" class="control-label">Ngày Sinh</label>
                                        <asp:TextBox ID="txtNgaySinh1" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgaySinh1_CalendarExtender" TargetControlID="txtNgaySinh1" ID="txtNgaySinh1_CalendarExtender"></ajaxToolkit:CalendarExtender>

                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="field-2" class="control-label">Nơi Sinh</label>
                                        <asp:TextBox ID="txtNoiSinh1" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="field-2" class="control-label">Nguyên Quán</label>
                                        <asp:TextBox ID="txtNguyenQuan1" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="field-1" class="control-label">Giới Tính</label>
                                        <asp:DropDownList ID="cbGioiTinh1" runat="server">
                                            <asp:ListItem>Nam</asp:ListItem>
                                            <asp:ListItem>Nữ</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="field-2" class="control-label">Hôn Nhân</label>
                                        <asp:DropDownList ID="cbTinhTrangHonNhan1" runat="server">
                                            <asp:ListItem>Lập Gia Đình</asp:ListItem>
                                            <asp:ListItem>Độc Thân</asp:ListItem>
                                            <asp:ListItem>Khác</asp:ListItem>
                                        </asp:DropDownList>                                        
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="field-2" class="control-label">Số Con</label>
                                        <asp:TextBox ID="txtSoCon1" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="field-1" class="control-label">Số CMND</label>
                                        <asp:TextBox ID="txtSoCMND1" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="field-2" class="control-label">Ngày Cấp</label>
                                        <asp:TextBox ID="txtNgayCap1" CssClass="form-control" runat="server"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgayCap1_CalendarExtender" TargetControlID="txtNgayCap1" ID="txtNgayCap1_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="field-2" class="control-label">Nơi Cấp</label>
                                        <asp:TextBox ID="txtNoiCap1" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="field-3" class="control-label">Đ/c Thường Trú</label>
                                        <asp:TextBox ID="txtThuongTru1" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="field-4" class="control-label">Đ/c Tạm trú</label>
                                        <asp:TextBox ID="txtTamTru1" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="field-1" class="control-label">Chức Vụ</label>
                                        <asp:TextBox ID="txtChucVu1" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="field-2" class="control-label">Thông Tin Trúng Tuyển</label>
                                        <asp:TextBox ID="txtThongBaoTrungTuyen1" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="field-2" class="control-label">Quyết Định Tuyển Dụng</label>
                                        <asp:TextBox ID="txtQuyetDinhTuyenDung1" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="field-2" class="control-label">Hồ Sơ</label>
                                        <asp:TextBox ID="txtHoSo1" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="field-1" class="control-label">Ngày Vào Làm Việc</label>
                                        <asp:TextBox ID="txtNgayVaoLamViec1" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgayVaoLamViec1_CalendarExtender" TargetControlID="txtNgayVaoLamViec1" ID="txtNgayVaoLamViec1_CalendarExtender"></ajaxToolkit:CalendarExtender>

                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="field-2" class="control-label">Ngày Kết Thúc Thử Việc</label>
                                        <asp:TextBox ID="txtNgayKetThucThuViec1" CssClass="form-control" runat="server"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgayKetThucThuViec1_CalendarExtender" TargetControlID="txtNgayKetThucThuViec1" ID="txtNgayKetThucThuViec1_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                    
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="field-2" class="control-label">Ngày Ký Hợp Đồng Lao Động</label>
                                        <asp:TextBox ID="txtNgayKyHopDongLaoDong1" CssClass="form-control" runat="server"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgayKyHopDongLaoDong1_CalendarExtender" TargetControlID="txtNgayKyHopDongLaoDong1" ID="txtNgayKyHopDongLaoDong1_CalendarExtender"></ajaxToolkit:CalendarExtender>

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="field-1" class="control-label">Điện Thoại</label>
                                        <asp:TextBox ID="txtDienThoai1" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="field-2" class="control-label">Di Động</label>
                                        <asp:TextBox ID="txtDiDong1" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="field-1" class="control-label">Email</label>
                                        <asp:TextBox ID="txtEmail1" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="field-2" class="control-label">Email Cá Nhân</label>
                                        <asp:TextBox ID="txtEmailCaNhan1" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="field-2" class="control-label">FaceBook</label>
                                        <asp:TextBox ID="txtFacebook1" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="field-5" class="control-label">Số BHXH</label>
                                        <asp:TextBox ID="txtSoBHXH1" CssClass="form-control" runat="server"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="field-6" class="control-label">Mã Số Thuế</label>
                                    <asp:TextBox ID="txtMaSoThue1" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="field-7" class="control-label">Số Tài Khoản Ngân Hàng</label>
                                        <asp:TextBox ID="txtSoTaiKhoan1" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="field-8" class="control-label">Hình Ảnh</label>
                                        <asp:TextBox ID="txtHinhAnh1" CssClass="form-control" runat="server"></asp:TextBox>
                                        <div class="input-group-btn margin-top20">
                                            <asp:HyperLink ID="uploadlink1" runat="server" CssClass="btn btn btn-primary margin-top20" NavigateUrl="./hr00_Upload.aspx" Target="_blank"><i class="fe-link"></i> Get Link</asp:HyperLink>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="field-9" class="control-label">Quốc Tịch</label>
                                        <asp:DropDownList ID="cbQuocTich1" runat="server" DataSourceID="SqlDataSource3_QuocTich" DataTextField="TenQuocTich" DataValueField="MaQuocTich">
                                        </asp:DropDownList>                                        
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="field-10" class="control-label">Dân Tộc</label>
                                        <asp:DropDownList ID="cbDanToc1" runat="server" DataSourceID="SqlDataSource4_DanToc" DataTextField="TenDanToc" DataValueField="MaDanToc">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="field-11" class="control-label">Tôn Giáo</label>
                                        <asp:DropDownList ID="cbTonGiao1" runat="server" DataSourceID="SqlDataSource5_TonGiao" DataTextField="TenTonGiao" DataValueField="MaTonGiao">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="field-12" class="control-label">Bộ Phận</label>
                                        <asp:DropDownList ID="cbBanNganh1" runat="server" DataSourceID="SqlDataSource8_BoPhanLamViec" DataTextField="TenBoPhan" DataValueField="MaBoPhan"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="field-1" class="control-label">Trình Độ Học Vấn</label>
                                        <asp:DropDownList ID="cbTrinhDoHocVan1" runat="server" DataSourceID="SqlDataSource6_TrinhDoHocVan" DataTextField="TrinhDoHocVan" DataValueField="MaTrinhDoHocVan">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="field-2" class="control-label">Tình Trạng Làm Việc</label>
                                        <asp:DropDownList ID="cbTinhTrang1" runat="server">
                                            <asp:ListItem>YES</asp:ListItem>
                                            <asp:ListItem>NO</asp:ListItem>
                                        </asp:DropDownList>                                       
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="field-2" class="control-label">Ngày Nghỉ</label>
                                        <asp:TextBox ID="txtNgayNghi1" CssClass="form-control" runat="server"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgayNghi1_CalendarExtender" TargetControlID="txtNgayNghi1" ID="txtNgayNghi1_CalendarExtender"></ajaxToolkit:CalendarExtender>

                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="field-2" class="control-label">Mật Khẩu</label>
                                        <asp:TextBox ID="txtMatKhau1" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="field-13" class="control-label">Ghi Chú</label>
                                            <asp:TextBox ID="txtGhiChu1" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Label ID="lblResult" Visible="false" runat="server"></asp:Label>
                        <asp:LinkButton ID="btnSave" runat="server" CssClass="btn mauxanh" OnClick="btnSave_Click"><i class="fe-save"></i> Cập nhật</asp:LinkButton>
                        <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i> Đóng</button>
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

        <!--Start Delete-->
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
                        <div class="modal-body margin-top20">
                            <table>
                                <tr>
                                    <td>Bạn có chắc xóa dữ liệu này?
                                    </td>
                                </tr>
                            </table>
                            <asp:HiddenField ID="hfCode" runat="server" />
                        </div>
                        <div class="modal-footer">
                            <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn maudo" OnClick="btnDelete_Click"><i class="fe-trash-2"></i> Xóa</asp:LinkButton>
                            <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i> Hủy</button>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
    <%--End Delete--%>

    <div id="selectModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Chức Năng</h4>
                </div>
                <div class="modal-body p-4 margin-top20">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table class="table table-responsive">
                                <tr>
                                    <td class="text-center">Mã Nhân Viên: <asp:Label ID="lblMaNhanVien" runat="server" Text=""></asp:Label></td>
                                </tr>
                                <tr>
                                    <td><asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-block maureu" NavigateUrl="~/Data/HRM/Update/hrU00_ThongTinLienHeKhanCap.aspx" Target="_blank">Thông Tin Khẩn Cấp</asp:HyperLink></td>                                    
                                </tr>
                                <tr>
                                    <td><asp:HyperLink ID="HyperLink2" runat="server" CssClass="btn btn-block maureu" NavigateUrl="~/Data/HRM/Update/hrU01_BangCap.aspx" Target="_blank">Bằng Cấp</asp:HyperLink></td>
                                </tr>
                                <tr>
                                    <td><asp:HyperLink ID="HyperLink3" runat="server" CssClass="btn btn-block maureu" NavigateUrl="~/Data/HRM/Update/hrU02_ChungChi.aspx" Target="_blank">Chứng Chỉ</asp:HyperLink></td>
                                </tr>
                                <tr>
                                    <td><asp:HyperLink ID="HyperLink4" runat="server" CssClass="btn btn-block maureu" NavigateUrl="~/Data/HRM/Update/hrU03_KyNang.aspx" Target="_blank">Kỹ Năng</asp:HyperLink></td>
                                </tr>
                                <tr>
                                    <td><asp:HyperLink ID="HyperLink5" runat="server" CssClass="btn btn-block maureu" NavigateUrl="~/Data/HRM/Update/hrU04_CongTac.aspx" Target="_blank">Công Tác</asp:HyperLink></td>
                                </tr>
                                <tr>
                                    <td><asp:HyperLink ID="HyperLink6" runat="server" CssClass="btn btn-block maureu" NavigateUrl="~/Data/HRM/Update/hrU26_NhanSuDuAn.aspx" Target="_blank">Chấm Công</asp:HyperLink></td>
                                </tr>
                                <tr>
                                    <td><asp:HyperLink ID="HyperLink7" runat="server" CssClass="btn btn-block maureu" NavigateUrl="~/Data/HRM/Update/hrU06_PhepNam.aspx" Target="_blank">Phép Năm</asp:HyperLink></td>
                                </tr>
                                <tr>
                                    <td><asp:HyperLink ID="HyperLink8" runat="server" CssClass="btn btn-block maureu" NavigateUrl="~/Data/HRM/Update/hrU07_TienLuong.aspx" Target="_blank">Tiền Lương</asp:HyperLink></td>
                                </tr>
                                <tr>
                                    <td><asp:HyperLink ID="HyperLink9" runat="server" CssClass="btn btn-block maureu" NavigateUrl="~/Data/HRM/Update/hrU08_DieuChinhLuong.aspx" Target="_blank">Điều Chỉnh Lương</asp:HyperLink></td>
                                </tr>
                                <tr>
                                    <td><asp:HyperLink ID="HyperLink10" runat="server" CssClass="btn btn-block maureu" NavigateUrl="~/Data/HRM/Update/hrU09_HopDongLaoDong.aspx" Target="_blank">Hợp Đồng Lao Động</asp:HyperLink></td>
                                </tr>
                                <%--<tr>
                                    <td><asp:HyperLink ID="HyperLink11" runat="server" CssClass="btn btn-block maureu" NavigateUrl="~/Data/HRM/Update/hrU10a_YeuCauDaoTao.aspx" Target="_blank">Đào Tạo</asp:HyperLink></td>
                                </tr>--%>
                                <tr>
                                    <td><asp:HyperLink ID="HyperLink12" runat="server" CssClass="btn btn-block maureu" NavigateUrl="~/Data/HRM/Update/hrU11_ThangTien.aspx" Target="_blank">Thăng Tiến</asp:HyperLink></td>
                                </tr>
                                <tr>
                                    <td><asp:HyperLink ID="HyperLink13" runat="server" CssClass="btn btn-block maureu" NavigateUrl="~/Data/HRM/Update/hrU12_KhenThuong.aspx" Target="_blank">Khen Thưởng</asp:HyperLink></td>
                                </tr>
                                <tr>
                                    <td><asp:HyperLink ID="HyperLink14" runat="server" CssClass="btn btn-block maureu" NavigateUrl="~/Data/HRM/Update/hrU13_KyLuat.aspx" Target="_blank">Kỷ Luật</asp:HyperLink></td>
                                </tr>
                                <tr>
                                    <td><asp:HyperLink ID="HyperLink15" runat="server" CssClass="btn btn-block maureu" NavigateUrl="~/Data/HRM/Update/hrU14_TinhTrangSucKhoe.aspx" Target="_blank">Sức Khỏe</asp:HyperLink></td>
                                </tr>
                            </table>
                            <div class="modal-footer">
                                <asp:Label ID="Label1" Visible="false" runat="server"></asp:Label>
                                <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i> Đóng</button>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource1_NhanSu" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
            SelectCommand="SELECT hr_NhanVien.MaNhanVien, hr_NhanVien.HoLot, hr_NhanVien.Ten, hr_NhanVien.NgaySinh, hr_NhanVien.NoiSinh, hr_NhanVien.NguyenQuan, hr_NhanVien.GioiTinh, hr_NhanVien.TinhTrangHonNhan, hr_NhanVien.SoCon, hr_NhanVien.SoCMND, hr_NhanVien.NgayCap, hr_NhanVien.NoiCap, hr_NhanVien.DiaChiThuongTru, hr_NhanVien.DiaChiTamTru, hr_NhanVien.ChucVuHienTai, hr_NhanVien.NgayVaoLamViec, hr_NhanVien.NgayKetThucThuViec, hr_NhanVien.NgayKyHopDongLaoDong, hr_NhanVien.DienThoai, hr_NhanVien.DiDong, hr_NhanVien.Email, hr_NhanVien.EmailCaNhan, hr_NhanVien.FaceBook, hr_NhanVien.SoBHXH, hr_NhanVien.MaSoThue, hr_NhanVien.SoTaiKhoan, hr_NhanVien.HinhAnh, hr_NhanVien.BoPhanLamViecID, hr_NhanVien.QuocTichID, hr_NhanVien.DanTocID, hr_NhanVien.TonGiaoID, hr_NhanVien.TrinhDoHocVanID, hr_NhanVien.ThongBaoTrungTuyen, hr_NhanVien.QuyetDinhTuyenDung, hr_NhanVien.HoSo, hr_NhanVien.TinhTrang, hr_NhanVien.NgayNghi, hr_NhanVien.MatKhau, hr_NhanVien.GhiChu FROM hr_NhanVien INNER JOIN hr_BoPhanLamViec ON hr_NhanVien.BoPhanLamViecID = hr_BoPhanLamViec.MaBoPhan CROSS JOIN hr_CongTy WHERE (hr_CongTy.MaCongTy = @MaCongTy)"
            DeleteCommand="DELETE FROM [hr_NhanVien] WHERE [MaNhanVien] = @MaNhanVien"
            InsertCommand="INSERT INTO [hr_NhanVien] ([MaNhanVien], [HoLot], [Ten], [NgaySinh], [NoiSinh], [NguyenQuan], [GioiTinh], [TinhTrangHonNhan], [SoCon], [SoCMND], [NgayCap], [NoiCap], [DiaChiThuongTru], [DiaChiTamTru], [ChucVuHienTai], [NgayVaoLamViec], [NgayKetThucThuViec], [NgayKyHopDongLaoDong], [DienThoai], [DiDong], [Email], [EmailCaNhan], [FaceBook], [SoBHXH], [MaSoThue], [SoTaiKhoan], [HinhAnh], [BoPhanLamViecID], [QuocTichID], [DanTocID], [TonGiaoID], [TrinhDoHocVanID], [ThongBaoTrungTuyen], [QuyetDinhTuyenDung], [HoSo], [TinhTrang], [NgayNghi], [MatKhau], [GhiChu]) VALUES (@MaNhanVien, @HoLot, @Ten, @NgaySinh, @NoiSinh, @NguyenQuan, @GioiTinh, @TinhTrangHonNhan, @SoCon, @SoCMND, @NgayCap, @NoiCap, @DiaChiThuongTru, @DiaChiTamTru, @ChucVuHienTai, @NgayVaoLamViec, @NgayKetThucThuViec, @NgayKyHopDongLaoDong, @DienThoai, @DiDong, @Email, @EmailCaNhan, @FaceBook, @SoBHXH, @MaSoThue, @SoTaiKhoan, @HinhAnh, @BoPhanLamViecID, @QuocTichID, @DanTocID, @TonGiaoID, @TrinhDoHocVanID, @ThongBaoTrungTuyen, @QuyetDinhTuyenDung, @HoSo, @TinhTrang, @NgayNghi, @MatKhau, @GhiChu)"
            UpdateCommand="UPDATE [hr_NhanVien] SET [HoLot] = @HoLot, [Ten] = @Ten, [NgaySinh] = @NgaySinh, [NoiSinh] = @NoiSinh, [NguyenQuan] = @NguyenQuan, [GioiTinh] = @GioiTinh, [TinhTrangHonNhan] = @TinhTrangHonNhan, [SoCon] = @SoCon, [SoCMND] = @SoCMND, [NgayCap] = @NgayCap, [NoiCap] = @NoiCap, [DiaChiThuongTru] = @DiaChiThuongTru, [DiaChiTamTru] = @DiaChiTamTru, [ChucVuHienTai] = @ChucVuHienTai, [NgayVaoLamViec] = @NgayVaoLamViec, [NgayKetThucThuViec] = @NgayKetThucThuViec, [NgayKyHopDongLaoDong] = @NgayKyHopDongLaoDong, [DienThoai] = @DienThoai, [DiDong] = @DiDong, [Email] = @Email, [EmailCaNhan] = @EmailCaNhan, [FaceBook] = @FaceBook, [SoBHXH] = @SoBHXH, [MaSoThue] = @MaSoThue, [SoTaiKhoan] = @SoTaiKhoan, [HinhAnh] = @HinhAnh, [BoPhanLamViecID] = @BoPhanLamViecID, [QuocTichID] = @QuocTichID, [DanTocID] = @DanTocID, [TonGiaoID] = @TonGiaoID, [TrinhDoHocVanID] = @TrinhDoHocVanID, [ThongBaoTrungTuyen] = @ThongBaoTrungTuyen, [QuyetDinhTuyenDung] = @QuyetDinhTuyenDung, [HoSo] = @HoSo, [TinhTrang] = @TinhTrang, [NgayNghi] = @NgayNghi, [MatKhau] = @MatKhau, [GhiChu] = @GhiChu WHERE [MaNhanVien] = @MaNhanVien">
            <DeleteParameters>
                <asp:Parameter Name="MaNhanVien" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MaNhanVien" Type="String" />
                <asp:Parameter Name="HoLot" Type="String" />
                <asp:Parameter Name="Ten" Type="String" />
                <asp:Parameter DbType="Date" Name="NgaySinh" />
                <asp:Parameter Name="NoiSinh" Type="String" />
                <asp:Parameter Name="NguyenQuan" Type="String" />
                <asp:Parameter Name="GioiTinh" Type="String" />
                <asp:Parameter Name="TinhTrangHonNhan" Type="String" />
                <asp:Parameter Name="SoCon" Type="Int32" />
                <asp:Parameter Name="SoCMND" Type="String" />
                <asp:Parameter DbType="Date" Name="NgayCap" />
                <asp:Parameter Name="NoiCap" Type="String" />
                <asp:Parameter Name="DiaChiThuongTru" Type="String" />
                <asp:Parameter Name="DiaChiTamTru" Type="String" />
                <asp:Parameter Name="ChucVuHienTai" Type="String" />
                <asp:Parameter DbType="Date" Name="NgayVaoLamViec" />
                <asp:Parameter DbType="Date" Name="NgayKetThucThuViec" />
                <asp:Parameter DbType="Date" Name="NgayKyHopDongLaoDong" />
                <asp:Parameter Name="DienThoai" Type="String" />
                <asp:Parameter Name="DiDong" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="EmailCaNhan" Type="String" />
                <asp:Parameter Name="FaceBook" Type="String" />
                <asp:Parameter Name="SoBHXH" Type="String" />
                <asp:Parameter Name="MaSoThue" Type="String" />
                <asp:Parameter Name="SoTaiKhoan" Type="String" />
                <asp:Parameter Name="HinhAnh" Type="String" />
                <asp:Parameter Name="BoPhanLamViecID" Type="String" />
                <asp:Parameter Name="QuocTichID" Type="String" />
                <asp:Parameter Name="DanTocID" Type="String" />
                <asp:Parameter Name="TonGiaoID" Type="String" />
                <asp:Parameter Name="TrinhDoHocVanID" Type="String" />
                <asp:Parameter Name="ThongBaoTrungTuyen" Type="String" />
                <asp:Parameter Name="QuyetDinhTuyenDung" Type="String" />
                <asp:Parameter Name="HoSo" Type="String" />
                <asp:Parameter Name="TinhTrang" Type="String" />
                <asp:Parameter DbType="Date" Name="NgayNghi" />
                <asp:Parameter Name="MatKhau" Type="String" />
                <asp:Parameter Name="GhiChu" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="MaCongTy" SessionField="MaCongTy" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="HoLot" Type="String" />
                <asp:Parameter Name="Ten" Type="String" />
                <asp:Parameter DbType="Date" Name="NgaySinh" />
                <asp:Parameter Name="NoiSinh" Type="String" />
                <asp:Parameter Name="NguyenQuan" Type="String" />
                <asp:Parameter Name="GioiTinh" Type="String" />
                <asp:Parameter Name="TinhTrangHonNhan" Type="String" />
                <asp:Parameter Name="SoCon" Type="Int32" />
                <asp:Parameter Name="SoCMND" Type="String" />
                <asp:Parameter DbType="Date" Name="NgayCap" />
                <asp:Parameter Name="NoiCap" Type="String" />
                <asp:Parameter Name="DiaChiThuongTru" Type="String" />
                <asp:Parameter Name="DiaChiTamTru" Type="String" />
                <asp:Parameter Name="ChucVuHienTai" Type="String" />
                <asp:Parameter DbType="Date" Name="NgayVaoLamViec" />
                <asp:Parameter DbType="Date" Name="NgayKetThucThuViec" />
                <asp:Parameter DbType="Date" Name="NgayKyHopDongLaoDong" />
                <asp:Parameter Name="DienThoai" Type="String" />
                <asp:Parameter Name="DiDong" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="EmailCaNhan" Type="String" />
                <asp:Parameter Name="FaceBook" Type="String" />
                <asp:Parameter Name="SoBHXH" Type="String" />
                <asp:Parameter Name="MaSoThue" Type="String" />
                <asp:Parameter Name="SoTaiKhoan" Type="String" />
                <asp:Parameter Name="HinhAnh" Type="String" />
                <asp:Parameter Name="BoPhanLamViecID" Type="String" />
                <asp:Parameter Name="QuocTichID" Type="String" />
                <asp:Parameter Name="DanTocID" Type="String" />
                <asp:Parameter Name="TonGiaoID" Type="String" />
                <asp:Parameter Name="TrinhDoHocVanID" Type="String" />
                <asp:Parameter Name="ThongBaoTrungTuyen" Type="String" />
                <asp:Parameter Name="QuyetDinhTuyenDung" Type="String" />
                <asp:Parameter Name="HoSo" Type="String" />
                <asp:Parameter Name="TinhTrang" Type="String" />
                <asp:Parameter DbType="Date" Name="NgayNghi" />
                <asp:Parameter Name="MatKhau" Type="String" />
                <asp:Parameter Name="GhiChu" Type="String" />
                <asp:Parameter Name="MaNhanVien" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3_QuocTich" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT [MaQuocTich], [TenQuocTich] FROM [hr_QuocTich]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4_DanToc" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT [MaDanToc], [TenDanToc] FROM [hr_DanToc]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5_TonGiao" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT * FROM [hr_TonGiao]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource6_TrinhDoHocVan" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT * FROM [hr_TrinhDoHocVan]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource7_ChiNhanh" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT [MaChiNhanh], [ChiNhanh] FROM [hr_ChiNhanh] WHERE ([MaCongTy] = @MaCongTy)">
            <SelectParameters>
                <asp:SessionParameter Name="MaCongTy" SessionField="MaCongTy" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource8_BoPhanLamViec" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT hr_BoPhanLamViec.MaBoPhan, hr_BoPhanLamViec.TenBoPhan FROM hr_BoPhanLamViec INNER JOIN hr_ChiNhanh ON hr_BoPhanLamViec.MaChiNhanh = hr_ChiNhanh.MaChiNhanh WHERE (hr_ChiNhanh.MaCongTy = @MaCongTy)">
            <SelectParameters>
                <asp:SessionParameter Name="MaCongTy" SessionField="MaCongTy" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>
