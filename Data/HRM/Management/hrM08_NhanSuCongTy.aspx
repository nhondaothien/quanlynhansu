<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrM08_NhanSuCongTy.aspx.vb" Inherits="HRM.hrM08_NhanSuCongTy" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
                
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">

        <div class="list-group-item list-group-item-success">
            QUẢN LÝ NHÂN SỰ            
        </div>

        <div class="list-group-item">
            <table class="table table-responsive">
                <tr>
                    <td>Phân Loại:</td>
                    <td>
                        <asp:DropDownList ID="cbSearch" runat="server">
                            <asp:ListItem Selected="True" Value="1">Mã Nhân Viên</asp:ListItem>
                            <asp:ListItem Value="2">Tên</asp:ListItem>
                            <asp:ListItem Value="3">Tình Trạng</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSearch" runat="server" placeholder="Nhập từ khóa cần tìm."></asp:TextBox>
                    </td>
                    <td>
                        <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn mauxanh"><i class="mdi mdi-account-search"></i> Tìm Kiếm</asp:LinkButton>
                    </td>
                    <td>
                        <asp:LinkButton ID="btnRefesh" runat="server" CssClass="btn maureu"><i class="mdi mdi-refresh"></i> Refresh</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>

        <div class="list-group-item group">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gv_NhanSu" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource01_NhanSu" Width="100%" DataKeyNames="MaNhanVien">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-xs maureu" runat="server" CausesValidation="False" CommandName="Select" Text='<i class="fe-list"></i>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="MaNhanVien" HeaderText="Mã N.Viên" SortExpression="MaNhanVien" ReadOnly="True">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="HoLot" HeaderText="Họ Lót" SortExpression="HoLot">
                                <ItemStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Ten" HeaderText="Tên" SortExpression="Ten">
                                <ItemStyle Width="75px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DiDong" HeaderText="Di Động" SortExpression="DiDong">
                                <ItemStyle Width="180px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div class="list-group-item">
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#thongtincanhan" data-toggle="tab">Thông Tin</a></li>
                        <li><a href="#lienhekhancap" data-toggle="tab">Liên Hệ Khẩn Cấp</a></li>
                        <li><a href="#bangcap" data-toggle="tab">Bằng Cấp</a></li>
                        <li><a href="#chungchi" data-toggle="tab">Chứng Chỉ</a></li>
                        <li><a href="#kynang" data-toggle="tab">Kỹ Năng</a></li>
                        <li><a href="#congtac" data-toggle="tab">Công Tác</a></li>
                        <li><a href="#chamcong" data-toggle="tab">Chấm Công</a></li>
                        <li><a href="#phepnam" data-toggle="tab">Phép Năm</a></li>
                        <li><a href="#tienluong" data-toggle="tab">Tiền Lương</a></li>
                        <li><a href="#dieuchinhluong" data-toggle="tab">Điều Chỉnh Lương</a></li>
                        <li><a href="#hopdong" data-toggle="tab">Hợp Đồng</a></li>
                        <li><a href="#daotao" data-toggle="tab">Đào Tạo</a></li>
                        <li><a href="#thangtien" data-toggle="tab">Thăng Tiến</a></li>
                        <li><a href="#khenthuong" data-toggle="tab">Khen Thưởng</a></li>
                        <li><a href="#kyluat" data-toggle="tab">Kỷ Luật</a></li>
                        <li><a href="#suckhoe" data-toggle="tab">Khám Sức Khỏe</a></li>
                    </ul>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div class="tab-content">
                        <%---------------------------------Tab Thong Tin Ca Nhan----------------------------------%>
                        <div class="tab-pane active" id="thongtincanhan" tabindex="1" style="margin-top: 15px;">
                            <asp:DetailsView ID="DetailsView1" runat="server" CssClass="table table-condensed table-hover" Width="100%" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MaNhanVien,MaDanToc,MaQuocTich,MaTrinhDoHocVan,MaTonGiao,MaBoPhan" DataSourceID="SqlDataSource01a_ChiTietNhanSu" ForeColor="Black" GridLines="Horizontal">
                                <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                <Fields>
                                    <asp:TemplateField HeaderText="Hình Ảnh" SortExpression="HinhAnh">
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" runat="server" Height="200px" Width="175px" ImageUrl='<%# Bind("HinhAnh") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="MaNhanVien" HeaderText="Mã N.Viên" ReadOnly="True" SortExpression="MaNhanVien">
                                        <HeaderStyle Width="150px" />
                                    </asp:BoundField>
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
                                    <asp:BoundField DataField="ChucVuHienTai" HeaderText="Chức Vụ Hiện Tại" SortExpression="ChucVuHienTai" />
                                    <asp:BoundField DataField="NgayVaoLamViec" HeaderText="Ngày Vào Làm Việc" SortExpression="NgayVaoLamViec" DataFormatString="{0:MM/dd/yyyy}" />
                                    <asp:BoundField DataField="NgayKetThucThuViec" HeaderText="Ngày Kết Thúc Thử Việc" SortExpression="NgayKetThucThuViec" DataFormatString="{0:MM/dd/yyyy}" />
                                    <asp:BoundField DataField="NgayKyHopDongLaoDong" HeaderText="Ngày Ký HĐLĐ" SortExpression="NgayKyHopDongLaoDong" DataFormatString="{0:MM/dd/yyyy}" />
                                    <asp:BoundField DataField="DienThoai" HeaderText="Điện Thoại" SortExpression="DienThoai" />
                                    <asp:BoundField DataField="DiDong" HeaderText="Di Động" SortExpression="DiDong" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                    <asp:BoundField DataField="EmailCaNhan" HeaderText="Email Cá Nhân" SortExpression="EmailCaNhan" />
                                    <asp:BoundField DataField="FaceBook" HeaderText="FaceBook" SortExpression="FaceBook" />
                                    <asp:BoundField DataField="SoBHXH" HeaderText="Số BHXH" SortExpression="SoBHXH" />
                                    <asp:BoundField DataField="MaSoThue" HeaderText="Mã Số Thuế" SortExpression="MaSoThue" />
                                    <asp:BoundField DataField="SoTaiKhoan" HeaderText="Số Tài Khoản" SortExpression="SoTaiKhoan" />
                                    <asp:TemplateField HeaderText="Thông Báo Trúng Tuyển" SortExpression="ThongBaoTrungTuyen">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Bind("ThongBaoTrungTuyen") %>' Target="_blank" CssClass="btn btn-xs btn-primary"><i class="fe-eye"></i> Xem</asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Quyết Định Trúng Tuyển" SortExpression="QuyetDinhTuyenDung">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Bind("QuyetDinhTuyenDung")%>' Target="_blank" CssClass="btn btn-xs btn-primary"><i class="fe-eye"></i> Xem</asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Hồ Sơ" SortExpression="HoSo">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Bind("HoSo")%>' Target="_blank" CssClass="btn btn-xs btn-primary"><i class="fe-eye"></i> Xem</asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="TinhTrang" HeaderText="Tình Trạng" SortExpression="TinhTrang" />
                                    <asp:BoundField DataField="NgayNghi" HeaderText="Ngày Nghỉ" SortExpression="NgayNghi" DataFormatString="{0:MM/dd/yyyy}" />
                                    <asp:BoundField DataField="GhiChu" HeaderText="Ghi Chú" SortExpression="GhiChu" />
                                    <asp:BoundField DataField="TenDanToc" HeaderText="Dân Tộc" SortExpression="TenDanToc" />
                                    <asp:BoundField DataField="TenQuocTich" HeaderText="Quốc Tịch" SortExpression="TenQuocTich" />
                                    <asp:BoundField DataField="TrinhDoHocVan" HeaderText="Trình Độ Học Vấn" SortExpression="TrinhDoHocVan" />
                                    <asp:BoundField DataField="TenTonGiao" HeaderText="Tôn Giáo" SortExpression="TenTonGiao" />
                                    <asp:BoundField DataField="TenBoPhan" HeaderText="Phòng/ Ban" SortExpression="TenBoPhan" />
                                </Fields>
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" Width="120px" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            </asp:DetailsView>
                        </div>

                        <%---------------------------------Tab Lien He Khan Cap---------------------------------%>
                        <div class="tab-pane document" id="lienhekhancap" tabindex="2" style="margin-top: 15px;">
                            <asp:GridView ID="gv_LienHeKhanCap" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource02_LienHeKhanCap" DataKeyNames="MaLienHe">
                                <Columns>
                                    <asp:BoundField DataField="NguoiLienHe" HeaderText="Người Liên Hệ" SortExpression="NguoiLienHe">
                                        <ItemStyle Width="180px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="QuanHe" HeaderText="Quan Hệ" SortExpression="QuanHe">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DienThoai" HeaderText="Điện Thoại" SortExpression="DienThoai">
                                        <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DiDong" HeaderText="Di Động" SortExpression="DiDong">
                                        <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DiaChi" HeaderText="Địa Chỉ" SortExpression="DiaChi" />
                                </Columns>
                            </asp:GridView>
                        </div>

                        <%---------------------------------Tab Bang Cap----------------------------------%>
                        <div class="tab-pane document" id="bangcap" tabindex="3" style="margin-top: 15px;">
                            <asp:GridView ID="gv_BangCap" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource03_BangCap" Width="100%">
                                <Columns>
                                    <asp:TemplateField HeaderText="Tên Bằng" SortExpression="TenBang">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Bind("TenBang") %>' NavigateUrl='<%# Bind("DinhKem")%>' Target="_blank"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> Xem</asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="250px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="SoBang" HeaderText="Số Bằng" SortExpression="SoBang">
                                        <ItemStyle Width="120px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NgayCap" HeaderText="Ngày Cấp" SortExpression="NgayCap" DataFormatString="{0:MM/dd/yyyy}">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DonViCap" HeaderText="Đơn Vị Cấp" SortExpression="DonViCap" />
                                </Columns>
                            </asp:GridView>
                        </div>

                        <%---------------------------------Tab Chung Chi----------------------------------%>
                        <div class="tab-pane document" id="chungchi" tabindex="4" style="margin-top: 15px;">
                            <asp:GridView ID="gv_ChungChi" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource04_ChungChi" Width="100%">
                                <Columns>
                                    <asp:TemplateField HeaderText="Tên Chứng Chỉ" SortExpression="TenChungChi">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Bind("TenChungChi")%>' NavigateUrl='<%# Bind("DinhKem")%>' Target="_blank"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"> Xem</asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="250px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="SoChungChi" HeaderText="Số Chứng Chỉ" SortExpression="SoChungChi">
                                        <ItemStyle Width="120px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CapBac" HeaderText="Bậc" SortExpression="CapBac">
                                        <ItemStyle Width="50px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NgayCap" HeaderText="Ngày Cấp" SortExpression="NgayCap" DataFormatString="{0:MM/dd/yyyy}">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ThoiHan" HeaderText="Thời Hạn" SortExpression="ThoiHan" DataFormatString="{0:MM/dd/yyyy}">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DonViCap" HeaderText="Đơn Vị Cấp" SortExpression="DonViCap">
                                        <ItemStyle Width="200px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="GhiChu" HeaderText="Ghi Chú" SortExpression="GhiChu" />
                                </Columns>
                            </asp:GridView>
                        </div>

                        <%---------------------------------Tab Ky Nang----------------------------------%>
                        <div class="tab-pane document" id="kynang" tabindex="5" style="margin-top: 15px;">
                            <asp:GridView ID="gv_KyNang" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource05_KyNang" Width="100%" DataKeyNames="MaKyNang">
                                <Columns>
                                    <asp:BoundField DataField="LoaiKyNang" HeaderText="Kỹ Năng" SortExpression="LoaiKyNang">
                                        <ItemStyle Width="200px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="KyNang" HeaderText="Mô Tả" SortExpression="KyNang" />
                                </Columns>
                            </asp:GridView>
                        </div>

                        <%---------------------------------Tab Cong Tac----------------------------------%>
                        <div class="tab-pane document" id="congtac" tabindex="6" style="margin-top: 15px;">
                            <asp:GridView ID="gv_CongTac" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource06_CongTac" DataKeyNames="MaChiNhanh,MaBoPhan,MaNhanVien,MaCongTac,MaDanToc,MaTrinhDoHocVan,MaQuocTich,MaTonGiao">
                                <Columns>
                                    <asp:BoundField DataField="ThoiGian" HeaderText="Thời Gian" SortExpression="ThoiGian">
                                        <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CongTy" HeaderText="Công Ty" SortExpression="CongTy">
                                        <ItemStyle Width="200px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ViTri" HeaderText="Vị Trí" SortExpression="ViTri">
                                        <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Mô Tả Công Việc" SortExpression="MoTaCongViec">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("MoTaCongViec") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("MoTaCongViec") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>

                        <%---------------------------------Tab Cham Cong----------------------------------%>
                        <div class="tab-pane document" id="chamcong" tabindex="7" style="margin-top: 15px;">
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:GridView ID="gv_ChamCong" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource07_ChamCong">
                                        <Columns>
                                            <asp:BoundField DataField="NgayCong" HeaderText="Ngày Công" SortExpression="NgayCong" DataFormatString="{0:MM/dd/yyyy}">
                                                <ItemStyle Width="100px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Cong" HeaderText="Công" SortExpression="Cong">
                                                <ItemStyle Width="100px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng" SortExpression="SoLuong">
                                                <ItemStyle Width="100px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="MaDuAn" HeaderText="Mã Dự Án" SortExpression="MaDuAn">
                                                <ItemStyle Width="100px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="TenDuAn" HeaderText="Tên Dự Án" SortExpression="TenDuAn">
                                                <ItemStyle Width="250px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="GhiChu" HeaderText="Ghi Chú" SortExpression="GhiChu" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>

                        <%---------------------------------Tab Phep Nam----------------------------------%>
                        <div class="tab-pane document" id="phepnam" tabindex="8" style="margin-top: 15px;">
                            <asp:GridView ID="gv_PhepNam" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource08_PhepNam" DataKeyNames="MaPhepNam">

                                <Columns>
                                    <asp:BoundField DataField="NgayXinPhep" HeaderText="Ngày Xin" SortExpression="NgayXinPhep" DataFormatString="{0:MM/dd/yyyy}">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="LyDoNghi" HeaderText="Lý Do Nghỉ" SortExpression="LyDoNghi">
                                        <ItemStyle Width="200px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="BanGiao" HeaderText="Bàn Giao" SortExpression="BanGiao">
                                        <ItemStyle Width="200px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="LienLac" HeaderText="Liên Lạc" SortExpression="LienLac" />
                                </Columns>
                            </asp:GridView>
                        </div>

                        <%---------------------------------Tab Tien Luong----------------------------------%>
                        <div class="tab-pane document" id="tienluong" tabindex="9" style="margin-top: 15px;">
                            <asp:GridView ID="gv_Luong" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource09_Luong">
                                <Columns>
                                    <asp:BoundField DataField="Thang" HeaderText="Tháng">
                                        <ItemStyle Width="75px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Nam" HeaderText="Năm">
                                        <ItemStyle Width="75px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Ngay" HeaderText="Ngày" SortExpression="Ngay" DataFormatString="{0:MM/dd/yyyy}">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="LuongCoBan" HeaderText="Lương Cơ Bản" SortExpression="LuongCoBan" DataFormatString="{0:#,0.00;(#,0.00)}">
                                        <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PhuCap" HeaderText="Phụ Cấp" SortExpression="PhuCap" DataFormatString="{0:#,0.00;(#,0.00)}">
                                        <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="HoTroKhac" HeaderText="Hỗ Trợ Khác" SortExpression="HoTroKhac" DataFormatString="{0:#,0.00;(#,0.00)}">
                                        <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TongLuong" HeaderText="Tổng Lương" ReadOnly="True" SortExpression="TongLuong" DataFormatString="{0:#,0.00;(#,0.00)}">
                                        <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TienThucTe" HeaderText="Tiền Thực Tế" ReadOnly="True" SortExpression="TienThucTe" DataFormatString="{0:#,0.00;(#,0.00)}" />
                                </Columns>
                            </asp:GridView>
                        </div>

                        <%---------------------------------Tab Dieu Chinh Luong----------------------------------%>
                        <div class="tab-pane document" id="dieuchinhluong" tabindex="10" style="margin-top: 15px;">
                            <asp:GridView ID="gv_DieuChinhLuong" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource10_DieuChinhLuong" DataKeyNames="MaChiNhanh,MaBoPhan,MaNhanVien,MaDieuChinh">
                                <Columns>
                                    <asp:BoundField DataField="Ngay" HeaderText="Ngày" SortExpression="Ngay" DataFormatString="{0:MM/dd/yyyy}">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="LuongCoBan" HeaderText="Lương Cơ Bản" SortExpression="LuongCoBan" DataFormatString="{0:#,0.00;(#,0.00)}">
                                        <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="LuongGross" HeaderText="Lương Gross" SortExpression="LuongGross" DataFormatString="{0:#,0.00;(#,0.00)}">
                                        <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="LyDoDieuChinh" HeaderText="Lý Do Điều Chỉnh" SortExpression="LyDoDieuChinh" />
                                </Columns>
                            </asp:GridView>
                        </div>

                        <%---------------------------------Tab Hop Dong Lao Dong----------------------------------%>
                        <div class="tab-pane document" id="hopdong" tabindex="11" style="margin-top: 15px;">
                            <asp:GridView ID="gv_HopDongLaoDong" runat="server" Width="1500px" AutoGenerateColumns="False" DataSourceID="SqlDataSource11_HopDongLaoDong">
                                <Columns>
                                    <asp:BoundField DataField="SoHopDong" HeaderText="Số Hợp Đồng" SortExpression="SoHopDong">
                                        <ItemStyle Width="120px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TenHopDong" HeaderText="Tên Hợp Đồng" SortExpression="TenHopDong" />
                                    <asp:BoundField DataField="LoaiHopDong" HeaderText="Loại Hợp Đồng" SortExpression="LoaiHopDong">
                                        <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TuNgay" HeaderText="Từ Ngày" SortExpression="TuNgay" DataFormatString="{0:MM/dd/yyyy}">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DenNgay" HeaderText="Đến Ngày" SortExpression="DenNgay" DataFormatString="{0:MM/dd/yyyy}">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="LuongCoBan" HeaderText="Lương Cơ Bản" SortExpression="LuongCoBan" DataFormatString="{0:#,0.00;(#,0.00)}">
                                        <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PhuCapTrachNhiem" HeaderText="Phụ Cấp" SortExpression="PhuCapTrachNhiem" DataFormatString="{0:#,0.00;(#,0.00)}">
                                        <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="HoTroKhac" HeaderText="Hỗ Trợ Khác" SortExpression="HoTroKhac" DataFormatString="{0:#,0.00;(#,0.00)}">
                                        <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TongLuong" HeaderText="Tổng Lương" ReadOnly="True" SortExpression="TongLuong" DataFormatString="{0:#,0.00;(#,0.00)}">
                                        <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TinhTrangLamViec" HeaderText="Tình Trạng" SortExpression="TinhTrangLamViec" />
                                </Columns>
                            </asp:GridView>
                        </div>

                        <%---------------------------------Tab Dao Tao----------------------------------%>
                        <div class="tab-pane document" id="daotao" tabindex="12" style="margin-top: 15px;">
                            <asp:GridView ID="gv_DaoTao" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource12_DaoTao" Width="1500px" DataKeyNames="MaYeuCau">
                                <Columns>
                                    <asp:BoundField DataField="MaYeuCau" HeaderText="Mã Yêu Cầu" SortExpression="MaYeuCau" ReadOnly="True">
                                        <ItemStyle Width="120px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NoiDungDaoTao" HeaderText="Nội Dung Đào Tạo" SortExpression="NoiDungDaoTao">
                                        <ItemStyle Width="250px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TenKhoaHoc" HeaderText="Tên Khóa Học" SortExpression="TenKhoaHoc">
                                        <ItemStyle Width="250px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DonViToChuc" HeaderText="Đơn Vị Tổ Chức" SortExpression="DonViToChuc" />
                                    <asp:BoundField DataField="ThoiGian" HeaderText="Thời Gian" SortExpression="ThoiGian">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ChiPhiDuKien" HeaderText="Chi Phí Dự Kiến" SortExpression="ChiPhiDuKien" />
                                    <asp:BoundField DataField="DiaDiem" HeaderText="Địa Điểm" SortExpression="DiaDiem">
                                        <ItemStyle Width="200px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Ngay" HeaderText="Ngày" SortExpression="Ngay" DataFormatString="{0:MM/dd/yyyy}">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng" SortExpression="SoLuong">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </div>

                        <%---------------------------------Tab Thang Tien----------------------------------%>
                        <div class="tab-pane document" id="thangtien" tabindex="13" style="margin-top: 15px;">
                            <asp:GridView ID="gv_ThangTien" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource13_ThangTien">
                                <Columns>
                                    <asp:BoundField DataField="Ngay" HeaderText="Ngày" SortExpression="Ngay" DataFormatString="{0:MM/dd/yyyy}">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TenChucVu" HeaderText="Chức Vụ" SortExpression="TenChucVu">
                                        <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NoiDung" HeaderText="Nội Dung" SortExpression="NoiDung">
                                        <ItemStyle Width="250px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="GhiChu" HeaderText="Ghi Chú" SortExpression="GhiChu" />

                                </Columns>
                            </asp:GridView>
                        </div>

                        <%---------------------------------Tab Khen Thuong----------------------------------%>
                        <div class="tab-pane document" id="khenthuong" tabindex="14" style="margin-top: 15px;">
                            <asp:GridView ID="gv_Thuong" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource14_Thuong" Width="100%">
                                <Columns>
                                    <asp:BoundField DataField="NgayThuong" HeaderText="Ngày Thưởng" SortExpression="NgayThuong" DataFormatString="{0:MM/dd/yyyy}">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="SoTien" HeaderText="Số Tiền" SortExpression="SoTien" DataFormatString="{0:#,0.00;(#,0.00)}">
                                        <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="LyDoThuong" HeaderText="Lý Do Thưởng" SortExpression="LyDoThuong">
                                        <ItemStyle Width="250px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="GhiChu" HeaderText="Ghi Chú" SortExpression="GhiChu" />
                                </Columns>
                            </asp:GridView>
                        </div>

                        <%---------------------------------Tab Ky Luat----------------------------------%>
                        <div class="tab-pane document" id="kyluat" tabindex="15" style="margin-top: 15px;">
                            <asp:GridView ID="gv_KyLuat" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource15_KyLuat" Width="100%" DataKeyNames="MaChiNhanh,MaBoPhan,MaNhanVien,MaKyLuat">
                                <Columns>
                                    <asp:BoundField DataField="Ngay" HeaderText="Ngày" SortExpression="Ngay" DataFormatString="{0:MM/dd/yyyy}">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NoiDung" HeaderText="Nội Dung" SortExpression="NoiDung">
                                        <ItemStyle Width="250px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="HinhThucKyLuat" HeaderText="Hình Thức Kỷ Luật" SortExpression="HinhThucKyLuat">
                                        <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ThoiHan" HeaderText="Thời Hạn" SortExpression="ThoiHan" DataFormatString="{0:MM/dd/yyyy}">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="GhiChu" HeaderText="Ghi Chú" SortExpression="GhiChu" />
                                </Columns>
                            </asp:GridView>
                        </div>

                        <%---------------------------------Tab Suc Khoe----------------------------------%>
                        <div class="tab-pane document" id="suckhoe" tabindex="16" style="margin-top: 15px;">
                            <asp:GridView ID="gv_KhamSucKhoe" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource16_SucKhoe" Width="100%" DataKeyNames="MaChiNhanh,MaBoPhan,MaNhanVien,MaSucKhoe">
                                <Columns>
                                    <asp:BoundField DataField="NgayKham" HeaderText="Ngày Khám" SortExpression="NgayKham" DataFormatString="{0:MM/dd/yyyy}">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NoiDungKham" HeaderText="Nội Dung Khám" SortExpression="NoiDungKham">
                                        <ItemStyle Width="250px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NoiKham" HeaderText="Nơi Khám" SortExpression="NoiKham">
                                        <ItemStyle Width="200px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TinhTrangSucKhoe" HeaderText="Tình Trạng Sức Khỏe" SortExpression="TinhTrangSucKhoe" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource01_NhanSu" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
            SelectCommand="SELECT hr_NhanVien.MaNhanVien, hr_NhanVien.HoLot, hr_NhanVien.Ten, hr_NhanVien.DiDong, hr_NhanVien.Email, hr_NhanVien.BoPhanLamViecID, hr_ChiNhanh.MaCongTy FROM hr_NhanVien INNER JOIN hr_BoPhanLamViec ON hr_NhanVien.BoPhanLamViecID = hr_BoPhanLamViec.MaBoPhan INNER JOIN hr_ChiNhanh ON hr_BoPhanLamViec.MaChiNhanh = hr_ChiNhanh.MaChiNhanh WHERE (hr_ChiNhanh.MaCongTy = @MaCongTy)">
            <SelectParameters>
                <asp:SessionParameter Name="MaCongTy" SessionField="MaCongTy" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource01a_ChiTietNhanSu" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
            SelectCommand="SELECT hr_NhanVien.MaNhanVien, hr_NhanVien.HoLot, hr_NhanVien.Ten, hr_NhanVien.NgaySinh, hr_NhanVien.NoiSinh, hr_NhanVien.NguyenQuan, hr_NhanVien.GioiTinh, hr_NhanVien.TinhTrangHonNhan, hr_NhanVien.SoCon, hr_NhanVien.SoCMND, hr_NhanVien.NgayCap, hr_NhanVien.NoiCap, hr_NhanVien.DiaChiThuongTru, hr_NhanVien.DiaChiTamTru, hr_NhanVien.ChucVuHienTai, hr_NhanVien.NgayVaoLamViec, hr_NhanVien.NgayKetThucThuViec, hr_NhanVien.NgayKyHopDongLaoDong, hr_NhanVien.DienThoai, hr_NhanVien.DiDong, hr_NhanVien.Email, hr_NhanVien.EmailCaNhan, hr_NhanVien.FaceBook, hr_NhanVien.SoBHXH, hr_NhanVien.MaSoThue, hr_NhanVien.SoTaiKhoan, hr_NhanVien.HinhAnh, hr_NhanVien.ThongBaoTrungTuyen, hr_NhanVien.QuyetDinhTuyenDung, hr_NhanVien.HoSo, hr_NhanVien.TinhTrang, hr_NhanVien.NgayNghi, hr_NhanVien.GhiChu, hr_DanToc.MaDanToc, hr_DanToc.TenDanToc, hr_QuocTich.MaQuocTich, hr_QuocTich.TenQuocTich, hr_TrinhDoHocVan.MaTrinhDoHocVan, hr_TrinhDoHocVan.TrinhDoHocVan, hr_TonGiao.MaTonGiao, hr_TonGiao.TenTonGiao, hr_BoPhanLamViec.MaBoPhan, hr_BoPhanLamViec.TenBoPhan FROM hr_NhanVien INNER JOIN hr_DanToc ON hr_NhanVien.DanTocID = hr_DanToc.MaDanToc INNER JOIN hr_QuocTich ON hr_NhanVien.QuocTichID = hr_QuocTich.MaQuocTich INNER JOIN hr_TrinhDoHocVan ON hr_NhanVien.TrinhDoHocVanID = hr_TrinhDoHocVan.MaTrinhDoHocVan INNER JOIN hr_TonGiao ON hr_NhanVien.TonGiaoID = hr_TonGiao.MaTonGiao INNER JOIN hr_BoPhanLamViec ON hr_NhanVien.BoPhanLamViecID = hr_BoPhanLamViec.MaBoPhan WHERE (hr_NhanVien.MaNhanVien = @MaNhanVien)">
            <SelectParameters>
                <asp:ControlParameter ControlID="gv_NhanSu" Name="MaNhanVien" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource02_LienHeKhanCap" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
            SelectCommand="SELECT * FROM [hr_LienHeKhanCap] WHERE ([MaNhanVien] = @MaNhanVien)">
            <SelectParameters>
                <asp:ControlParameter ControlID="gv_NhanSu" Name="MaNhanVien" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource03_BangCap" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
            SelectCommand="SELECT TenBang, SoBang, NgayCap, DonViCap, DinhKem FROM vhr_BangCap WHERE (MaNhanVien = @MaNhanVien)">
            <SelectParameters>
                <asp:ControlParameter ControlID="gv_NhanSu" Name="MaNhanVien" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource04_ChungChi" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
            SelectCommand="SELECT TenChungChi, SoChungChi, CapBac, NgayCap, ThoiHan, DonViCap, GhiChu, DinhKem FROM vhr_ChungChi WHERE (MaNhanVien = @MaNhanVien)">
            <SelectParameters>
                <asp:ControlParameter ControlID="gv_NhanSu" DefaultValue="" Name="MaNhanVien" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource05_KyNang" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
            SelectCommand="SELECT * FROM [hr_KyNang] WHERE ([MaNhanVien] = @MaNhanVien)">
            <SelectParameters>
                <asp:ControlParameter ControlID="gv_NhanSu" Name="MaNhanVien" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource06_CongTac" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
            SelectCommand="SELECT MaChiNhanh, ChiNhanh, MaBoPhan, TenBoPhan, MaNhanVien, HoLot, Ten, HoTen, NgaySinh, NoiSinh, NguyenQuan, GioiTinh, TinhTrangHonNhan, SoCon, SoCMND, NgayCap, NoiCap, DiaChiThuongTru, DiaChiTamTru, ChucVuHienTai, NgayVaoLamViec, NgayKetThucThuViec, NgayKyHopDongLaoDong, DienThoai, DiDong, Email, EmailCaNhan, FaceBook, SoBHXH, MaSoThue, SoTaiKhoan, HinhAnh, ThongBaoTrungTuyen, HoSo, TinhTrang, MaCongTac, ThoiGian, CongTy, ViTri, MoTaCongViec, NgayBatDau, MaDanToc, TenDanToc, MaTrinhDoHocVan, TrinhDoHocVan, MaQuocTich, TenQuocTich, MaTonGiao, TenTonGiao FROM vhr_CongTac WHERE (MaNhanVien = @MaNhanVien) ORDER BY NgayBatDau DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="gv_NhanSu" Name="MaNhanVien" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource07_ChamCong" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
            SelectCommand="SELECT MaLoai, Cong, NgayCong, SoLuong, GhiChu, MaDuAn, TenDuAn, Thang, Nam FROM vhr_ChamCong WHERE (MaNhanVien = @MaNhanVien) ORDER BY NgayCong DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="gv_NhanSu" Name="MaNhanVien" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource08_PhepNam" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
            SelectCommand="SELECT * FROM [hr_PhepNam] WHERE ([MaNhanVien] = @MaNhanVien)">
            <SelectParameters>
                <asp:ControlParameter ControlID="gv_NhanSu" Name="MaNhanVien" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource09_Luong" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
            SelectCommand="SELECT MaNhanVien, HoTen, Ngay, GioCongChuan, GioCongThucTe, LuongCoBan, PhuCap, HoTroKhac, BaoHiemBatBuoc, ThueTNCN, HeSo, TangCa, Khac, GhiChu, TongLuong, LuongDongBHBB, TienLuongThang, TienThucTe, MaChiNhanh, ChiNhanh, MaBoPhan, TenBoPhan, ChucVuHienTai, Thang, Nam FROM vhr_TienLuong WHERE (MaNhanVien = @MaNhanVien)">
            <SelectParameters>
                <asp:ControlParameter ControlID="gv_NhanSu" Name="MaNhanVien" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource10_DieuChinhLuong" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
            SelectCommand="SELECT * FROM [vhr_DieuChinhLuong] WHERE ([MaNhanVien] = @MaNhanVien) ORDER BY [Ngay] DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="gv_NhanSu" Name="MaNhanVien" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource11_HopDongLaoDong" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
            SelectCommand="SELECT LoaiHopDong, SoHopDong, TenHopDong, TuNgay, DenNgay, LuongCoBan, PhuCapTrachNhiem, HoTroKhac, TinhTrangLamViec, LuongCoBan + PhuCapTrachNhiem + HoTroKhac AS TongLuong, MoTaCongViec FROM vhr_HopDongLaoDong WHERE (MaNhanVien = @MaNhanVien)">
            <SelectParameters>
                <asp:ControlParameter ControlID="gv_NhanSu" Name="MaNhanVien" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource12_DaoTao" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
            SelectCommand="SELECT [MaYeuCau], [NoiDungDaoTao], [TenKhoaHoc], [DonViToChuc], [ThoiGian], [ChiPhiDuKien], [DiaDiem], [Ngay], [SoLuong] FROM [vhr_DaoTao] WHERE ([MaNhanVien] = @MaNhanVien)">
            <SelectParameters>
                <asp:ControlParameter ControlID="gv_NhanSu" Name="MaNhanVien" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource13_ThangTien" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
            SelectCommand="SELECT Ngay, NoiDung, GhiChu, TenChucVu FROM vhr_ThangTien WHERE (MaNhanVien = @MaNhanVien) ORDER BY Ngay DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="gv_NhanSu" Name="MaNhanVien" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource14_Thuong" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
            SelectCommand="SELECT [NgayThuong], [SoTien], [LyDoThuong], [GhiChu] FROM [vhr_KhenThuong] WHERE ([MaNhanVien] = @MaNhanVien)">
            <SelectParameters>
                <asp:ControlParameter ControlID="gv_NhanSu" Name="MaNhanVien" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource15_KyLuat" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
            SelectCommand="SELECT * FROM [vhr_KyLuat] WHERE ([MaNhanVien] = @MaNhanVien)">
            <SelectParameters>
                <asp:ControlParameter ControlID="gv_NhanSu" Name="MaNhanVien" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource16_SucKhoe" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
            SelectCommand="SELECT * FROM [vhr_KhamSucKhoe] WHERE ([MaNhanVien] = @MaNhanVien)">
            <SelectParameters>
                <asp:ControlParameter ControlID="gv_NhanSu" Name="MaNhanVien" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
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
