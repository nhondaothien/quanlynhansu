<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../HR.Master" CodeBehind="hrU09_HopDongLaoDong.aspx.vb" Inherits="HRM.hrU09_HopDongLaoDong" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="list-group">
        <div class="list-group-item active">
            CẬP NHẬT CHI TIẾT PHÉP NĂM
        </div>

        <div class="list-group-item document">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <table class="table">
                        <tr>
                            <td>Mã Nhân Viên:</td>
                            <td>
                                <asp:Label ID="lblMaNhanVien" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                 <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn mauxanh" ToolTip="Thêm mới" OnClick="btnAdd_Click"><i class="fe-plus-square"></i> New</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="GridView1" runat="server" Width="100%" OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="MaHopDong" AllowPaging="True">
                        <Columns>
                             <asp:ButtonField CommandName="editRecord" ButtonType="Link" HeaderText="Sửa" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn mauvang btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" HeaderText="Xóa" Text='<i class="fe-trash-2"></i>' ItemStyle-Width="40px">
                                <ControlStyle CssClass="btn maudo btn-xs"></ControlStyle>
                                <ItemStyle Width="40px" />
                            </asp:ButtonField>
                            <asp:BoundField DataField="MaHopDong" HeaderText="MaHopDong" SortExpression="MaHopDong" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                            <asp:BoundField DataField="SoHopDong" HeaderText="SoHopDong" SortExpression="SoHopDong"/>                           
                            <asp:BoundField DataField="TenHopDong" HeaderText="TenHopDong" SortExpression="TenHopDong"/>
                            <asp:BoundField DataField="LoaiHopDongID" HeaderText="LoaiHopDongID" SortExpression="LoaiHopDongID"/>
                            <asp:BoundField DataField="TuNgay" HeaderText="TuNgay" SortExpression="TuNgay"/>
                            <asp:BoundField DataField="DenNgay" HeaderText="DenNgay" SortExpression="DenNgay" />
                            <asp:BoundField DataField="DiaDiemLamViec" HeaderText="DiaDiemLamViec" SortExpression="DiaDiemLamViec" />
                            <asp:BoundField DataField="SoLaoDong" HeaderText="SoLaoDong" SortExpression="SoLaoDong" />
                            <asp:BoundField DataField="MoTaCongViec" HeaderText="MoTaCongViec" SortExpression="MoTaCongViec" />
                            <asp:BoundField DataField="ThoiGianLamViec" HeaderText="ThoiGianLamViec" SortExpression="ThoiGianLamViec" />
                            <asp:BoundField DataField="DongPhuc" HeaderText="DongPhuc" SortExpression="DongPhuc" />
                            <asp:BoundField DataField="PhuongTienDiLai" HeaderText="PhuongTienDiLai" SortExpression="PhuongTienDiLai" />
                            <asp:BoundField DataField="LuongCoBan" HeaderText="LuongCoBan" SortExpression="LuongCoBan" />
                            <asp:BoundField DataField="PhuCapTrachNhiem" HeaderText="PhuCapTrachNhiem" SortExpression="PhuCapTrachNhiem" />
                            <asp:BoundField DataField="HoTroKhac" HeaderText="HoTroKhac" SortExpression="HoTroKhac" />
                            <asp:BoundField DataField="HinhThucTraLuong" HeaderText="HinhThucTraLuong" SortExpression="HinhThucTraLuong" />
                            <asp:BoundField DataField="TangLuong" HeaderText="TangLuong" SortExpression="TangLuong" />
                            <asp:BoundField DataField="Thuong" HeaderText="Thuong" SortExpression="Thuong" />
                            <asp:BoundField DataField="DaoTao" HeaderText="DaoTao" SortExpression="DaoTao" />
                            <asp:BoundField DataField="CheDoNghiNgoi" HeaderText="CheDoNghiNgoi" SortExpression="CheDoNghiNgoi" />
                            <asp:BoundField DataField="BaoHiem" HeaderText="BaoHiem" SortExpression="BaoHiem" />
                            <asp:BoundField DataField="NgayKy" HeaderText="NgayKy" SortExpression="NgayKy" />
                            <asp:BoundField DataField="TinhTrang" HeaderText="TinhTrang" SortExpression="TinhTrang" />
<%--                            <asp:BoundField DataField="MaNhanVien" HeaderText="MaNhanVien" SortExpression="MaNhanVien" />--%>
                            <asp:BoundField DataField="NguoiSuDungLaoDong" HeaderText="NguoiSuDungLaoDong" SortExpression="NguoiSuDungLaoDong" />
                            <asp:BoundField DataField="ChucVu" HeaderText="ChucVu" SortExpression="ChucVu" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="row">
        <%--Start Add--%>
        <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalScrollableTitle">Thêm Mới</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <asp:UpdatePanel ID="upAdd" runat="server">
                        <ContentTemplate>
                            <div class="modal-body">
                                <%--[SoHopDong], [TenHopDong], [LoaiHopDongID], [TuNgay], [DenNgay], [DiaDiemLamViec], 
                                    [SoLaoDong], [MoTaCongViec], [ThoiGianLamViec], [DongPhuc], [PhuongTienDiLai], [LuongCoBan], 
                                    [PhuCapTrachNhiem], [HoTroKhac], [HinhThucTraLuong], [TangLuong], [Thuong], [DaoTao], [CheDoNghiNgoi], 
                                    [BaoHiem], [NgayKy], [TinhTrang], [MaNhanVien], [NguoiSuDungLaoDong], [ChucVu])--%>
                                <table class="table table-responsive margin-top20">
                                    <tr>
                                        <td>Số Hợp Đồng:</td>
                                        <td>
                                            <asp:TextBox ID="txtSoHopDong" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Tên Hợp Đồng:</td>
                                        <td>
                                            <asp:TextBox ID="txtTenHopDong" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                     <tr>
                                        <td>Loại Hợp Đồng:</td>
                                        <td>
                                            <asp:DropDownList ID="ddlLoaiHopDongID" runat="server" DataSourceID="SqlDataSource2" DataTextField="LoaiHopDong" DataValueField="MaLoai"></asp:DropDownList>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>Từ Ngày: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtTuNgay" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtTuNgay_CalendarExtender" TargetControlID="txtTuNgay" ID="txtTuNgay_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>Đến Ngày: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtDenNgay" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtDenNgay_CalendarExtender" TargetControlID="txtDenNgay" ID="txtDenNgay_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Địa Chỉ Làm Việc:</td>
                                        <td>
                                            <asp:TextBox ID="txtDiaDiemLamViec" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Số Lao Động:</td>
                                        <td>
                                            <asp:TextBox ID="txtSoLaoDong" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>   
                                   <tr>
                                        <td>Mô Tả Công Việc:</td>
                                        <td>
                                            <asp:TextBox ID="txtMoTaCongViec" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Thời Gian Làm Việc:</td>
                                        <td>
                                            <asp:TextBox ID="txtThoiGianLamViec" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Đồng Phục:</td>
                                        <td>
                                            <asp:TextBox ID="txtDongPhuc" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Phương Tiện Đi Lại:</td>
                                        <td>
                                            <asp:TextBox ID="txtPhuongTienDiLai" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Lương Cơ Bản:</td>
                                        <td>
                                            <asp:TextBox ID="txtLuongCoBan" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Phụ Cấp Trách Nhiệm:</td>
                                        <td>
                                            <asp:TextBox ID="txtPhuCapTrachNhiem" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Hỗ Trợ Khác:</td>
                                        <td>
                                            <asp:TextBox ID="txtHoTroKhac" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Hình Thức Trả Lương:</td>
                                        <td>
                                            <asp:TextBox ID="txtHinhThucTraLuong" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Tăng Lương:</td>
                                        <td>
                                            <asp:TextBox ID="txtTangLuong" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Thưởng:</td>
                                        <td>
                                            <asp:TextBox ID="txtThuong" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Đào Tạo:</td>
                                        <td>
                                            <asp:TextBox ID="txtDaoTao" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Chế Độ Nghỉ Ngơi:</td>
                                        <td>
                                            <asp:TextBox ID="txtCheDoNghiNgoi" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Bảo Hiểm:</td>
                                        <td>
                                            <asp:TextBox ID="txtBaoHiem" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                   <tr>
                                        <td>Ngày Ký: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtNgayKy" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgayKy_CalendarExtender" TargetControlID="txtNgayKy" ID="txtNgayKy_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Tình Trạng:</td>
                                        <td>
                                            <asp:TextBox ID="txtTinhTrang" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Người Sử Dụng Lao Động:</td>
                                        <td>
                                            <asp:TextBox ID="txtNguoiSuDungLaoDong" runat="server">0</asp:TextBox>
                                        </td>
                                        <tr>
                                        <td>Chức Vụ:</td>
                                        <td>
                                            <asp:TextBox ID="txtChucVu" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                 
                                </table>
                            </div>
                            <div class="modal-footer">
                                <asp:LinkButton ID="btnAddRecord" runat="server" CssClass="btn mauxanh" OnClick="btnAddRecord_Click"><i class="fe-save"></i> Lưu</asp:LinkButton>
                                <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i> Đóng</button>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnAddRecord" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <%--End Add--%>

        <%--Start Edit--%>
        <div id="editModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Sửa</h4>
                    </div>
                    <div class="modal-body">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <table class="table table-responsive margin-top20">
                                    <tr>
                                        <td>Mã Hợp Đồng:</td>
                                        <td>
                                            <asp:TextBox ID="txtMaHopDong1" runat="server" ReadOnly="true">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Số Hợp Đồng:</td>
                                        <td>
                                            <asp:TextBox ID="txtSoHopDong1" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Tên Hợp Đồng:</td>
                                        <td>
                                            <asp:TextBox ID="txtTenHopDong1" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                     <tr>
                                        <td>Loại Hợp Đồng:</td>
                                        <td>
                                            <asp:DropDownList ID="ddlLoaiHopDongID1" runat="server" DataSourceID="SqlDataSource2" DataTextField="LoaiHopDong" DataValueField="MaLoai"></asp:DropDownList>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>Từ Ngày: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtTuNgay1" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtTuNgay1_CalendarExtender" TargetControlID="txtTuNgay1" ID="txtTuNgay1_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>Đến Ngày: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtDenNgay1" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtDenNgay1_CalendarExtender" TargetControlID="txtDenNgay1" ID="txtDenNgay1_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Địa Chỉ Làm Việc:</td>
                                        <td>
                                            <asp:TextBox ID="txtDiaDiemLamViec1" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Số Lao Động:</td>
                                        <td>
                                            <asp:TextBox ID="txtSoLaoDong1" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>   
                                   <tr>
                                        <td>Mô Tả Công Việc:</td>
                                        <td>
                                            <asp:TextBox ID="txtMoTaCongViec1" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Thời Gian Làm Việc:</td>
                                        <td>
                                            <asp:TextBox ID="txtThoiGianLamViec1" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Đồng Phục:</td>
                                        <td>
                                            <asp:TextBox ID="txtDongPhuc1" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Phương Tiện Đi Lại:</td>
                                        <td>
                                            <asp:TextBox ID="txtPhuongTienDiLai1" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Lương Cơ Bản:</td>
                                        <td>
                                            <asp:TextBox ID="txtLuongCoBan1" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Phụ Cấp Trách Nhiệm:</td>
                                        <td>
                                            <asp:TextBox ID="txtPhuCapTrachNhiem1" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Hỗ Trợ Khác:</td>
                                        <td>
                                            <asp:TextBox ID="txtHoTroKhac1" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Hình Thức Trả Lương:</td>
                                        <td>
                                            <asp:TextBox ID="txtHinhThucTraLuong1" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Tăng Lương:</td>
                                        <td>
                                            <asp:TextBox ID="txtTangLuong1" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Thưởng:</td>
                                        <td>
                                            <asp:TextBox ID="txtThuong1" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Đào Tạo:</td>
                                        <td>
                                            <asp:TextBox ID="txtDaoTao1" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Chế Độ Nghỉ Ngơi:</td>
                                        <td>
                                            <asp:TextBox ID="txtCheDoNghiNgoi1" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Bảo Hiểm:</td>
                                        <td>
                                            <asp:TextBox ID="txtBaoHiem1" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                   <tr>
                                        <td>Ngày Ký: (*)</td>
                                        <td>
                                            <asp:TextBox ID="txtNgayKy1" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" Format="yyyy/MM/dd" BehaviorID="txtNgayKy1_CalendarExtender" TargetControlID="txtNgayKy1" ID="txtNgayKy1_CalendarExtender"></ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>Tình Trạng:</td>
                                        <td>
                                            <asp:TextBox ID="txtTinhTrang1" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                  
                                    <tr>
                                        <td>Người Sử Dụng Lao Động:</td>
                                        <td>
                                            <asp:TextBox ID="txtNguoiSuDungLaoDong1" runat="server">0</asp:TextBox>
                                        </td>
                                       <tr>
                                        <td>Chức Vụ:</td>
                                        <td>
                                            <asp:TextBox ID="txtChucVu1" runat="server">0</asp:TextBox>
                                        </td>
                                    </tr>  
                                 
                                </table>
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
        </div>
        <%--End Edit--%>

        <%--Start Delete--%>
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
                                <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i> Đóng</button>
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
    </div>

    <div class="row">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
            SelectCommand="SELECT * FROM [hr_HopDongLaoDong] WHERE ([MaNhanVien] = @MaNhanVien)"
            InsertCommand="INSERT INTO [hr_HopDongLaoDong] ([SoHopDong], [TenHopDong], [LoaiHopDongID], [TuNgay], [DenNgay], [DiaDiemLamViec], [SoLaoDong], [MoTaCongViec], [ThoiGianLamViec], [DongPhuc], [PhuongTienDiLai], [LuongCoBan], [PhuCapTrachNhiem], [HoTroKhac], [HinhThucTraLuong], [TangLuong], [Thuong], [DaoTao], [CheDoNghiNgoi], [BaoHiem], [NgayKy], [TinhTrang], [MaNhanVien], [NguoiSuDungLaoDong], [ChucVu]) VALUES (@SoHopDong, @TenHopDong, @LoaiHopDongID, @TuNgay, @DenNgay, @DiaDiemLamViec, @SoLaoDong, @MoTaCongViec, @ThoiGianLamViec, @DongPhuc, @PhuongTienDiLai, @LuongCoBan, @PhuCapTrachNhiem, @HoTroKhac, @HinhThucTraLuong, @TangLuong, @Thuong, @DaoTao, @CheDoNghiNgoi, @BaoHiem, @NgayKy, @TinhTrang, @MaNhanVien, @NguoiSuDungLaoDong, @ChucVu)"
            UpdateCommand="UPDATE [hr_HopDongLaoDong] SET [SoHopDong] = @SoHopDong, [TenHopDong] = @TenHopDong, [LoaiHopDongID] = @LoaiHopDongID, [TuNgay] = @TuNgay, [DenNgay] = @DenNgay, [DiaDiemLamViec] = @DiaDiemLamViec, [SoLaoDong] = @SoLaoDong, [MoTaCongViec] = @MoTaCongViec, [ThoiGianLamViec] = @ThoiGianLamViec, [DongPhuc] = @DongPhuc, [PhuongTienDiLai] = @PhuongTienDiLai, [LuongCoBan] = @LuongCoBan, [PhuCapTrachNhiem] = @PhuCapTrachNhiem, [HoTroKhac] = @HoTroKhac, [HinhThucTraLuong] = @HinhThucTraLuong, [TangLuong] = @TangLuong, [Thuong] = @Thuong, [DaoTao] = @DaoTao, [CheDoNghiNgoi] = @CheDoNghiNgoi, [BaoHiem] = @BaoHiem, [NgayKy] = @NgayKy, [TinhTrang] = @TinhTrang, [MaNhanVien] = @MaNhanVien, [NguoiSuDungLaoDong] = @NguoiSuDungLaoDong, [ChucVu] = @ChucVu WHERE [MaHopDong] = @MaHopDong"
            DeleteCommand="DELETE FROM [hr_HopDongLaoDong] WHERE [MaHopDong] = @MaHopDong">
            <DeleteParameters>
                <asp:Parameter Name="MaHopDong" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SoHopDong" Type="String" />
                <asp:Parameter Name="TenHopDong" Type="String" />
                <asp:Parameter Name="LoaiHopDongID" Type="String" />
                <asp:Parameter Name="TuNgay" DbType="Date" />
                <asp:Parameter Name="DenNgay" DbType="Date" />
                <asp:Parameter Name="DiaDiemLamViec" Type="String" />
                <asp:Parameter Name="SoLaoDong" Type="String" />
                <asp:Parameter Name="MoTaCongViec" Type="String" />
                <asp:Parameter Name="ThoiGianLamViec" Type="String" />
                <asp:Parameter Name="DongPhuc" Type="String" />
                <asp:Parameter Name="PhuongTienDiLai" Type="String" />
                <asp:Parameter Name="LuongCoBan" Type="Double" />
                <asp:Parameter Name="PhuCapTrachNhiem" Type="Double" />
                <asp:Parameter Name="HoTroKhac" Type="Double" />
                <asp:Parameter Name="HinhThucTraLuong" Type="String" />
                <asp:Parameter Name="TangLuong" Type="String" />
                <asp:Parameter Name="Thuong" Type="String" />
                <asp:Parameter Name="DaoTao" Type="String" />
                <asp:Parameter Name="CheDoNghiNgoi" Type="String" />
                <asp:Parameter Name="BaoHiem" Type="String" />
                <asp:Parameter DbType="Date" Name="NgayKy" />
                <asp:Parameter Name="TinhTrang" Type="String" />
                <asp:Parameter Name="MaNhanVien" Type="String" />
                <asp:Parameter Name="NguoiSuDungLaoDong" Type="String" />
                <asp:Parameter Name="ChucVu" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="MaNhanVien" SessionField="MaNhanVien" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="SoHopDong" Type="String" />
                <asp:Parameter Name="TenHopDong" Type="String" />
                <asp:Parameter Name="LoaiHopDongID" Type="String" />
                <asp:Parameter Name="TuNgay" DbType="Date" />
                <asp:Parameter Name="DenNgay" DbType="Date" />
                <asp:Parameter Name="DiaDiemLamViec" Type="String" />
                <asp:Parameter Name="SoLaoDong" Type="String" />
                <asp:Parameter Name="MoTaCongViec" Type="String" />
                <asp:Parameter Name="ThoiGianLamViec" Type="String" />
                <asp:Parameter Name="DongPhuc" Type="String" />
                <asp:Parameter Name="PhuongTienDiLai" Type="String" />
                <asp:Parameter Name="LuongCoBan" Type="Double" />
                <asp:Parameter Name="PhuCapTrachNhiem" Type="Double" />
                <asp:Parameter Name="HoTroKhac" Type="Double" />
                <asp:Parameter Name="HinhThucTraLuong" Type="String" />
                <asp:Parameter Name="TangLuong" Type="String" />
                <asp:Parameter Name="Thuong" Type="String" />
                <asp:Parameter Name="DaoTao" Type="String" />
                <asp:Parameter Name="CheDoNghiNgoi" Type="String" />
                <asp:Parameter Name="BaoHiem" Type="String" />
                <asp:Parameter DbType="Date" Name="NgayKy" />
                <asp:Parameter Name="TinhTrang" Type="String" />
                <asp:Parameter Name="MaNhanVien" Type="String" />
                <asp:Parameter Name="NguoiSuDungLaoDong" Type="String" />
                <asp:Parameter Name="ChucVu" Type="String" />
                <asp:Parameter Name="MaHopDong" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT * FROM [hr_LoaiHopDongLaoDong]"></asp:SqlDataSource>
    </div>
    <div class="row">
    </div>

</asp:Content>
