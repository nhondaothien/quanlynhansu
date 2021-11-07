<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="Admin.Master" CodeBehind="A_DuAn.aspx.vb" Inherits="HRM.A_DuAn" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Namespace="CKFinder" Assembly="CKFinder" TagPrefix="CKFinder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="panelPhanQuyen" runat="server">
        <div class="list-group mt-5">
            <div class="list-group-item active">
                DỰ ÁN
            </div>
            <div class="list-group-item">
            </div>

            <div class="list-group-item">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <table class="table table-active">
                            <tr>
                                <td>
                                    <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn mauxanh" ToolTip="Thêm mới" OnClick="btnAdd_Click"><i class="fe-plus-square"></i> New</asp:LinkButton>
                                    <asp:LinkButton ID="btnImport" runat="server" CssClass="btn btn-success" ToolTip="Thêm mới bằng excel" OnClick="btnImport_Click"><i class="fe-upload-cloud"></i> Import</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <div class="form-horizontal" role="form">
                            <div class="form-group">
                                <div class="col-md-12 mt-2">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtSearch" runat="server" placeholder="Nhập từ khóa Tên Dự Án cần tìm!"></asp:TextBox>
                                        <span class="input-group-btn">
                                            <asp:Button ID="btnSearch" runat="server" Text="Tìm!" CausesValidation="False" />
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-responsive" OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="False" DataKeyNames="MaDuAn" DataSourceID="SqlDataSource1_DuAn">
                            <Columns>
                                <asp:ButtonField CommandName="editRecord" ButtonType="Link" HeaderText="Sửa" Text='<i class="fe-edit"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn mauvang btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="deleteRecord" ButtonType="Link" HeaderText="Xóa" Text='<i class="fe-trash-2"></i>' ItemStyle-Width="40px">
                                    <ControlStyle CssClass="btn maudo btn-xs"></ControlStyle>
                                    <ItemStyle Width="40px" />
                                </asp:ButtonField>
                                <asp:CommandField ShowSelectButton="True" HeaderText="Chi Tiết" SelectText="&lt;i class=&quot;fe-list&quot;&gt;&lt;/i&gt;" ItemStyle-Width="40px">
                                <ControlStyle CssClass=" btn btn-xs maureu" />
                                    <ItemStyle Width="40px" />
                                </asp:CommandField>
                                <asp:BoundField HeaderText="Mã Dự Án" DataField="MaDuAn" ReadOnly="True" SortExpression="MaDuAn"></asp:BoundField>
                                <asp:BoundField HeaderText="Tên Dự Án" DataField="TenDuAn" SortExpression="TenDuAn"></asp:BoundField>
                                <asp:BoundField HeaderText="Vị Trí" DataField="ViTri" SortExpression="ViTri" />
                                <asp:BoundField HeaderText="Dịch Vụ" DataField="DichVu" SortExpression="DichVu" />
                                <asp:BoundField HeaderText="Số HĐ" DataField="SoHopDong" SortExpression="SoHopDong" />
                                <asp:BoundField HeaderText="Ngày Ký" DataField="NgayKy" SortExpression="NgayKy" DataFormatString="{0:MM/dd/yyyy}" ></asp:BoundField>
                                <asp:BoundField HeaderText="Bắt Đầu" DataField="BatDau" SortExpression="BatDau" DataFormatString="{0:MM/dd/yyyy}"></asp:BoundField>
                                <asp:BoundField HeaderText="Kết Thúc" DataField="KetThuc" SortExpression="KetThuc" DataFormatString="{0:MM/dd/yyyy}"></asp:BoundField>
                                <asp:BoundField HeaderText="Tình Trạng" DataField="TinhTrang" SortExpression="TinhTrang" />
                                <asp:TemplateField HeaderText="Quy Mô" SortExpression="QuyMo">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("QuyMo") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("QuyMo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Hình Ảnh" DataField="HinhAnh" SortExpression="HinhAnh" />
                                <asp:TemplateField HeaderText="Ghi Chú" SortExpression="GhiChu">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("GhiChu") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("GhiChu") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Mã Khách Hàng" DataField="MaKhachHang" SortExpression="MaKhachHang" />
                                <asp:BoundField HeaderText="Hồ Sơ Url" DataField="HoSoUrl" SortExpression="HoSoUrl" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="list-group-item">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:DetailsView ID="dvDuAn" runat="server" CssClass="table table-condensed table-hover" Height="50px" Width="100%" AutoGenerateRows="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MaDuAn" DataSourceID="SqlDataSource2_ChiTietDuAn" ForeColor="Black" GridLines="Vertical">
                            <AlternatingRowStyle BackColor="White" />
                            <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                            <Fields>
                                <asp:BoundField HeaderText="Mã Dự Án" DataField="MaDuAn" ReadOnly="True" SortExpression="MaDuAn"></asp:BoundField>
                                <asp:BoundField HeaderText="Tên Dự Án" DataField="TenDuAn" SortExpression="TenDuAn"></asp:BoundField>
                                <asp:BoundField HeaderText="Vị Trí" DataField="ViTri" SortExpression="ViTri" />
                                <asp:BoundField HeaderText="Dịch Vụ" DataField="DichVu" SortExpression="DichVu" />
                                <asp:BoundField HeaderText="Số HĐ" DataField="SoHopDong" SortExpression="SoHopDong" />
                                <asp:BoundField HeaderText="Ngày Ký" DataField="NgayKy" SortExpression="NgayKy"></asp:BoundField>
                                <asp:BoundField HeaderText="Bắt Đầu" DataField="BatDau" SortExpression="BatDau"></asp:BoundField>
                                <asp:BoundField HeaderText="Kết Thúc" DataField="KetThuc" SortExpression="KetThuc"></asp:BoundField>
                                <asp:BoundField HeaderText="Tình Trạng" DataField="TinhTrang" SortExpression="TinhTrang" />
                                <asp:TemplateField HeaderText="Quy Mô" SortExpression="QuyMo">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("QuyMo") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("QuyMo") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("QuyMo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Hình Ảnh" SortExpression="HinhAnh">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HinhAnh") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HinhAnh") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" AlternateText="Hình Ảnh Dự Án" CssClass="img-thumbnail" ImageAlign="middle" ImageUrl='<%# Bind("HinhAnh") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ghi Chú" SortExpression="GhiChu">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("GhiChu") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("GhiChu") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("GhiChu") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Mã Khách Hàng" DataField="MaKhachHang" SortExpression="MaKhachHang" />
                                <asp:BoundField HeaderText="Hồ Sơ Url" DataField="HoSoUrl" SortExpression="HoSoUrl" />
                            </Fields>
                            <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#F7F7DE" />
                        </asp:DetailsView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

        <!--Bắt đầu Thêm -->
        <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
            <div class="modal-dialog modal-full">
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
                                <%--[MaDuAn], [TenDuAn], [ViTri], [DichVu], [SoHopDong], 
                                    [NgayKy], [BatDau], [KetThuc], [TinhTrang], [QuyMo], 
                                    [HinhAnh], [GhiChu], [MaKhachHang], [HoSoUrl]--%>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Mã Dự Án (*)</label>
                                            <asp:TextBox ID="txtMaDuAn" CssClass="form-control" runat="server" ReadOnly="false"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Tên Dự Án (*)</label>
                                            <asp:TextBox ID="txtTenDuAn" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-3" class="control-label">Tình Trạng</label>
                                            <asp:DropDownList ID="cbTinhTrang" runat="server" CssClass="form-control" DataSourceID="SqlDataSource5_TinhTrang" DataTextField="TenTinhTrang" DataValueField="MaSo"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-4" class="control-label">Khách Hàng</label>
                                            <asp:DropDownList ID="cbKhachHang" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3_KhachHang" DataTextField="TenKhachHang" DataValueField="MaKhachHang"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-5" class="control-label">Hình Ảnh</label>
                                            <asp:TextBox ID="txtHinhAnh" CssClass="form-control" runat="server"></asp:TextBox>
                                            <div class="input-group-btn mt-2">
                                                <asp:HyperLink ID="uploadlink" runat="server" CssClass="btn btn btn-primary" NavigateUrl="./A_Upload.aspx" Target="_blank"><i class="fe-link"></i> Get Link</asp:HyperLink>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-6" class="control-label">Hồ Sơ</label>
                                        <asp:TextBox ID="txtHoSo" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-7" class="control-label">Vị Trí (*)</label>
                                            <asp:TextBox ID="txtViTri" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-8" class="control-label">Dịch Vụ</label>
                                            <asp:TextBox ID="txtDichVu" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-9" class="control-label">Số Hợp Đồng</label>
                                            <asp:TextBox ID="txtSoHopDong" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-10" class="control-label">Ngày Ký</label>
                                            <asp:TextBox ID="txtNgayKy" CssClass="form-control" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtNgayKy_CalendarExtender" TargetControlID="txtNgayKy" ID="txtNgayKy_CalendarExtender" Format="yyyy/MM/dd"></ajaxToolkit:CalendarExtender>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-11" class="control-label">Ngày Bắt Đầu</label>
                                            <asp:TextBox ID="txtBatDau" CssClass="form-control" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtBatDau_CalendarExtender" TargetControlID="txtBatDau" ID="txtBatDau_CalendarExtender" Format="yyyy/MM/dd"></ajaxToolkit:CalendarExtender>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-12" class="control-label">Ngày Kết Thúc</label>
                                            <asp:TextBox ID="txtKetThuc" CssClass="form-control" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtKetThuc_CalendarExtender" TargetControlID="txtKetThuc" ID="txtKetThuc_CalendarExtender" Format="yyyy/MM/dd"></ajaxToolkit:CalendarExtender>
                                        </div>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-13" class="control-label">Quy Mô</label>
                                        <CKEditor:CKEditorControl ID="txtQuyMo" Height="100" runat="server"></CKEditor:CKEditorControl>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group no-margin">
                                            <label for="field-14" class="control-label">Ghi Chú</label>
                                        <CKEditor:CKEditorControl ID="txtGhiChu" Height="100" runat="server"></CKEditor:CKEditorControl>
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

        <%--Import Modal--%>
        <div class="modal fade" id="importModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle2" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalScrollableTitle2">Import</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <tr>
                                <td>Upload File: (*)</td>
                                <td>
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <asp:LinkButton ID="btnImportRecord" runat="server" CssClass="btn mauxanh" OnClick="btnImportRecord_Click"><i class="fe-save"></i> Import</asp:LinkButton>
                        <button class="btn mauxam" data-dismiss="modal" aria-hidden="true"><i class="fe-x"></i>Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!--Kết thúc thêm-->

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
                            <div class="modal-body p-4">
                                <%--[MaDuAn], [TenDuAn], [ViTri], [DichVu], [SoHopDong], 
                                    [NgayKy], [BatDau], [KetThuc], [TinhTrang], [QuyMo], 
                                    [HinhAnh], [GhiChu], [MaKhachHang], [HoSoUrl]--%>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Mã Dự Án (*)</label>
                                            <asp:TextBox ID="txtMaDuAn1" CssClass="form-control" runat="server" ReadOnly="True" BackColor="Gray"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Tên Dự Án (*)</label>
                                            <asp:TextBox ID="txtTenDuAn1" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-3" class="control-label">Tình Trạng</label>
                                            <asp:DropDownList ID="cbTinhTrang1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource5_TinhTrang" DataTextField="TenTinhTrang" DataValueField="MaSo"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-4" class="control-label">Khách Hàng</label>
                                            <asp:DropDownList ID="cbKhachHang1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3_KhachHang" DataTextField="TenKhachHang" DataValueField="MaKhachHang"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-5" class="control-label">Hình Ảnh</label>
                                            <asp:TextBox ID="txtHinhAnh1" CssClass="form-control" runat="server"></asp:TextBox>
                                            <div class="input-group-btn mt-2">
                                                <asp:HyperLink ID="uploadlink1" runat="server" CssClass="btn btn btn-primary" NavigateUrl="./A_Upload.aspx" Target="_blank"><i class="fe-link"></i> Get Link</asp:HyperLink>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="field-6" class="control-label">Hồ Sơ</label>
                                        <asp:TextBox ID="txtHoSo1" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-7" class="control-label">Vị Trí (*)</label>
                                            <asp:TextBox ID="txtViTri1" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-8" class="control-label">Dịch Vụ</label>
                                            <asp:TextBox ID="txtDichVu1" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-9" class="control-label">Số Hợp Đồng</label>
                                            <asp:TextBox ID="txtSoHopDong1" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-10" class="control-label">Ngày Ký</label>
                                            <asp:TextBox ID="txtNgayKy1" CssClass="form-control" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtNgayKy1_CalendarExtender" TargetControlID="txtNgayKy1" ID="txtNgayKy1_CalendarExtender" Format="yyyy/MM/dd"></ajaxToolkit:CalendarExtender>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-11" class="control-label">Ngày Bắt Đầu</label>
                                            <asp:TextBox ID="txtBatDau1" CssClass="form-control" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtBatDau1_CalendarExtender" TargetControlID="txtBatDau1" ID="txtBatDau1_CalendarExtender" Format="yyyy/MM/dd"></ajaxToolkit:CalendarExtender>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-12" class="control-label">Ngày Kết Thúc</label>
                                            <asp:TextBox ID="txtKetThuc1" CssClass="form-control" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender runat="server" BehaviorID="txtKetThuc1_CalendarExtender" TargetControlID="txtKetThuc1" ID="txtKetThuc1_CalendarExtender" Format="yyyy/MM/dd"></ajaxToolkit:CalendarExtender>
                                        </div>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="field-13" class="control-label">Quy Mô</label>
                                        <CKEditor:CKEditorControl ID="txtQuyMo1" Height="100" runat="server"></CKEditor:CKEditorControl>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group no-margin">
                                            <label for="field-14" class="control-label">Ghi Chú</label>
                                        <CKEditor:CKEditorControl ID="txtGhiChu1" Height="100" runat="server"></CKEditor:CKEditorControl>
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
        <!--Kết thúc xóa -->
        <div>
            <asp:SqlDataSource ID="SqlDataSource1_DuAn" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT MaDuAn, TenDuAn, ViTri, DichVu, SoHopDong, NgayKy, BatDau, KetThuc, TinhTrang, QuyMo, HinhAnh, GhiChu, MaKhachHang, HoSoUrl FROM dts00_DuAn ORDER BY MaDuAn DESC" DeleteCommand="DELETE FROM [dts00_DuAn] WHERE [MaDuAn] = @MaDuAn" InsertCommand="INSERT INTO [dts00_DuAn] ([MaDuAn], [TenDuAn], [ViTri], [DichVu], [SoHopDong], [NgayKy], [BatDau], [KetThuc], [TinhTrang], [QuyMo], [HinhAnh], [GhiChu], [MaKhachHang], [HoSoUrl]) VALUES (@MaDuAn, @TenDuAn, @ViTri, @DichVu, @SoHopDong, @NgayKy, @BatDau, @KetThuc, @TinhTrang, @QuyMo, @HinhAnh, @GhiChu, @MaKhachHang, @HoSoUrl)" UpdateCommand="UPDATE [dts00_DuAn] SET [TenDuAn] = @TenDuAn, [ViTri] = @ViTri, [DichVu] = @DichVu, [SoHopDong] = @SoHopDong, [NgayKy] = @NgayKy, [BatDau] = @BatDau, [KetThuc] = @KetThuc, [TinhTrang] = @TinhTrang, [QuyMo] = @QuyMo, [HinhAnh] = @HinhAnh, [GhiChu] = @GhiChu, [MaKhachHang] = @MaKhachHang, [HoSoUrl] = @HoSoUrl WHERE [MaDuAn] = @MaDuAn">
                <DeleteParameters>
                    <asp:Parameter Name="MaDuAn" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MaDuAn" Type="String" />
                    <asp:Parameter Name="TenDuAn" Type="String" />
                    <asp:Parameter Name="ViTri" Type="String" />
                    <asp:Parameter Name="DichVu" Type="String" />
                    <asp:Parameter Name="SoHopDong" Type="String" />
                    <asp:Parameter DbType="Date" Name="NgayKy" />
                    <asp:Parameter DbType="Date" Name="BatDau" />
                    <asp:Parameter DbType="Date" Name="KetThuc" />
                    <asp:Parameter Name="TinhTrang" Type="Int32" />
                    <asp:Parameter Name="QuyMo" Type="String" />
                    <asp:Parameter Name="HinhAnh" Type="String" />
                    <asp:Parameter Name="GhiChu" Type="String" />
                    <asp:Parameter Name="MaKhachHang" Type="Int32" />
                    <asp:Parameter Name="HoSoUrl" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TenDuAn" Type="String" />
                    <asp:Parameter Name="ViTri" Type="String" />
                    <asp:Parameter Name="DichVu" Type="String" />
                    <asp:Parameter Name="SoHopDong" Type="String" />
                    <asp:Parameter DbType="Date" Name="NgayKy" />
                    <asp:Parameter DbType="Date" Name="BatDau" />
                    <asp:Parameter DbType="Date" Name="KetThuc" />
                    <asp:Parameter Name="TinhTrang" Type="Int32" />
                    <asp:Parameter Name="QuyMo" Type="String" />
                    <asp:Parameter Name="HinhAnh" Type="String" />
                    <asp:Parameter Name="GhiChu" Type="String" />
                    <asp:Parameter Name="MaKhachHang" Type="Int32" />
                    <asp:Parameter Name="HoSoUrl" Type="String" />
                    <asp:Parameter Name="MaDuAn" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2_ChiTietDuAn" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" DeleteCommand="DELETE FROM [dts00_DuAn] WHERE [MaDuAn] = @MaDuAn" InsertCommand="INSERT INTO [dts00_DuAn] ([MaDuAn], [TenDuAn], [ViTri], [DichVu], [SoHopDong], [NgayKy], [BatDau], [KetThuc], [TinhTrang], [QuyMo], [HinhAnh], [GhiChu], [MaKhachHang], [HoSoUrl]) VALUES (@MaDuAn, @TenDuAn, @ViTri, @DichVu, @SoHopDong, @NgayKy, @BatDau, @KetThuc, @TinhTrang, @QuyMo, @HinhAnh, @GhiChu, @MaKhachHang, @HoSoUrl)" SelectCommand="SELECT * FROM [dts00_DuAn] WHERE ([MaDuAn] = @MaDuAn)" UpdateCommand="UPDATE [dts00_DuAn] SET [TenDuAn] = @TenDuAn, [ViTri] = @ViTri, [DichVu] = @DichVu, [SoHopDong] = @SoHopDong, [NgayKy] = @NgayKy, [BatDau] = @BatDau, [KetThuc] = @KetThuc, [TinhTrang] = @TinhTrang, [QuyMo] = @QuyMo, [HinhAnh] = @HinhAnh, [GhiChu] = @GhiChu, [MaKhachHang] = @MaKhachHang, [HoSoUrl] = @HoSoUrl WHERE [MaDuAn] = @MaDuAn">
                <DeleteParameters>
                    <asp:Parameter Name="MaDuAn" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MaDuAn" Type="String" />
                    <asp:Parameter Name="TenDuAn" Type="String" />
                    <asp:Parameter Name="ViTri" Type="String" />
                    <asp:Parameter Name="DichVu" Type="String" />
                    <asp:Parameter Name="SoHopDong" Type="String" />
                    <asp:Parameter DbType="Date" Name="NgayKy" />
                    <asp:Parameter DbType="Date" Name="BatDau" />
                    <asp:Parameter DbType="Date" Name="KetThuc" />
                    <asp:Parameter Name="TinhTrang" Type="Int32" />
                    <asp:Parameter Name="QuyMo" Type="String" />
                    <asp:Parameter Name="HinhAnh" Type="String" />
                    <asp:Parameter Name="GhiChu" Type="String" />
                    <asp:Parameter Name="MaKhachHang" Type="Int32" />
                    <asp:Parameter Name="HoSoUrl" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="MaDuAn" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TenDuAn" Type="String" />
                    <asp:Parameter Name="ViTri" Type="String" />
                    <asp:Parameter Name="DichVu" Type="String" />
                    <asp:Parameter Name="SoHopDong" Type="String" />
                    <asp:Parameter DbType="Date" Name="NgayKy" />
                    <asp:Parameter DbType="Date" Name="BatDau" />
                    <asp:Parameter DbType="Date" Name="KetThuc" />
                    <asp:Parameter Name="TinhTrang" Type="Int32" />
                    <asp:Parameter Name="QuyMo" Type="String" />
                    <asp:Parameter Name="HinhAnh" Type="String" />
                    <asp:Parameter Name="GhiChu" Type="String" />
                    <asp:Parameter Name="MaKhachHang" Type="Int32" />
                    <asp:Parameter Name="HoSoUrl" Type="String" />
                    <asp:Parameter Name="MaDuAn" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3_KhachHang" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT [MaKhachHang], [TenKhachHang] FROM [mkt_KhachHang] ORDER BY [TenKhachHang]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource5_TinhTrang" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" SelectCommand="SELECT * FROM [dts00_TinhTrangDuAn]"></asp:SqlDataSource>
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